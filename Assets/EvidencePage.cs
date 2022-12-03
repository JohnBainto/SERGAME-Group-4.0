using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class EvidencePage : MonoBehaviour
{
    [SerializeField]  TextMeshProUGUI text0;
    [SerializeField]  TextMeshProUGUI text1;
    [SerializeField]  TextMeshProUGUI text2;
    [SerializeField]  GameObject sprite0;

    public void Setup(PageData pageData, string ch0_e, string ch1_e, string ch2_e,  int chNo) {
        bool isAcquired = false;
        
        if (pageData.pageName.Contains("CH0 Evidence 1"))
        {
            if(ch0_e == "e1") isAcquired = true; 
        }

        if (pageData.pageName.Contains("CH1 Evidence 1"))
        {
            if(ch1_e.Contains("e1")) isAcquired = true; 
        }
        if (pageData.pageName.Contains("CH1 Evidence 2"))
        {
            if(ch1_e.Contains("e2")) isAcquired = true; 
        }
        if (pageData.pageName.Contains("CH1 Evidence 3"))
        {
            if(ch1_e.Contains("e3")) isAcquired = true;             
        }

        if (pageData.pageName.Contains("CH2 Evidence 1"))
        {
            if(ch2_e.Contains("e1")) isAcquired = true; 
        }
        if (pageData.pageName.Contains("CH2 Evidence 2"))
        {
            if(ch2_e.Contains("e2")) isAcquired = true; 
        }
        if (pageData.pageName.Contains("CH2 Evidence 3"))
        {
            if(ch2_e.Contains("e3")) isAcquired = true; 
        }
        gameObject.SetActive(true);
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
        sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];
        if(!isAcquired)
        {
            text0.text = pageData.pageContents[3];
            text2.text = pageData.pageContents[4];
            sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];            
        }
    }
    public void Destroy() {
        gameObject.SetActive(false);
    }
}
