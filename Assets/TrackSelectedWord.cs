using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class TrackSelectedWord : MonoBehaviour
{
    public TextMeshProUGUI text;
    public string LastClickedWord;
    public Camera MainCamera;
    [SerializeField] private TextMeshProUGUI selectedWords;
    private List<string> parts;

    private void Start() 
    {
        parts = new List<string>();
    }
    private void Update()
    {
        int linkIndex = TMP_TextUtilities.FindIntersectingLink(text, Input.mousePosition, MainCamera);    
        Debug.Log("LINK INDEX: " + linkIndex);
        LinkOnHover(linkIndex);
        if (linkIndex != -1)
        {    
            TMP_LinkInfo info = text.textInfo.linkInfo[linkIndex];
            if (Input.GetMouseButtonDown(0))
            {
                string LastClickedPart = text.textInfo.linkInfo[linkIndex].GetLinkText();
                parts.Add(LastClickedPart);          
                
                for (int i = 0; i < info.linkTextLength; i++)
                {
                    TMP_CharacterInfo cInfo = text.textInfo.characterInfo[info.linkTextfirstCharacterIndex+i];
                    if(!cInfo.isVisible) continue;
                    int meshIndex = cInfo.materialReferenceIndex;
                    int vertexIndex = cInfo.vertexIndex;
                
                    Color32[] vertexColors = text.textInfo.meshInfo[meshIndex].colors32;
                    
                    if (vertexColors[vertexIndex + 0] == Color.red) 
                    {
                        vertexColors[vertexIndex + 0] = Color.white;
                        vertexColors[vertexIndex + 1] = Color.white;
                        vertexColors[vertexIndex + 2] = Color.white;
                        vertexColors[vertexIndex + 3] = Color.white;
                        parts.Remove(LastClickedPart);
                    } 
                    else if (cInfo.isVisible) 
                    {
                        vertexColors[vertexIndex + 0] = Color.red;
                        vertexColors[vertexIndex + 1] = Color.red;
                        vertexColors[vertexIndex + 2] = Color.red;
                        vertexColors[vertexIndex + 3] = Color.red;
                        
                    } 
                }
            }
        } 
        printSelectedParts();
        text.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
    }

    public void printSelectedParts() {
        selectedWords.text="";
        foreach (string part in parts)
        {
            selectedWords.text+=(part+"\n");
        }
    }

    private void LinkOnHover(int linkIndex) 
    { 
        if (linkIndex != -1) {
            TMP_LinkInfo info = text.textInfo.linkInfo[linkIndex];
            for (int i = 0; i < info.linkTextLength; i++)
            {
                TMP_CharacterInfo cInfo = text.textInfo.characterInfo[info.linkTextfirstCharacterIndex+i];
                if(!cInfo.isVisible) continue;
                int meshIndex = cInfo.materialReferenceIndex;
                int vertexIndex = cInfo.vertexIndex;

                Color32[] vertexColors = text.textInfo.meshInfo[meshIndex].colors32;
                
                if (vertexColors[vertexIndex + 0] == Color.white) {
                    vertexColors[vertexIndex + 0] = Color.blue;
                    vertexColors[vertexIndex + 1] = Color.blue;
                    vertexColors[vertexIndex + 2] = Color.blue;
                    vertexColors[vertexIndex + 3] = Color.blue;
                }
            }
        }
        else
        {
            for (int i = 0; i < text.textInfo.characterCount; i++)
            {
                TMP_CharacterInfo cInfo = text.textInfo.characterInfo[i];
                if(!cInfo.isVisible) continue;
                int meshIndex = cInfo.materialReferenceIndex;
                int vertexIndex = cInfo.vertexIndex;

                Color32[] vertexColors = text.textInfo.meshInfo[meshIndex].colors32;
                
                if (vertexColors[vertexIndex + 0] == Color.blue) {
                    vertexColors[vertexIndex + 0] = Color.white;
                    vertexColors[vertexIndex + 1] = Color.white;
                    vertexColors[vertexIndex + 2] = Color.white;
                    vertexColors[vertexIndex + 3] = Color.white;
                }
            }
        }
    }
}