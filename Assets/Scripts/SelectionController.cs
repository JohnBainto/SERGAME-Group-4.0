using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectionController : MonoBehaviour
{
    public void Select(int choice) {
        DialogueManager.GetInstance().MakeChoiceThenContinue(choice);
    }

    public void Interact() {
        DialogueManager.GetInstance().EnterDialogueMode();
    }
}
