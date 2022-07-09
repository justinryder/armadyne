using UnityEngine;
using System.Collections;

[RequireComponent(typeof(NetworkView))]

public class FusRoDahAI : MonoBehaviour {

	public float fusRoDahSpeed = 5;

	public int distanceToTravel = 50;
	
	public Vector3 maxScale = new Vector3(30, 30, 30);

	private Vector3 currentVelocity = Vector3.zero,
		originalScale = Vector3.zero,
		currentScale = Vector3.zero;

	private bool forward = true,
		up = false;

	private int count = 0;

	private float scaleStepInc = .02f,
		step = 0;

	int teamThatSpawnedThis = -1;
	public int TeamIntThatSpawnedThis
	{
		get { return teamThatSpawnedThis; }
	}

	void Start () {
		originalScale = currentScale;

		if (Mathf.Abs(currentVelocity.x) > Mathf.Abs(currentVelocity.y))
		{
			forward = true;
			up = false;

			if (currentVelocity.x > 0)
				transform.rotation = Quaternion.Euler(new Vector3(0, 0, 90));
			else
				transform.rotation = Quaternion.Euler(new Vector3(0, 0, -90));
		}
		else if (Mathf.Abs(currentVelocity.x) < Mathf.Abs(currentVelocity.y))
		{
			forward = false;
			up = true;

			if (currentVelocity.y > 0)
				transform.rotation = Quaternion.Euler(new Vector3(180, 0, 0));
			else
				transform.rotation = Quaternion.Euler(new Vector3(0, -90, 0));
		}
	}
	
	void FixedUpdate () {
		if (count >= distanceToTravel)
		{
			Destroy(gameObject);
		}

		moveForward();
		count++;
	}

	public void moveForward()
	{
		if (forward && currentVelocity.x > 0)
			transform.position = new Vector3(transform.position.x + fusRoDahSpeed, transform.position.y, transform.position.z);
		else if (forward && currentVelocity.x < 0)
			transform.position = new Vector3(transform.position.x - fusRoDahSpeed, transform.position.y, transform.position.z);
		else if (up && currentVelocity.y > 0)
			transform.position = new Vector3(transform.position.x, transform.position.y + fusRoDahSpeed, transform.position.z);
		else if (up && currentVelocity.y < 0)
			transform.position = new Vector3(transform.position.x, transform.position.y - fusRoDahSpeed, transform.position.z);

		currentScale = Vector3.Lerp(originalScale, maxScale, step);
		step += scaleStepInc;
		transform.localScale = currentScale;
	}

	[RPC]
	void SetSpawningTeam(int team)
	{
		teamThatSpawnedThis = team;
	}

	[RPC]
	void SetVelocity(Vector3 newVel)
	{
		currentVelocity = newVel;
	}
}
