using UnityEngine;
using System.Collections;

[RequireComponent(typeof(NetworkView))]

public class WhirlpoolAI : MonoBehaviour {

	public double duration = 3;
	double spawnTime;

	public float spinRate = 5;

	int teamThatSpawnedThis = -1;
	public int TeamIntThatSpawnedThis
	{
		get { return teamThatSpawnedThis; }
	}

	void Start ()
	{
		spawnTime = Network.time;
	}
	
	void Update ()
	{
		if (Network.time > spawnTime + duration)
			Network.Destroy(gameObject);

		transform.Rotate(0, spinRate, 0);
	}

	[RPC]
	void SetSpawningTeam(int team)
	{
		teamThatSpawnedThis = team;
	}
}
