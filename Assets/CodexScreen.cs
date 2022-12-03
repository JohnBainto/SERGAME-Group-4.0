using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CodexScreen : MonoBehaviour
{
    public List<PageData> codexPagesData; // all pages of codex
    private string ch0_evidences;
    private string ch1_evidences;
    private string ch2_evidences;
    private string chapter; //pathString
    public int maxPage;
    public int currentPage;
    [SerializeField] GameObject nextButton;
    [SerializeField] GameObject prevButton;

    // Pages Types
    public OutlinePage outlinePage;
    // public ChapterPage chapterPage;
    // public CaseFilePage caseFilePage;
    // public EvidencePage evidencePage;
    // public FallacySkillPage fallacySkillPage;
    
    public void Setup() {
        gameObject.SetActive(true);
        nextButton.SetActive(true);
        prevButton.SetActive(false);
        currentPage = 0;
        printPage(codexPagesData[currentPage]);
    }

    public void loadCodexPages(string ch0_e, string ch1_e, string ch2_e, string ch) {
        codexPagesData = FindObjectOfType<PageDataController>().GetAll();
        ch0_evidences = ch0_e;
        ch1_evidences = ch1_e;
        ch2_evidences = ch2_e;
        chapter = ch;

        switch(chapter)
        {
            case "tutorial":
            case "ch0_battle":
                maxPage = 4; break;
            case "chapter1":
            case "ch1_battle":
                maxPage = 10; break;
            case "chapter2":
            case "ch2_battle":
                maxPage = 16; break;
        }
        
        Debug.Log("CODEX SCREEN:\n" + ch0_evidences + " AAAA " + ch1_evidences + " BBB " + ch2_evidences
        + "\n" + "Chapter: " + chapter + "\nMax Page: " + maxPage + "\nPages Count: " + codexPagesData.Count);
    }

    public void NextButton() 
    {
        currentPage++;
        if(currentPage == maxPage)
        {
            nextButton.SetActive(false);
            prevButton.SetActive(true);
        } 

        //printPage(currentPage);     
    }

    public void PreviousButton() 
    {
        currentPage--;
        if(currentPage == 0)
        {
            nextButton.SetActive(true);
            prevButton.SetActive(false);
        }

        //printPage(currentPage);
    }

    public void BackButton() 
    {
        gameObject.SetActive(false);
    }

    public void printPage(PageData pageData) 
    {
        if(pageData.pageType == "Outline")
            outlinePage.Setup(pageData);
        // else if(pageData.pageType == "Chapter")     
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