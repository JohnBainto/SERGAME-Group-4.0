using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PauseScript : MonoBehaviour
{   
    public GameObject PauseCanvas;
    public GameObject PauseButton;
    public string RestartScene;

    public void Pause() {
        PauseCanvas.SetActive(true);
        PauseButton.SetActive(false);
    }

    public void Continue() {
        PauseCanvas.SetActive(false);
        PauseButton.SetActive(true);
    }

    public void Restart() {
        Initiate.Fade(RestartScene, Color.black, 1.0f);
    }

    public void MainMenu() {
        Initiate.Fade("TITLE_SCREEN", Color.black, 1.0f);
    }
}
