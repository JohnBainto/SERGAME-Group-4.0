using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; 

public class levelSelection : MonoBehaviour
{
    [SerializeField] private GameObject tutorialButton;
    [SerializeField] private GameObject chapter1Button;
    [SerializeField] private GameObject chapter2Button;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void screenChangeToTutorial ()
    {
        Initiate.Fade("PROLOGUE", Color.black, 1.0f);
    }

    public void screenChangeToChapter1 ()
    {
        Initiate.Fade("CH01_EXP_BLACK", Color.black, 1.0f);
    }

    public void screenChangeToChapter2 ()
    {
        Initiate.Fade("CH02_EXP_BLACK", Color.black, 1.0f); 
    }
}
