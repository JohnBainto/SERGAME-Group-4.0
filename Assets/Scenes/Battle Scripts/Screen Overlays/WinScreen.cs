using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;
public class WinScreen : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI winMessage;
    public string pathString; 

    public void Setup(string bossBattle, string _pathString) {
        gameObject.SetActive(true);
        pathString = _pathString;
        winMessage.text = "You defeated " + bossBattle+ "!";
    }

    public void ContinueButton() {
        switch(pathString)
        {
            case "ch0_battle":
                Initiate.Fade("LEVEL_SELECTION",  Color.black, 1.0f); break;
            case "ch1_battle":
                Initiate.Fade("LEVEL_SELECTION",  Color.black, 1.0f); break;
            case "ch2_battle":
                Initiate.Fade("TITLE_SCREEN",  Color.black, 1.0f); break;
        }
    }    
}
