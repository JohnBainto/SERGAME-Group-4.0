using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class TutorialScreen : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI tutorialText;

    public void Setup(string tutorialLine) {
        gameObject.SetActive(true);
        tutorialText.text = tutorialLine;
    }

    public void Destroy() 
    {
        gameObject.SetActive(false);
    }
}
