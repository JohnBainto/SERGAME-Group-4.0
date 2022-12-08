using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SkipPrologue : MonoBehaviour
{
    public void SkipCutscene() {
        Initiate.Fade("TITLE_SCREEN", Color.black, 1.0f);
    }
}
