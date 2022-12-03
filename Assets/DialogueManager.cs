using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using System.Linq;
using UnityEngine.EventSystems;
using System;

public class DialogueManager : MonoBehaviour
{
    // Access to Dialogue Manager Inspector
    [Header("Dialogue UI")]                                     
    TrackSelectedWord trackSelectedWord;
    [SerializeField] GameObject dialogueBox;
    [SerializeField] GameObject startBattleBtn;         // startBattle button
    [SerializeField] public TextMeshProUGUI normalDialogue;    // Normal Text
    [SerializeField] public TextMeshProUGUI battleDialogue;    // Battle Text  
    [SerializeField] TextMeshProUGUI speakerName;       // Speaker Name
    [SerializeField] TextAsset inkJSON;                 // main.ink --> Game Script
    [SerializeField] string pathString;          
    [SerializeField] public GameObject continueButton;
    [SerializeField] public GameObject consultButton;          // consult button
    // Other important attributes
    public Story currentStory;                                 // Tracker for which ink file is currently in use
    private string currentLine; 
    private string bossBattleName;                                // Tracker for which lineis currently being said in the game
    public bool dialogueIsPlaying;                              // Tracker for if the dialogue is active
    private static DialogueManager instance;
    public List<string> tags;
    public KeyCode interactKey;
    private bool canContinueToNext = false;
    private Coroutine displayLineCoroutine;

    [Header("Choices UI")]   
    [SerializeField] public GameObject[] normalChoices;
    [SerializeField] public GameObject[] battleChoices;
    private TextMeshProUGUI[] normalChoicesText;
    private TextMeshProUGUI[] battleChoicesText;

    // Win or Lose Screen
    public LoseScreen loseScreen;
    public WinScreen winScreen;

    // Codex Screen
    public CodexScreen codexScreen;
    public string ch0_evidences;
    public string ch1_evidences;
    public string ch2_evidences;

    // Start is called before the first frame update
    private void Start() 
    {
        Destroy(GameObject.FindWithTag("Dialogue"));

        StartCoroutine(ClearText());
        currentStory = new Story(inkJSON.text);
        currentStory.ChoosePathString(pathString);
        List<string> tags = new List<string>();
        // Get all normal choices
        normalChoicesText = new TextMeshProUGUI[normalChoices.Length];
        int index = 0;
        foreach(GameObject nChoice in normalChoices)
        {
            normalChoicesText[index] = nChoice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }

        //Get all battle choices
        battleChoicesText = new TextMeshProUGUI[battleChoices.Length];
        index = 0;
        foreach(GameObject bChoice in battleChoices)
        {
            battleChoicesText[index] = bChoice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
        StartDialogue();                                       
    }

    // Tracks if there are multiple instances of the dialogue manager in a scene.
    private void Awake()
    {
        trackSelectedWord = GameObject.Find("Mouse Tracker").GetComponent<TrackSelectedWord>();
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");
            Destroy(gameObject);
            return;
        }
        instance = this;
    }

    public void Update() 
    {
        if(!dialogueIsPlaying)
        {
            return;
        }
        if (canContinueToNext && Input.GetKeyDown(interactKey))
        {
            StartDialogue();
        }
    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    // Typing effect: Types each character in a sentence.
    IEnumerator TypeLine(string line, bool isBattle) 
    {
        //clear
        normalDialogue.text = "";
        battleDialogue.text = " ";
        // hide items
        HideChoices(battleChoices);
        HideChoices(normalChoices);
        continueButton.SetActive(false);
        canContinueToNext = false;
        bool isAddingRichTextTag = false;
        
        foreach(char c in line.ToCharArray())
        {
            if(Input.GetKeyDown(interactKey))
            {
                normalDialogue.text = line;
                break;
            }
            if (c == '<' || isAddingRichTextTag) 
            {
                isAddingRichTextTag = true;
                normalDialogue.text += c;
                if (c == '>') 
                {
                    isAddingRichTextTag = false;
                }
            } 
            else 
            {
                normalDialogue.text += c;
                yield return new WaitForSeconds(0.04f);
            }
        }
        if(isBattle) 
        {
            battleDialogue.text = line;
        }

        canContinueToNext = true;
    }

    // Start of the dialogue
    public void StartDialogue()
    {
        // hide items
        HideChoices(battleChoices);
        HideChoices(normalChoices);
        continueButton.SetActive(false);
        consultButton.SetActive(false);
        
        canContinueToNext = false;
        dialogueIsPlaying = true;
        ContinueStory();
    } 

    // End of the dialogue
    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
        StartCoroutine(ClearText());
        Debug.Log("End of battle.");
    }

    // Continues the dialogue (if there are more in the script)
    public void ContinueStory()
    {
        if(currentStory.canContinue)
        {
            trackSelectedWord._parts = new List<TMP_LinkInfo>();
            currentLine = "";
            currentLine = currentStory.Continue();
            Debug.Log(currentLine);
            tags = currentStory.currentTags;
            
            HandleNameTags(tags);
            
            if(tags[0].Contains("LOAD CODEX"))
            {
                ch0_evidences = currentStory.variablesState["ch0_evidence"].ToString();
                ch1_evidences = currentStory.variablesState["ch1_evidence"].ToString();
                ch2_evidences = currentStory.variablesState["ch2_evidence"].ToString();
                
                codexScreen.loadCodexPages(ch0_evidences, ch1_evidences, ch2_evidences, pathString);
            }
            
            if(tags[0].Contains("QSTART")) 
            { 
                Debug.Log("BATTLE " + currentLine);
                startBattleBtn.SetActive(false);    
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,true));
                DisplayChoices(battleChoices,battleChoicesText);
                consultButton.SetActive(true);
                continueButton.SetActive(false);
            }

            else 
            {
                Debug.Log("NORMAL " + currentLine);
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,false));   
                
                DisplayChoices(normalChoices,normalChoicesText);
                if (!startBattleBtn.activeSelf)
                    continueButton.SetActive(true);    
                consultButton.SetActive(false);
            }
            HandleScenes();
        }
        else
        {
            ExitDialogueMode();
        }
    }

    // Retrieves the choices from the ink script
    private void DisplayChoices(GameObject[] choices, TextMeshProUGUI[] choicesText)
    {
        List<Choice> currentChoices = currentStory.currentChoices;
        
        // checks if ui can support the number of choices from the ink file
        if (currentChoices.Count > choices.Length) {
            Debug.LogError("More choices were given than the UI can support. Number of choices given: " + currentChoices.Count);
        }
        
        int index = 0;
        // enable and initialize the choices up to the amount of choices for this line of dialogue
        foreach (Choice choice in currentChoices) {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }
        // The remaining choices are hidden
        for (int i = index; i < choices.Length; i++) {
            choices[i].gameObject.SetActive(false);
        }
        
        if (currentChoices.Count > 0) {
            StartCoroutine(SelectFirstChoice(choices));
        }
    }

    private void HideChoices(GameObject[] choices) {
        foreach (GameObject choiceButton in choices) {
            choiceButton.SetActive(false);
        }
    }

    private IEnumerator SelectFirstChoice(GameObject[] choices) {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice (int choiceIndex) {
        Debug.Log("choiceIndex: " + choiceIndex);           
        if (canContinueToNext) { 
            currentStory.ChooseChoiceIndex(choiceIndex);
            currentStory.EvaluateFunction("set_turn", 1);
        }
    }

    IEnumerator ClearText() 
    {
        while(true)
        {
            speakerName.text = " ";
            normalDialogue.text = "";
            battleDialogue.text = " ";
            yield return new WaitForSeconds(1.0f);
        }
    }

    // Handle the Speaker names to be placed in the dialogue 
    // by checking the tags from the ink file
    private void HandleNameTags(List<string> curTags) 
    {
        if (curTags.Count > 0) 
        {
            string tag = curTags[0].Trim();
            Debug.Log("WHAT TAG: "+tag);
            if(tag.Contains("KIT")) {
                bossBattleName = "Kit Balang";
                speakerName.text = "Kit says...";
            } else if(tag.Contains("AMY")) {
                speakerName.text = "Amy says...";
            }
            else if(tag.Contains("HATTIE")) {
                bossBattleName = "Hattie Haute";
                speakerName.text = "Hattie says..."; 
            }
            else if(tag.Contains("KOI")) {
                bossBattleName = "Koi Ignacio";
                speakerName.text = "Koi says...";
            }
            else if(tag.Contains("NARRATOR"))
                speakerName.text = "Narrator says...";
            else
                Debug.LogWarning("This tag does not have a character name: " + tag);
        }
    }

    public void HandleScenes() {
        string sceneName = currentStory.variablesState["_result"].ToString();
        Debug.Log("BG: " + currentStory.variablesState["_result"].ToString());

        if (sceneName == "LOSE") {
            loseScreen.Setup();
        }
        else if (sceneName == "WIN") {
            winScreen.Setup(bossBattleName);
        }
        else {
            Debug.Log("Battle not yet done.");
        }
    }   
}