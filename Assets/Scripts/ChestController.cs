using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChestController : MonoBehaviour
{
    public bool isOpen;
    public string chestName;

    public void OpenChest() {
        if (!isOpen) {
            isOpen = true;
            DialogueManager.GetInstance().EnterDialogueMode();
            Debug.Log(chestName + " is now open");
        }
    }
}
