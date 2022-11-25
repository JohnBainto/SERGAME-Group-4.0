using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectionController : MonoBehaviour
{
    public void Select(int choice) {
        DialogueManagerExploration.GetInstance().MakeChoiceThenContinue(choice);
    }

    public void Interact() {
        DialogueManagerExploration.GetInstance().EnterDialogueMode();
    }
}
