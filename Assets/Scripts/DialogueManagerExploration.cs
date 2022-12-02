using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using TMPro;
using Ink.Runtime;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class DialogueManagerExploration : MonoBehaviour
{
    public KeyCode interactKey;

    public GameObject dialoguePanel;
    public TextMeshProUGUI dialogueText;

    public TextMeshProUGUI displayNameText;

    public Story currentStory;
    public bool dialogueIsPlaying;

    public float typingSpeed;
    private bool canContinueToNext;
    private Coroutine displayLineCoroutine;

    private static DialogueManagerExploration instance;
    public TextAsset inkJSON;
    public string pathString;

    public GameObject[] choices;
    private TextMeshProUGUI[] choicesText;

    public GameObject itemPanel;
    public TextMeshProUGUI itemText;

    private bool loadingScene;
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

    public static DialogueManagerExploration GetInstance()
    {
        return instance;
    }

    private void OnEnable()
    {
        dialogueIsPlaying = false;
        dialoguePanel.SetActive(false);

        canContinueToNext = false;
        loadingScene = false;

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
            HandleInventory();
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
            
            HandleTags();
            StartCoroutine(HandleScenes());
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

            while(loadingScene) yield return null;

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

    public IEnumerator HandleScenes() {
        string sceneName = currentStory.variablesState["BG"].ToString();
        Debug.Log("BG: " + currentStory.variablesState["BG"].ToString());

        if (sceneName == "BATTLE") {
            sceneName = "BattleScene 1";
        }

        if (SceneManager.GetActiveScene().name != sceneName) {
            loadingScene = true;
            dialoguePanel.SetActive(false);

            Initiate.Fade(sceneName, Color.black, 2.5f);
            yield return new WaitForSeconds(1.0f);

            dialoguePanel.SetActive(true);
            loadingScene = false;
        }
    }

    public void HandleInteractable() {
        Debug.Log("INTERACTABLE: " + currentStory.variablesState["INTERACTABLE"].ToString());
        if (bool.Parse(currentStory.variablesState["INTERACTABLE"].ToString())) {
            ExitDialogueMode();
        }

    }

    public void HandleInventory() {
        Debug.Log("INVENTORY: " + currentStory.variablesState["inventory"].ToString());

        InkList inventory = (InkList) currentStory.variablesState["inventory"];
        if(inventory.Count > 0) {
            itemPanel.SetActive(true);
            itemText.text = "<i>Inventory</i>\n";
            foreach (var item in inventory) {
                string itemName = item.Key.ToString().Split('.')[1];
                Debug.Log(itemName);
                itemText.text += itemName + "\n";
            } 
        } else {
            itemPanel.SetActive(false);
            itemText.text = "";
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
        Debug.Log("choiceIndex: " + choiceIndex);            
        if (canContinueToNext) {
            currentStory.ChooseChoiceIndex(choiceIndex);
        }
    }

    public void MakeChoiceThenContinue (int choiceIndex) {
        currentStory.ChooseChoiceIndex(choiceIndex);
        EnterDialogueMode();
    }
}
