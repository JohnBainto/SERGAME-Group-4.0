using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; 

public class titleScreen : MonoBehaviour
{
    [SerializeField] private GameObject exit;
    [SerializeField] private GameObject start;

    // Start is called before the first frame update
    void Start()
    {
        Destroy(GameObject.FindWithTag("Dialogue"));
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void startgame () 
    {
        Initiate.Fade("LEVEL_SELECTION", Color.black, 1.0f);
    }


    public void exitgame() 
    {  
        Application.Quit();  
    }  
}
