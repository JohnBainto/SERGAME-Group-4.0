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
                SceneManager.LoadScene("Chapter 0"); break;
            case "ch1_battle":
                SceneManager.LoadScene("Chapter 01"); break;
            case "ch2_battle":
                SceneManager.LoadScene("Chapter 02"); break;
        }
    }    
}
