using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class DialogueManager : MonoBehaviour
{
    public Text nameText;
    public Text dialogueText;
    public Queue<string> lines;
    // Start is called before the first frame update
    void Start()
    {
        sentences = new Queue<string>(); 
    }

    // Typing each character in a sentence.
    IEnumerator TypeLine(string line)
    {
        dialogueText.text = "";
        // Typing each character
        foreach(char c in lines.ToCharArray())
        {
            dialogueText.text +=c;
            yield return null;
        }
    }

    public void StartDialogue (Dialogue dialogue) {
        
        nameText.text = dialogue.SpeakerName;
        sentences.Clear(); // to clear any sentences from the previous conversation

        foreach (string sentence in dialogue.sentences) 
        {
            sentences.Enqueue(sentence);
        }

        DisplayNextSentence();

        void DisplayNextSentence () 
        {
            if (Input.GetMouseButtonDown(0)) {
                if (sentences.Count == 0)
                {
                    EndDialogue();
                    return;
                }

                string sentence = sentences.Dequeue();
                StopAllCoroutines();
                StartCoroutine(TypeLine(line));
            }
        }

        void EndDialogue() 
        {
            Debug.Log("End of battle.");
        }
    }
}
