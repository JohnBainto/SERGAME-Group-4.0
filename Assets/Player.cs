using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public int maxHealth = 20;
    public int currentHealth;
    public Word[] selected_words;

    public HealthBar healthBar;

    void Start() {
        currentHealth = maxHealth;
        healthBar.SetMaxHealth(maxHealth);
    }

    void Update() {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            damagePlayer(4);
        }
    }

    public void damagePlayer(int damage)
    {
        currentHealth -= damage;
        healthBar.SetHealth(currentHealth);
    }
}
