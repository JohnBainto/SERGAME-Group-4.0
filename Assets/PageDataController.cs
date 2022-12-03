using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

public class PageDataController : MonoBehaviour
{
    [SerializeField]
    private List<PageData> pages;

    public PageData Get(string id)
    {
        return pages.FirstOrDefault(p => p.pageID == int.Parse(id));
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
    public int pageID; //link name also
    public string pageName;
    public string pageType;
    [TextArea(3,10)] // limit for each content 
    public string[] pageContents;
    public Sprite[] pageSprites;
}