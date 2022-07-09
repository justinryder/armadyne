using UnityEngine;
using System.Collections;

[RequireComponent(typeof(NetworkView))]

public class SumoQuakeAI : MonoBehaviour {

	public float sumoQuakeSpeed = 1;

	public int distanceToTravel = 30;

	public Vector3 sumoScale = new Vector3(20, 15, 46);

	public Vector3 sumoPosition = Vector3.zero;

	public MovePlayer player;

	private int count = 0;

	int teamThatSpawnedThis = -1;
	public int TeamIntThatSpawnedThis
	{
		get { return teamThatSpawnedThis; }
	}

	// Use this for initialization
	void Start()
	{
		transform.localScale = sumoScale;
		transform.position += sumoPosition;
	}

	// Update is called once per frame
	void FixedUpdate()
	{
		if (count >= distanceToTravel)
		{
			Destroy(this.gameObject);
			Destroy(this);
		}


		moveUp();
		count++;
	}

	public void moveUp()
	{
		transform.position = new Vector3(transform.position.x, transform.position.y + sumoQuakeSpeed, transform.position.z);
	}

	[RPC]
	void SetSpawningTeam(int team)
	{
		teamThatSpawnedThis = team;
	}
}
