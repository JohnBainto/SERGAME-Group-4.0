using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;
using UnityEngine.UI;

public class TrackSelectedWord : MonoBehaviour
{
    [SerializeField] public Button retortButton; 
    public TextMeshProUGUI text;
    public Camera MainCamera;
    [SerializeField] public TextMeshProUGUI selectedWords;
    public List<TMP_LinkInfo> _parts;

    private void Start() 
    {
        _parts = new List<TMP_LinkInfo>();
    }

    private void Update()
    {
        int linkIndex = TMP_TextUtilities.FindIntersectingLink(text, Input.mousePosition, MainCamera);    
        LinkOnHover(linkIndex);
        if (linkIndex != -1)
        {    
            //AudioManager.instance.Play("Select Word");
            TMP_LinkInfo info = text.textInfo.linkInfo[linkIndex];
            if (Input.GetMouseButtonDown(0))
            {    
                AudioManager.instance.Play("Select Word");
                _parts.Add(text.textInfo.linkInfo[linkIndex]);
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
                        _parts.Remove(text.textInfo.linkInfo[linkIndex]);
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

            if(_parts.Count == 0) 
                retortButton.interactable = false;
            else
                retortButton.interactable = true;
        } 
        printSelectedParts();
        text.UpdateVertexData(TMP_VertexDataUpdateFlags.All);
    }

    public void printSelectedParts() {
        selectedWords.text="";
        for (int i = 0; i <_parts.Count; i++)
        {
            selectedWords.text+=(_parts[i].GetLinkText()+"\n");
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