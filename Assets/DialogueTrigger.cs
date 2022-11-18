using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DialogueTrigger : MonoBehaviour
{
    public Dialogue _dialogue;
    [Header("Ink JSON")]
    [SerializeField] private TextAsset inkJSON;
    public void TriggerDialogue () {
        Debug.Log(inkJSON.text);
        FindObjectOfType<DialogueManager>().EnterDialogueMode(inkJSON);
        // FindObjectOfType<DialogueManager>().StartDialogue(_dialogue);
        
    }
}
