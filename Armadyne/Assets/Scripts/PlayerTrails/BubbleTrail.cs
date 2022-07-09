using UnityEngine;
using System.Collections;

public class BubbleTrail : MonoBehaviour {

	public float stepSpeed = .1f,
		bubbleDelay = .3f;

	public GameObject bubble;

	public bool shouldPlay = false;

	float nextBubble = 0f;

	// Use this for initialization
	void Start ()
	{
	}
	
	// Update is called once per frame
	void Update () {
		bubbleDelay = Random.Range(.2f, 1f);
		CreateBubble();
	}

	public void CreateBubble()
	{
		if (Time.time > nextBubble)
		{
			nextBubble += bubbleDelay;
			GameObject.Instantiate(bubble, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity);
		}
	}
}
