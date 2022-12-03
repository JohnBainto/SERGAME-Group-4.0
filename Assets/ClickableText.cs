using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;
public class ClickableText : MonoBehaviour, IPointerClickHandler
{
    public CodexScreen codexScreen;
    public void OnPointerClick(PointerEventData eventData)
    {
        var text = GetComponent<TextMeshProUGUI>();
        if(eventData.button == PointerEventData.InputButton.Left)
        {
            int linkIndex = TMP_TextUtilities.FindIntersectingLink(text, Input.mousePosition, null); 
            if(linkIndex > -1)
            {
                TMP_LinkInfo _linkInfo = text.textInfo.linkInfo[linkIndex];
                string _linkID = _linkInfo.GetLinkID();
                PageData pageData = FindObjectOfType<PageDataController>().Get(_linkID);
                
                codexScreen.printPage(pageData);
            }
        }
    }
}
