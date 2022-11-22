using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;

public class DialogueManager : MonoBehaviour
{
    public KeyCode interactKey;
    public GameObject dialoguePanel;
    public TextMeshProUGUI dialogueText;
    public Story currentStory;
    public bool dialogueIsPlaying;
    private static DialogueManager instance;
    public TextAsset inkJSON;

    public GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    // Start is called before the first frame update
    private void Awake()
    {
        if (instance != null)
        {
            Debug.LogWarning("Found more than one Dialogue Manager in the scene");
        }
        instance = this;
        
        currentStory = new Story(inkJSON.text);
        currentStory.ChoosePathString("chapter1");

    }

    public static DialogueManager GetInstance()
    {
        return instance;
    }

    private void Start()
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
            DisplayChoices();
        }
        else
        {
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
    
        StartCoroutine(SelectFirstChoice());
    }

    private IEnumerator SelectFirstChoice() {
        EventSystem.current.SetSelectedGameObject(null);
        yield return new WaitForEndOfFrame();
        EventSystem.current.SetSelectedGameObject(choices[0].gameObject);
    }
}
