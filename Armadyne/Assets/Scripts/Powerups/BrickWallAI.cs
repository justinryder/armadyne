using UnityEngine;
using System.Collections;

public class BrickWallAI : MonoBehaviour {

	public Vector3 size = new Vector3(5, 20, 16);

	public Vector3 positionOffset = new Vector3(0, 0, 0);

	public float duration = 2;

	float currentTime = 0;

	// Use this for initialization
	void Start () {
		transform.localScale = size;
		transform.position = new Vector3(transform.position.x, transform.position.y + size.y / 3, transform.position.z) + positionOffset;
		currentTime = Time.time;
	}
	
	// Update is called once per frame
	void Update () {
		if (currentTime + duration < Time.time)
			Destroy(gameObject);
	}
}
