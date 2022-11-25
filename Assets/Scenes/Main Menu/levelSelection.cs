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
        SceneManager.LoadScene("PROLOGUE"); 
    }

    public void screenChangeToChapter1 ()
    {
        SceneManager.LoadScene("CH01_EXP_OUTSIDE"); 
    }

    public void screenChangeToChapter2 ()
    {
        SceneManager.LoadScene("CH02_EXP_HALLWAY"); 
    }
}
