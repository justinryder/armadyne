using UnityEngine;
using System.Collections;

public class SlowBubbleAI : MonoBehaviour
{

	public float riseSpeed = .01f;
	public float duration = 10;
	float deathTime;

	public int TeamIntThatSpawnedThis { get; set; }

	void Awake ()
	{
		deathTime = Time.time + duration;
	}
	
	void Update ()
	{
		transform.Translate(0, riseSpeed, 0);
		if (Time.time > deathTime)
			Network.Destroy(gameObject);
	}
}
