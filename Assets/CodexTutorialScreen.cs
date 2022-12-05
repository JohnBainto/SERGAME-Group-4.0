using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
public class CodexTutorialScreen : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI cTutorialText;

    public void Setup(string cTutorialLine) {
        gameObject.SetActive(true);
        cTutorialText.text = cTutorialLine;
    }

    public void Destroy() 
    {
        gameObject.SetActive(false);
    }
}
