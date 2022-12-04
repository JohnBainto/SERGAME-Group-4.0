using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using UnityEngine.UI;
public class PageDataController : MonoBehaviour
{
    [SerializeField]
    private List<PageData> pages;

    public PageData Get(string id)
    {
        return pages.FirstOrDefault(p => p.pageID == id);
    }

    public List<PageData> GetAll()
    {
        return pages;
    }
}

[System.Serializable]
public struct PageData
{
    public bool isUnlocked;
    public string pageID; //link name also
    public string pageName;
    public string pageType;
    [TextArea(3,10)] // limit for each content 
    public string[] pageContents;
    public Sprite[] pageSprites;
}