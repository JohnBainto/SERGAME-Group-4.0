using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
public class PlayerHealth : MonoBehaviour
{
    TrackSelectedWord trackSelectedWord;
    DialogueManager dialogueManager;
    private int maxHealth = 30;
    private int currentHealth;
    private int damageHealth = -10;
    private List<TMP_LinkInfo> selectedParts;
    private Story cStory;

    [SerializeField] HealthBar healthBar;
    
    void Awake() {
        // Gets the instance of TrackSelectedWord to retrieve the list of selected parts and their corresponding performance points
        trackSelectedWord = GameObject.Find("Mouse Tracker").GetComponent<TrackSelectedWord>();
        dialogueManager = GameObject.Find("Dialogue Manager").GetComponent<DialogueManager>();
    }
    
    void Start() {
        selectedParts = new List<TMP_LinkInfo>();
        
        cStory = dialogueManager.currentStory;
        // initializes the properties 
        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
    }

    void Update() {
        setInk_Performance();
        currentHealth = (int)cStory.variablesState["_life"];
        int c = (int)cStory.variablesState["_turn"];
        Debug.Log("TURN " + c);
        Debug.Log("SENT LIFE: "+ currentHealth);
        healthBar.SetHealth(currentHealth);
    }

// with ink
    public int sumPerformance()
    {
        selectedParts = trackSelectedWord._parts;
        int x = 0;
        int performance = 0;
        for (int i = 0; i <selectedParts.Count; i++)
        {
            x = int.Parse(selectedParts[i].GetLinkID());
            performance+=x;
        }

        Debug.Log("PERFORMANCE: "+ performance);
        return performance;
    }

    public void setInk_Performance()
    {
        Debug.Log("SENT PERFORMANCE: "+ sumPerformance());
        cStory.EvaluateFunction("set_performance", sumPerformance());
    }
}
