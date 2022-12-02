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

        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
    }

    void Update() {
        cStory.EvaluateFunction("set_performance", sumPerformance());
        currentHealth = (int)cStory.variablesState["_life"];
        healthBar.SetHealth(currentHealth);
        int c = (int)cStory.variablesState["_turn"];
    }


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

        return performance;
    }
}
