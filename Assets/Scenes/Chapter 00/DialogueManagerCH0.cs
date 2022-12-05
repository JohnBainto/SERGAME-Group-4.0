using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using System.Linq;
using UnityEngine.EventSystems;
using System;

public class DialogueManagerCH0 : MonoBehaviour
{
    // Access to Dialogue Manager Inspector
    [Header("Dialogue UI")]                                     
    TrackSelectedWord trackSelectedWord;
    [SerializeField] GameObject dialogueBox;
    [SerializeField] GameObject startBattleBtn;         // startBattle button
    [SerializeField] Button _startBattleBtn;         // startBattle button
    [SerializeField] public TextMeshProUGUI normalDialogue;    // Normal Text
    [SerializeField] public TextMeshProUGUI battleDialogue;    // Battle Text 
    [SerializeField] TextMeshProUGUI speakerName;       // Speaker Name
    [SerializeField] public TextAsset inkJSON;                 // main.ink --> Game Script
    [SerializeField] string pathString;          
    [SerializeField] public GameObject continueButton;
    [SerializeField] public Button retortButton;
    [SerializeField] public Button skipButton;
    [SerializeField] public GameObject consultButton; 
    [SerializeField] public GameObject continueTutorialButton;        
    // Other important attributes
    public Story currentStory;                                 // Tracker for which ink file is currently in use
    private string currentLine; 
    private string bossBattleName;                                // Tracker for which lineis currently being said in the game
    public bool dialogueIsPlaying;                              // Tracker for if the dialogue is active
    private static DialogueManagerCH0 instance;
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

    // Tutorial Screen
    public TutorialScreen tutorialScreen;
    public CodexTutorialScreen tutorialCodexScreen;

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
        if(trackSelectedWord._parts.Count == 0) 
            retortButton.interactable = false;
        else
            retortButton.interactable = true;
    }

    public static DialogueManagerCH0 GetInstance()
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
        //
        retortButton.interactable = false;
        skipButton.interactable = false;
        foreach(char c in line.ToCharArray())
        {
            AudioManager.instance.Play("Typing");
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
                yield return new WaitForSeconds(0.03f);
            }
        }
        if(isBattle) 
        {
            battleDialogue.text = line;
        }

        canContinueToNext = true;
        //
        retortButton.interactable = true;
        skipButton.interactable = true;
        if(startBattleBtn.activeSelf)
            _startBattleBtn.interactable = true;
    }

    // Start of the dialogue
    public void StartDialogue()
    {
        // hide items
        HideChoices(battleChoices);
        HideChoices(normalChoices);
        startBattleBtn.SetActive(false); 
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
            if(tags[0].Contains("START BATTLE"))
            {
                startBattleBtn.SetActive(true); 
                _startBattleBtn.interactable = false;
            }
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
                continueButton.SetActive(true);
                consultButton.SetActive(true);
            } else if(tags[0].Contains("TUTORIAL")) { 
                
                startBattleBtn.SetActive(false); 
                
                //battleDialogue.enable = false;
                battleDialogue.gameObject.SetActive(false);
                
                if(tags[0].Contains("ONLY CONSULT"))
                {
                    continueButton.SetActive(false);
                } 
                else
                    continueButton.SetActive(true);
                
                if(tags[0].Contains("C TUTORIAL"))
                {
                    tutorialScreen.Destroy();
                    tutorialCodexScreen.Setup(currentLine);
                } else
                {
                    tutorialCodexScreen.Destroy();
                    tutorialScreen.Setup(currentLine);
                }
                Debug.Log("TUTORIAL " + currentLine);   
                DisplayChoices(battleChoices,battleChoicesText);
                if(tags[0] == "TUTORIAL ANSWER") 
                { 
                    //battleDialogue.enable = true;
                    battleDialogue.gameObject.SetActive(true);
                    continueButton.SetActive(false);
                }
            }  else 
            {
                tutorialScreen.Destroy();
                Debug.Log("NORMAL " + currentLine);
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,false));   
                
                DisplayChoices(normalChoices,normalChoicesText);
                if(!startBattleBtn.activeSelf)
                    continueButton.SetActive(true);
                else continueButton.SetActive(false);    
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
            continueButton.SetActive(true);
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
                speakerName.text = "KIT";
            } else if(tag.Contains("AMY")) {
                speakerName.text = "AMY";
            }
            else if(tag.Contains("HATTIE")) {
                bossBattleName = "Hattie Haute";
                speakerName.text = "HATTIE"; 
            }
            else if(tag.Contains("KOI")) {
                bossBattleName = "Koi Ignacio";
                speakerName.text = "KOI";
            }
            else if(tag.Contains("NARRATOR"))
                speakerName.text = "NARRATOR";
            else
                Debug.LogWarning("This tag does not have a character name: " + tag);
        }
    }

    public void HandleScenes() {
        string sceneName = currentStory.variablesState["_result"].ToString();
        Debug.Log("BG: " + currentStory.variablesState["_result"].ToString());

        if (sceneName == "LOSE") {
            loseScreen.Setup(pathString);
        }
        else if (sceneName == "WIN") {
            winScreen.Setup(bossBattleName, pathString);
        }
        else {
            Debug.Log("Battle not yet done.");
        }
    }   

    public void codexTutorialTexts()
    {
        if(tags[0].Contains("ONLY CONSULT"))
        {
            if(codexScreen.activity) {
                ContinueStory();
            }
        } 
    }
    
    public void codexTutorialEnable()
    {
        tags = currentStory.currentTags;
        if(codexScreen.activity && codexScreen.currentPage==1) {
            tutorialCodexScreen.Destroy();
        }else if(codexScreen.activity && tags[0].Trim() == "C TUTORIAL GO BACK"){
            continueTutorialButton.SetActive(false);
        } 
        else if(codexScreen.maxPage == codexScreen.currentPage && tags[0].Trim() == "C TUTORIAL ONLY CONSULT") {
            ContinueStory();
            continueTutorialButton.SetActive(true);
        } 
        else if (tags[0].Trim() == "C TUTORIAL GO BACK")
        {
            tutorialCodexScreen.Destroy();
            ContinueStory();          
        }

    }
}