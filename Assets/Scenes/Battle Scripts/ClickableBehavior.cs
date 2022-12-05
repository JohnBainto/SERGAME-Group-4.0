using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;

[System.Serializable]
public class ClickableBehavior : MonoBehaviour
{
    public Camera MainCamera;
    public TextMeshProUGUI retortText;
    public TextMeshProUGUI skipText;
    public TextMeshProUGUI consultText;
    // Action Buttons
    public GameObject retortButton;
    public GameObject skipButton;
    public GameObject consultButton;
    // Dialogue Buttons
    public GameObject startBattleButton;    
    public GameObject continueButton;
    // Codex Screen
    public GameObject nextButton;
    public GameObject previousButton;
    // Win or Lose Screen
    public GameObject tryAgainButton;
    public GameObject mainMenuButton;
    public GameObject continueCHButton;
    // Update is called once per frame
    void Update()
    {
        actionWords(retortText);
        actionWords(skipText);
        actionWords(consultText);
    }  

    public void actionWords(TextMeshProUGUI text)
    {
        var wordIndex = TMP_TextUtilities.FindIntersectingWord(text, Input.mousePosition, MainCamera);
        if (wordIndex != -1) {
            text.fontStyle = FontStyles.Underline | FontStyles.Bold;
        } else {
            text.fontStyle &= ~FontStyles.Underline;
            text.fontStyle = FontStyles.Bold;
        }
        text.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
    }

    public void actionOnClick()
    {
        AudioManager.instance.Play("Select Action");
    }

    public void closeCodex()
    {
        AudioManager.instance.Play("Close Codex");
    }

    public void openCodex()
    {
        AudioManager.instance.Play("Open Codex");
    }

    public void continueStoryButtons()
    {
        AudioManager.instance.Play("General");
    }
}
