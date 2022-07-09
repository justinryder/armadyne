using UnityEngine;
using System.Collections;

public class TrailManager : MonoBehaviour {

	public GameObject
		pulsingGlow,
		bubbleTrail,
		fireTrailPrefab;

	Game game;

	// Use this for initialization
	void Start () {
		game = GameObject.Find("Game").GetComponent<Game>();

		switch (Application.loadedLevel)
		{
			case 1:
				gameObject.AddComponent<DelayedCollisionGlow>();
				gameObject.GetComponent<DelayedCollisionGlow>().glowObject = pulsingGlow;
				break;
			case 2:
				gameObject.AddComponent<BubbleTrail>();
				gameObject.GetComponent<BubbleTrail>().bubble = bubbleTrail;
				break;
			case 3:
				gameObject.AddComponent<FireTrail>();
				gameObject.GetComponent<FireTrail>().Trail = (GameObject)Instantiate(fireTrailPrefab, transform.position, Quaternion.identity);
				break;
		}
	}
	
	// Update is called once per frame
	void Update()
	{
		if (Application.loadedLevel == 2)
			CheckUnderWater();
	}

	public void CheckUnderWater()
	{
		if (GetComponent<MovePlayer>().getUnderWater())
			GetComponent<BubbleTrail>().enabled = true;
		if (!GetComponent<MovePlayer>().getUnderWater())
			GetComponent<BubbleTrail>().enabled = false;
	}
}
