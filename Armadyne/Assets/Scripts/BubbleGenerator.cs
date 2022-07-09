using UnityEngine;
using System.Collections;

public class BubbleGenerator : MonoBehaviour {

	public GameObject bubblePrefab;

	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			c.gameObject.GetComponent<MovePlayer>().generateBubble(bubblePrefab);
		}
	}
}
