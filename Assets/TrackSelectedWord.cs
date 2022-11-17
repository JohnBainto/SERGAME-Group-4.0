using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class TrackSelectedWord : MonoBehaviour
{
    public TextMeshProUGUI text;

    public string LastClickedWord;
    public Camera MainCamera;

    private void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Debug.Log("weeee");
            var wordIndex = TMP_TextUtilities.FindIntersectingWord(text, Input.mousePosition, MainCamera);
            Debug.Log(wordIndex);
            if (wordIndex != -1)
            {
                Debug.Log("AAAAA" + wordIndex);
                LastClickedWord = text.textInfo.wordInfo[wordIndex].GetWord();
                Debug.Log("Clicked on " + LastClickedWord);              
                
                TMP_WordInfo info = text.textInfo.wordInfo[wordIndex];
                for (int i = 0; i < info.characterCount; ++i)
                {
                    int charIndex = info.firstCharacterIndex + i;
                    int meshIndex = text.textInfo.characterInfo[charIndex].materialReferenceIndex;
                    int vertexIndex = text.textInfo.characterInfo[charIndex].vertexIndex;
                
                    Color32[] vertexColors = text.textInfo.meshInfo[meshIndex].colors32;
                    if (vertexColors[vertexIndex + 0] == Color.white) {
                        vertexColors[vertexIndex + 0] = Color.red;
                        vertexColors[vertexIndex + 1] = Color.red;
                        vertexColors[vertexIndex + 2] = Color.red;
                        vertexColors[vertexIndex + 3] = Color.red;
                    }
                    else
                    {
                        vertexColors[vertexIndex + 0] = Color.white;
                        vertexColors[vertexIndex + 1] = Color.white;
                        vertexColors[vertexIndex + 2] = Color.white;
                        vertexColors[vertexIndex + 3] = Color.white;
                    }
                }
                
                text.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
            }
        }
    }
}