using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using UnityEngine.SceneManagement;

public class LoseScreen : MonoBehaviour
{
    public void Setup() {
        gameObject.SetActive(true);
    }

    public void TryAgainButton() {
        SceneManager.LoadScene("BattleScene 1");
    }

    public void mainMenuButton() {
        SceneManager.LoadScene("Level Selection Screen");
    }
}
