using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CodexScreen : MonoBehaviour
{
    private string chapter; //pathString
    public PageData[] codexPages; // all pages of codex
    public bool[] unlockedPages; // list of pages unlocked or list of page no.

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

    public void printPage() {
        PageData[] unlocked;
        
        bool isUnlocked = false;
        string type = "Outline";

        foreach (PageData page in codexPages)
        {
            if(isUnlocked) 
            {

            }
        }
    }
}

/* Codex Pages
    0 Overall Outline

    1 Chapter 0 Outline
    2 Case File 0
    3 Evidence 1
    4 Fallacy Skill

    5 Chapter 1 Outline
    6 Case File 1
    7 Evidence 1
    8 Evidence 2
    9 Evidence 3
    10 Fallacy Skill

    11 Chapter 2 Outline
    12 Case File 2
    13 Evidence 1
    14 Evidence 2
    15 Evidence 3
    16 Fallacy Skill
*/