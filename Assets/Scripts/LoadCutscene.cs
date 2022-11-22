using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class LoadCutscene : MonoBehaviour
{
    void Awake() {
        DialogueManager.GetInstance().EnterDialogueMode();
    }

    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
