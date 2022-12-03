using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;
public class ClickableText : MonoBehaviour, IPointerClickHandler
{
    public void OnPointerClick(PointerEventData eventData)
    {
        var text = GetComponent<TextMeshProUGUI>();
        if(eventData.button == PointerEventData.InputButton.Left)
        {
            int linkIndex = TMP_TextUtilities.FindIntersectingLink(text, Input.mousePosition, null); 
            if(linkIndex > -1)
            {
                var _linkInfo = text.textInfo.linkInfo[linkIndex];
                var _linkID = _linkInfo.GetLinkID();

                var pageData = FindObjectOfType<PageDataController>().Get(_linkID);

                var _type = pageData.pageType;


                // switch(_type)
                // {
                //     case "Outline":
                //         <>;break;
                //     case "Chapter":
                //         <>;break;
                //     case "Case File":
                //         <>;break;
                //     case "Evidence":
                //         <>;break;
                //     case "Fallacy Skill":
                //         <>;break;
                //         //<> enable the necessary pages per page type
                // }
            }
        }
    }
}
