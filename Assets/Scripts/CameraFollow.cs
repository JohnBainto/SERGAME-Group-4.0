using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    [SerializeField] private Transform player;
    [SerializeField] private float yOffset;

    private void Update()
    {
        transform.position = new Vector3(player.position.x, player.position.y + yOffset, transform.position.z);
    }
}
 