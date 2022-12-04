using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
public class PlayerHealthCH0 : MonoBehaviour
{
    TrackSelectedWord trackSelectedWord;
    DialogueManagerCH0 dialogueManagerCH0;
    private int maxHealth = 30;
    private int currentHealth;
    private List<TMP_LinkInfo> selectedParts;
    [SerializeField] public Story cStory;

    [SerializeField] HealthBar healthBar;
    
    void Awake() {
        // Gets the instance of TrackSelectedWord to retrieve the list of selected parts and their corresponding performance points
        trackSelectedWord = GameObject.Find("Mouse Tracker").GetComponent<TrackSelectedWord>();
        dialogueManagerCH0 = GameObject.Find("DialogueManagerCH0").GetComponent<DialogueManagerCH0>();
    }
    
    void Start() {
        selectedParts = new List<TMP_LinkInfo>();
        cStory = dialogueManagerCH0.currentStory;

        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
    }

    void Update() {
        sumPerformance();
        currentHealth = (int)cStory.variablesState["_life"];
        Debug.Log(  "LIFE: " +currentHealth);
        healthBar.SetHealth(currentHealth);
    }


    public void sumPerformance()
    {
        selectedParts = trackSelectedWord._parts;
        int x = 0;
        int performance = 0;
        for (int i = 0; i <selectedParts.Count; i++)
        {
            x = int.Parse(selectedParts[i].GetLinkID());
            performance+=x;
        }
        cStory.EvaluateFunction("set_performance", performance);
    }
}
