using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
// with inky
    [Header("Dialogue UI")] // Access to dialogue panel
    [SerializeField] private GameObject dialogueBox;
    [SerializeField] private TextMeshProUGUI dText;
    private Story currentStory; // tracker for which ink file is currently in use
    private bool dialogueIsPlaying;
    private static DialogueManager instance;
//w/o inky
    public TextMeshProUGUI nameText;
    public TextMeshProUGUI dialogueText;
    public Queue<string> sentences;
    // public UnityEvent onMouceClicked;
    
    // Start is called before the first frame update
    private void Start() {
        sentences = new Queue<string>(); 
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
    }



    // Typing each character in a sentence.
    IEnumerator TypeLine(string line) {
        dialogueText.text = "";
        // Typing each character
        foreach(char c in line.ToCharArray())
        {
            dialogueText.text +=c;
            yield return null;
        }
    }
// without inky
    public void StartDialogue (Dialogue dialogue) {
        dialogueIsPlaying = true;
        dialogueBox.SetActive(true);
        Debug.Log("Convo with " + dialogue.SpeakerName);
        nameText.text = dialogue.SpeakerName + " says";
        sentences.Clear(); // to clear any sentences from the previous conversation

        foreach (string sentence in dialogue.Lines) {
            sentences.Enqueue(sentence);
        }

        DisplayNextSentence();
    }
    
    public void DisplayNextSentence () {
        Debug.Log(sentences.Count);
        if (sentences.Count == 0) {
            EndDialogue();
            return;
        }

        string sentence = sentences.Dequeue();
        StopAllCoroutines();
        StartCoroutine(TypeLine(sentence));
    }

    public void EndDialogue() {
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
        //dialogueText.text = "";
        Debug.Log("End of battle.");
    }

// with inky
    // private void Update()
    // {
    //     if(!dialogueIsPlaying)
    //     {
    //         return;
    //     }
    //     else
        
    //     if(InputManager.GetInstance().GetSubmitPressed())
    //     {
    //         ContinueStory();
    //     }
    // }
    private void Awake()
    {
        if(instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene.");
        }
        instance = this;
    }

    public void EnterDialogueMode(TextAsset inkJSON)
    {
        currentStory = new Story(inkJSON.text);
        dialogueIsPlaying = true;
        dialogueBox.SetActive(true);
        ContinueStory();
    } 

    public void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
        dText.text = "";
        Debug.Log("End of battle.");
    }

    public void ContinueStory()
    {
        if(currentStory.canContinue)
        {
            string currentLine = currentStory.Continue();
            dText.text = currentLine;
            //StopAllCoroutines();
            //StartCoroutine(TypeLine(currentLine));
        }
        else
        {
            ExitDialogueMode();
        }
    }

}

