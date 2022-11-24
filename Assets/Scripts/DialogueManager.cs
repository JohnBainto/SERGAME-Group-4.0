using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class DialogueManager : MonoBehaviour
{
    public float typingSpeed;

    public KeyCode interactKey;
    public GameObject dialoguePanel;

    public TextMeshProUGUI dialogueText;
    public TextMeshProUGUI displayNameText;

    public Story currentStory;
    public bool dialogueIsPlaying;

    private bool canContinueToNext;
    private Coroutine displayLineCoroutine;

    private static DialogueManager instance;
    public TextAsset inkJSON;
    public string pathString;

    public GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    // Start is called before the first frame update
    private void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");
            Destroy(gameObject);
            return;
        }
        instance = this;
        DontDestroyOnLoad(gameObject);
        
        currentStory = new Story(inkJSON.text);
        currentStory.ChoosePathString(pathString);
    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    private void OnEnable()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        canContinueToNext = false;

        choicesText = new TextMeshProUGUI[choices.Length];
        int index = 0;
        foreach(GameObject choice in choices) {
            choicesText[index] = choice.GetComponentInChildren<TextMeshProUGUI>();
            index++;
        }
    }

    private void Update()
    {
        if (!dialogueIsPlaying)
        {
            return;
        }

        if (canContinueToNext && Input.GetKeyDown(interactKey))
        {
            ContinueStory();
            HandleInteractable();
        }
    }

    public void EnterDialogueMode()
    {
        dialogueIsPlaying = true;
        dialoguePanel.SetActive(true);

        ContinueStory();
    }

    private void ExitDialogueMode()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);
        dialogueText.text = "";
    }

    private void ContinueStory()
    {

        if (currentStory.canContinue)
        {
            if (displayLineCoroutine != null) {
                StopCoroutine(displayLineCoroutine);
            }
            displayLineCoroutine = StartCoroutine(DisplayLine(currentStory.Continue())); //pop a line off the stack
            Debug.Log("Text: " + dialogueText.text);
            
            HandleTags();
            HandleScenes();
        }
        else
        {
            ExitDialogueMode();
        }
    }

    private IEnumerator DisplayLine(string line) {
        dialogueText.text = "";

        HideChoices();

        canContinueToNext = false;

        bool isAddingRichTextTag = false;

        foreach(char letter in line.ToCharArray()) {

            // if(Input.GetKeyDown(interactKey)) {
            //     dialogueText.text = line;
            //     break;
            // }

            if (letter == '<' || isAddingRichTextTag) {
                isAddingRichTextTag = true;
                dialogueText.text += letter;
                if (letter == '>') {
                    isAddingRichTextTag = false;
                }
            } else {
                dialogueText.text += letter;
                yield return new WaitForSeconds(typingSpeed);
            }

        }

        DisplayChoices();

        canContinueToNext = true;
    }

    private void HandleTags() {
        List<string> currentTags = currentStory.currentTags;
        if (currentTags.Count > 0 && displayNameText != null) {
            displayNameText.text = currentTags[0];
        }
    }

    public void HandleScenes() {
        string sceneName = "";
        Debug.Log("BG: " + currentStory.variablesState["BG"].ToString());
        switch (currentStory.variablesState["BG"].ToString())
        {
            case "PROLOGUE": 
                sceneName = "PROLOGUE";
                break;
            case "MENU": 
                sceneName = "MENU";
                break;
            case "CH01_EXP_BLACK": 
                sceneName = "CH01_EXP_BLACK";
                break;
            case "CH01_EXP_OUTSIDE":
                sceneName = "CH01_EXP_OUTSIDE";
                break;
            case "CH01_EXP_INSIDE":
                sceneName = "CH01_EXP_INSIDE";
                break;
            case "CH01_EXP_PIER":
                sceneName = "CH01_EXP_PIER";
                break;
            case "CH01_EXP_BASEMENT":
                sceneName = "CH01_EXP_BASEMENT";
                break;
            case "BATTLE":
                sceneName = "BattlePhase";
                break;
            case "CH02_EXP_BLACK":
                sceneName = "CH02_EXP_BLACK";
                break;
            case "CH02_EXP_BASEMENT":
                sceneName = "CH02_EXP_BASEMENT";
                break;
            case "CH02_EXP_HALLWAY":
                sceneName = "CH02_EXP_HALLWAY";
                break;
            default:
                sceneName = "";
                break;
        }

        if (SceneManager.GetActiveScene().name != sceneName) {
            SceneManager.LoadScene(sceneName);
        }
    }

    public void HandleInteractable() {
        Debug.Log("INTERACTABLE: " + currentStory.variablesState["INTERACTIBLE"].ToString());
        if (bool.Parse(currentStory.variablesState["INTERACTIBLE"].ToString())) {
            ExitDialogueMode();
        }
    }

    private void DisplayChoices() {
        List<Choice> currentChoices = currentStory.currentChoices;

        if (currentChoices.Count > choices.Length) {
            Debug.LogError("More choices were given than the UI can support. Number of choices given: " + currentChoices.Count);
        }
        
        int index = 0;
        foreach (Choice choice in currentChoices) {
            choices[index].gameObject.SetActive(true);
            choicesText[index].text = choice.text;
            index++;
        }

        for (int i = index; i < choices.Length; i++) {
            choices[i].gameObject.SetActive(false);
        }
        
        if (currentChoices.Count > 0) {
            StartCoroutine(SelectFirstChoice());
        }
    }

    private void HideChoices() {
        foreach (GameObject choiceButton in choices) {
            choiceButton.SetActive(false);
        }
    }

    private IEnumerator SelectFirstChoice() {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice (int choiceIndex) {
        if (canContinueToNext) {
            currentStory.ChooseChoiceIndex(choiceIndex);
        }
    }

    public void MakeChoiceThenContinue (int choiceIndex) {
        currentStory.ChooseChoiceIndex(choiceIndex);
        EnterDialogueMode();
    }
}
