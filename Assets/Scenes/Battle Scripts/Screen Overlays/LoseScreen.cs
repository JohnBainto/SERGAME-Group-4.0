using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoseScreen : MonoBehaviour
{
    public string pathString; 
    public void Setup(string _pathString) {
        gameObject.SetActive(true);
        pathString = _pathString;
    }

    public void TryAgainButton() {
        switch(pathString)
        {
            case "ch0_battle":
                Initiate.Fade("CH00_BATTLE_HATTIE", Color.black, 1.0f); break;
            case "ch1_battle":
                Initiate.Fade("CH01_BATTLE_KIT",  Color.black, 1.0f); break;
            case "ch2_battle":
                Initiate.Fade("CH02_BATTLE_KOI", Color.black, 1.0f); break;
        }
    }

    public void mainMenuButton() {
        Initiate.Fade("LEVEL_SELECTION", Color.black, 1.0f); 
    }
}
