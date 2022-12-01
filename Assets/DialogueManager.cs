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
    [SerializeField] private GameObject dialogueBox;
    [SerializeField] private GameObject startBattleBtn;         // startBattle button
    [SerializeField] private TextMeshProUGUI normalDialogue;    // Normal Text
    [SerializeField] private TextMeshProUGUI battleDialogue;    // Battle Text  
    [SerializeField] private TextMeshProUGUI speakerName;       // Speaker Name
    [SerializeField] private TextMeshProUGUI selectedWords;     // List of Selected Words
    [SerializeField] private TextAsset inkJSON;                 // main.ink --> Game Script
    public string pathString;          
    [SerializeField] private GameObject continueIcon;
    // [SerializeField] private GameObject consultBattleBtn;                           
    // Other important attributes
    private Story currentStory;                                 // Tracker for which ink file is currently in use
    private string currentLine;                                 // Tracker for which lineis currently being said in the game
    public bool dialogueIsPlaying;                              // Tracker for if the dialogue is active
    private static DialogueManager instance;
    
    public KeyCode interactKey;
    private bool canContinueToNext = false;
    private Coroutine displayLineCoroutine;

    [Header("Choices UI")]   
    [SerializeField] public GameObject[] normalChoices;
    [SerializeField] public GameObject[] battleChoices;
    private TextMeshProUGUI[] normalChoicesText;
    private TextMeshProUGUI[] battleChoicesText;

    // Start is called before the first frame update
    private void Start() 
    {
        StartCoroutine(ClearText());
        currentStory = new Story(inkJSON.text);                 // Accesses the main ink file
        currentStory.ChoosePathString("ch1_battle");            // goes directly to the Chapter 1 Battle script
        
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
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");
            Destroy(gameObject);
            return;
        }
        instance = this;
        
        currentStory = new Story(inkJSON.text);
        currentStory.ChoosePathString(pathString);
    }

    public void Update() {
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
        // hide items
        HideChoices(battleChoices);
        HideChoices(normalChoices);
        continueIcon.SetActive(false);
        // consultBattleBtn.SetActive(false);
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
            DisplayChoices(battleChoices,battleChoicesText);
            // consultBattleBtn.SetActive(true);
        }
        
        if(!isBattle) 
        {
            DisplayChoices(normalChoices,normalChoicesText);
        }
        continueIcon.SetActive(true);
        canContinueToNext = true;
    }

    // Start of the dialogue
    public void StartDialogue()
    {
        // hide items
        HideChoices(battleChoices);
        HideChoices(normalChoices);
        continueIcon.SetActive(false);
        // consultBattleBtn.SetActive(false);
        
        canContinueToNext = false;
        dialogueIsPlaying = true;
        StartCoroutine(ClearText());
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
            currentLine = "";
            currentLine = currentStory.Continue();
            List<string> tags = currentStory.currentTags;
            HandleNameTags(tags);
            
            if(tags[0] == "KIT QSTART") 
            { 
                Debug.Log("BATTLE " + currentLine);
                startBattleBtn.SetActive(false);    
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,true));
                DisplayChoices(battleChoices,battleChoicesText);
            }
            else 
            {
                Debug.Log("NORMAL " + currentLine);
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,false));    
                DisplayChoices(normalChoices,normalChoicesText);           
            }
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
            StartDialogue();
        }
    }

    IEnumerator ClearText() 
    {
        while(true)
        {
            speakerName.text = " ";
            selectedWords.text = " ";
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
                speakerName.text = "Kit says...";
            } else if(tag.Contains("AMY"))
                speakerName.text = "Amy says...";
            else if(tag.Contains("HATTIE"))
                speakerName.text = "Hattie says..."; 
            else if(tag.Contains("KOI"))
                speakerName.text = "Koi says...";
            else if(tag.Contains("NARRATOR"))
                speakerName.text = "Narrator says...";
            else
                Debug.LogWarning("This tag does not have a character name: " + tag);
        }
    }
}