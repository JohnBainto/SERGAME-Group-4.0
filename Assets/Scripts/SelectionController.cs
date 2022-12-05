using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectionController : MonoBehaviour
{
    public void Select(int choice) {
        DialogueManagerExploration.GetInstance().MakeChoiceThenContinue(choice);
    }

    public void SelectThenHide(int choice) {
        DialogueManagerExploration.GetInstance().MakeChoiceThenContinue(choice);
        gameObject.SetActive(false);
        GameObject.Find(gameObject.name + " Prompt").SetActive(false);
    }

    public void Interact() {
        DialogueManagerExploration.GetInstance().EnterDialogueMode();
    }
}
