using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadDialogue: MonoBehaviour
{

    // Start is called before the first frame update
    void Start()
    {
        DialogueManager.GetInstance().EnterDialogueMode();
    }
}
