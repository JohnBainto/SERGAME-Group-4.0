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

    public void Setup(PageData pageData) {
        gameObject.SetActive(true);
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
        sprite0.GetComponent<Image>().sprite = pageData.pageSprites[0];
    }

    public void Destroy() {
        gameObject.SetActive(false);
    }
}
