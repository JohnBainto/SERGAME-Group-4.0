using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;

public class buttonBehavior : MonoBehaviour {

    public Camera MainCamera;
    public TextMeshProUGUI text;

    // Start is called before the first frame update
    void Start()
    {
        text.color = new Color32(255, 255, 255, 255);
    }

    // Update is called once per frame
    void Update()
    {
        var wordIndex = TMP_TextUtilities.FindIntersectingWord(text, Input.mousePosition, MainCamera);
        if (wordIndex != -1) {
            text.color = new Color32(242, 108, 79, 255);
            text.fontStyle = FontStyles.Underline;
        } else {
            text.color = new Color32(255, 255, 255, 255);
            text.fontStyle &= ~FontStyles.Underline;
        }

        text.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
    }
}
