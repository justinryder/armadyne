using UnityEngine;
using System.Collections;

public class BubbleObject : MonoBehaviour {

	Vector3 origPos,
		currentPos,
		endPos;

	public float trailHeight = 30f,
		bubbleSpeed = .01f;

	float step = 0f,
		bubbleScale,
		maxBubbleScale = 3f;

	GameObject level2Water;

	// Use this for initialization
	void Start()
	{
		level2Water = GameObject.Find("Daylight Water");
		bubbleScale = Random.Range(1f, maxBubbleScale);
		transform.localScale = new Vector3(bubbleScale, bubbleScale, bubbleScale);
		origPos = new Vector3(transform.position.x, transform.position.y, transform.position.z + Random.Range(-1f, 1f));
		endPos = new Vector3(origPos.x, origPos.y + trailHeight, origPos.z);
		if (endPos.y > level2Water.transform.position.y)
			endPos.y = level2Water.transform.position.y;
	}
	
	// Update is called once per frame
	void Update () {
		MoveUp();
	}

	public void MoveUp()
	{
		currentPos = Vector3.Lerp(origPos, endPos, step);
		transform.position = currentPos;
		step += bubbleSpeed;

		if (step >= 1)
		{
			Destroy(this.gameObject);
			Destroy(this);
		}
	}
}
