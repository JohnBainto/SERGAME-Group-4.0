using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class DialogueManager : MonoBehaviour
{
    public TextMeshProUGUI nameText;
    public TextMeshProUGUI dialogueText;
    public Queue<string> sentences;
    
    // Start is called before the first frame update
    void Start() {
        sentences = new Queue<string>(); 
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

    public void StartDialogue (Dialogue dialogue) {
        
        Debug.Log("Convo with" + dialogue.SpeakerName);
        nameText.text = dialogue.SpeakerName;
        sentences.Clear(); // to clear any sentences from the previous conversation

        foreach (string sentence in dialogue.Lines) {
            sentences.Enqueue(sentence);
        }

        DisplayNextSentence();
    }
    
    void DisplayNextSentence () {
        if (Input.GetMouseButtonDown(0)) {
            if (sentences.Count == 0) {
                EndDialogue();
                return;
            }

            string sentence = sentences.Dequeue();
            StopAllCoroutines();
            StartCoroutine(TypeLine(sentence));
        }
    }

    void EndDialogue() {
        Debug.Log("End of battle.");
    }
}

