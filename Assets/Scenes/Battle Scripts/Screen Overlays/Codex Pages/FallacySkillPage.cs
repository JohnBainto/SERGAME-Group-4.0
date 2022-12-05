using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class FallacySkillPage : MonoBehaviour
{
    [SerializeField]  TextMeshProUGUI text0;
    [SerializeField]  TextMeshProUGUI text1;
    [SerializeField]  TextMeshProUGUI text2;
    [SerializeField]  GameObject sprite0;
    [SerializeField]  GameObject sprite1;

    public void Setup(PageData pageData, string ch0_e, string ch1_e, string ch2_e,  int chNo) {
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
        sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];
        sprite1.SetActive(false);
        //sprite1.GetComponent<Image>().sprite = null;

        // Deciding on the content
        if(pageData.pageName == "CH0 Special Fallacy Skill") 
        {
            if(!ch0_e.Contains("e1")) 
            {
                text1.text = pageData.pageContents[3];
                text2.text = pageData.pageContents[4];
                sprite0.GetComponent<Image>().sprite = pageData.pageSprites[1];
                sprite1.SetActive(true);
                sprite1.GetComponent<Image>().sprite = pageData.pageSprites[2];
            }
                
        }
        
        if (pageData.pageName == "CH1 Special Fallacy Skill") 
        {
            if(ch1_e != "e1, e2, e3") 
            {
                text1.text = pageData.pageContents[3];
                text2.text = pageData.pageContents[4];
                sprite0.GetComponent<Image>().sprite = pageData.pageSprites[1];
                sprite1.SetActive(true);
                sprite1.GetComponent<Image>().sprite = pageData.pageSprites[2];
            }
        }
        
        if (pageData.pageName == "CH2 Special Fallacy Skill")
        {
            if(ch2_e != "e1, e2, e3") 
            {
                text1.text = pageData.pageContents[3];
                text2.text = pageData.pageContents[4];
                sprite0.GetComponent<Image>().sprite = pageData.pageSprites[1];
                sprite1.SetActive(true);
                sprite1.GetComponent<Image>().sprite = pageData.pageSprites[2];
            }
        }
        gameObject.SetActive(true);
    }

    public void Destroy() {
        gameObject.SetActive(false);
    }
}
