using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using System.Linq;

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

    // Other important attributes
    private Story currentStory;                                 // Tracker for which ink file is currently in use
    private string currentLine;                                 // Tracker for which lineis currently being said in the game
    private bool dialogueIsPlaying;                             // Tracker for if the dialogue is active
    private static DialogueManager instance;
    
    // Start is called before the first frame update
    private void Start() 
    {
        speakerName.text = "";
        selectedWords.text = "";
        normalDialogue.text = "";
        battleDialogue.text = "";
        currentStory = new Story(inkJSON.text);                 // Accesses the main ink file
        currentStory.ChoosePathString("ch1_battle");            // goes directly to the Chapter 1 Battle script
        StartDialogue();                                        
    }

    // Tracks if there are multiple instances of the dialogue manager in a scene.
    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene.");
        }
        instance = this;
    }

    // Typing effect: Types each character in a sentence.
    IEnumerator TypeLine(string line, bool isBattle) 
    {
        bool isAddingRichTextTag = false;
        foreach(char c in line.ToCharArray())
        {
            if (c == '<' || isAddingRichTextTag) {
                isAddingRichTextTag = true;
                if (c == '>') {
                    isAddingRichTextTag = false;
                }
            } else {
                normalDialogue.text += c;
                yield return new WaitForSeconds(0.04f);
            }
        }
        if(isBattle)
            battleDialogue.text = line;
    }

    // Start of the dialogue
    public void StartDialogue()
    {
        selectedWords.text = "";
        normalDialogue.text = "";
        battleDialogue.text = "";
        ContinueStory();
    } 

    // End of the dialogue
    public void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
        normalDialogue.text = "";
        battleDialogue.text = "";
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
            
            if(tags[0] == "KIT QSTART") 
            { 
                startBattleBtn.SetActive(false);    
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,true));
            }
            else 
            {
                StopAllCoroutines();
                StartCoroutine(TypeLine(currentLine,false));                
            }
        }
        else
        {
            ExitDialogueMode();
        }
    }
}

