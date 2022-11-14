using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[System.Serializable]
// A dialogue object that will be passed to the dialogue manager when we want to start a new dialogue
// This class will hold all the information we need for a single dialogue
public class Dialogue {
    public string SpeakerName; // name of the talking character
    [TextArea(3,10)] // limit for each line 
    public string[] Lines;  // the sentences that will load to the queue in the dialogue manager
}



