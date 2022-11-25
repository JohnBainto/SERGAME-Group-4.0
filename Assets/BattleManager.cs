using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleManager : MonoBehaviour
{
    public Player player;

    public void retortFunction() {
        // ink integ
        int totalDamage = 2;
        player.damagePlayer(totalDamage);
    }

    public void skipFunction() {
        // ink integ
        int totalDamage = 10;
        player.damagePlayer(totalDamage);
    }

}
