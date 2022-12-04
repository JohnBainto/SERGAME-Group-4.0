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
                SceneManager.LoadScene("CH00_BATTLE_HATTIE"); break;
            case "ch1_battle":
                SceneManager.LoadScene("CH01_BATTLE_KIT"); break;
            case "ch2_battle":
                SceneManager.LoadScene("CH02_BATTLE_KOI"); break;
        }
    }

    public void mainMenuButton() {
        SceneManager.LoadScene("Level Selection Screen");
    }
}
