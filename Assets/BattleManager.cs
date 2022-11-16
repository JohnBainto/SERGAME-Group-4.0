using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleManager : MonoBehaviour
{
    public float retortFunction(Player player) {
        float total_damage = 0;

        foreach(Word w in player.selected_words) {
            total_damage+= w.damage;
        }
        return total_damage;
    }


}
