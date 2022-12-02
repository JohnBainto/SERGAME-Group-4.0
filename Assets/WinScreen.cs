using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using TMPro;
public class WinScreen : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI winMessage;

    public void Setup(string bossBattle) {
        gameObject.SetActive(true);
        winMessage.text = "You defeated " + bossBattle+ "!";
    }

    public void ContinueButton() {
        SceneManager.LoadScene("Chapter 01");
    }    
}
