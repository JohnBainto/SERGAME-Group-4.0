using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class OutlinePage : MonoBehaviour
{
    [SerializeField] public TextMeshProUGUI text0;
    [SerializeField] public TextMeshProUGUI text1;
    [SerializeField] public TextMeshProUGUI text2;

    public void Setup(PageData pageData) {
        text0.text = "";
        text1.text =  "";
        text2.text =  "";
        gameObject.SetActive(true);
        Debug.LogWarning(gameObject.activeSelf); 
        text0.text = pageData.pageContents[0];
        text1.text = pageData.pageContents[1];
        text2.text = pageData.pageContents[2];
    }

    public void Destroy() {
        if(gameObject.activeSelf)
            gameObject.SetActive(false);
    }
}
