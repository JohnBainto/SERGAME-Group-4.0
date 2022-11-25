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
    [SerializeField] private GameObject startButton;
    [SerializeField] private TextMeshProUGUI dText;
    private Story currentStory; // tracker for which ink file is currently in use
    private bool dialogueIsPlaying;
    private static DialogueManager instance;
    
    // Start is called before the first frame update
    private void Start() {
        //sentences = new Queue<string>(); 
        dialogueIsPlaying = false;
        dialogueBox.SetActive(false);
    }

    // Typing each character in a sentence.
    IEnumerator TypeLine(string line) {
        dText.text = "";
        // Typing each character
        foreach(char c in line.ToCharArray())
        {
            dText.text +=c;
            yield return new WaitForSeconds(0.025f);
        }
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
        startButton.SetActive(false);
        currentStory = new Story(inkJSON.text);
        currentStory.ChoosePathString("ch1_battle");
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
            StopAllCoroutines();
            StartCoroutine(TypeLine(currentLine));
        }
        else
        {
            ExitDialogueMode();
        }
    }

}

