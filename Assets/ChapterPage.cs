using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChapterPage : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI text0;
    [SerializeField] public TextMeshProUGUI text1;
    [SerializeField] public TextMeshProUGUI text2;
    [SerializeField] public Sprite sprite0;

    public void Setup(PageData pageData) {
        gameObject.SetActive(true);
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
    }
}
