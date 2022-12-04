using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class CaseFilePage : MonoBehaviour
{
    [SerializeField]  TextMeshProUGUI text0;
    [SerializeField]  TextMeshProUGUI text1;
    [SerializeField]  TextMeshProUGUI text2;
    [SerializeField]  GameObject sprite0;

    public void Setup(PageData pageData, string ch0_e, string ch1_e, string ch2_e, int chNo) {
        gameObject.SetActive(true);
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];

        // Deciding on the content
        if(pageData.pageName == "CH0 Case File") 
        {
            if(!ch0_e.Contains("e1"))
                text2.text = pageData.pageContents[3];
            else
                text2.text = pageData.pageContents[2];
        }
        
        if (pageData.pageName == "CH1 Case File") 
        {
            if(!ch1_e.Contains("e1"))
                text2.text = pageData.pageContents[3];
            else
                text2.text = pageData.pageContents[2];
        }
        
        if (pageData.pageName == "CH2 Case File")
        {
            if(!ch2_e.Contains("e1"))
                text2.text = pageData.pageContents[3];
            else
                text2.text = pageData.pageContents[2];
        }
        
        sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0]; //silhouette
    }

    public void Destroy() {
        gameObject.SetActive(false);
    }
}
