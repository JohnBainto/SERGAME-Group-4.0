using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CodexScreen : MonoBehaviour
{
    public void Setup() {
        gameObject.SetActive(true);
    }

    public void NextButton() {

    }

    public void PreviousButton() {

    }

    public void BackButton() {
        gameObject.SetActive(false);
    }
}
