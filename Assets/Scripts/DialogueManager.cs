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
    public KeyCode interactKey;
    public GameObject dialoguePanel;

    public TextMeshProUGUI dialogueText;
    public TextMeshProUGUI displayNameText;

    public Story currentStory;
    public bool dialogueIsPlaying;
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

        if (Input.GetKeyDown(interactKey))
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
            dialogueText.text = currentStory.Continue(); //pop a line off the stack
            Debug.Log("Text: " + dialogueText.text);
            DisplayChoices();
            HandleTags();
            HandleScenes();
        }
        else
        {
            ExitDialogueMode();
        }
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
            case "BLACK": 
                sceneName = "CH01_EXP_BLACK";
                break;
            case "OUTSIDE":
                sceneName = "CH01_EXP_OUTSIDE";
                break;
            case "INSIDE":
                sceneName = "CH01_EXP_INSIDE";
                break;
            case "PIER":
                sceneName = "CH01_EXP_PIER";
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

    private IEnumerator SelectFirstChoice() {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }

    public void MakeChoice (int choiceIndex) {
        currentStory.ChooseChoiceIndex(choiceIndex);
    }

    public void MakeChoiceThenContinue (int choiceIndex) {
        currentStory.ChooseChoiceIndex(choiceIndex);
        EnterDialogueMode();
    }
}
