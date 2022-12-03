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

    public void Setup(PageData pageData, string ch0_e, string ch1_e, string ch2_e,  int chNo) {
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
        sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];

        if ((chNo == 0 && ch0_e != "e1") || 
        (chNo == 1 && ch1_e != "e1, e2, e3") ||
        (chNo == 2 && ch2_e != "e1, e2, e3")) 
        {
            Debug.Log("LFJNKFND " + chNo);
            text1.text = pageData.pageContents[3];
            text2.text = pageData.pageContents[4];
            sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];
        }

        gameObject.SetActive(true);
    }

    public void Destroy() {
        gameObject.SetActive(false);
    }
}
