using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class PistonLauncher : MonoBehaviour
{
	#region Public Data

	public float
		extendedLength = 10,
		delayBeforeLaunch = .1f,
		extendSpeed = 5,
		delayBeforeRetract = 1,
		retractSpeed = .5f,
		launchForce = 10000;
	
	public Vector3 extendDirection = new Vector3(0, 1, 0);
	
	public bool zeroVelocityOnLaunch = false;

	public GameObject pistonLaunchSound;

	#endregion
	#region Private Data

	PistonState state = PistonState.retracted;

	Vector3 retractedPosition, extendedPosition;

	double
		extendedTime = 0,
		triggeredTime = 0;

	float step = 0;

	List<GameObject> playersOnPiston = new List<GameObject>();

	Game game;

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		state = PistonState.retracted;
		triggeredTime = double.MaxValue;
		retractedPosition = transform.position;
		extendedPosition = retractedPosition;
		extendedPosition += extendDirection * extendedLength;
		game = GameObject.Find("Game").GetComponent<Game>();
	}

	void FixedUpdate()
	{
		switch (state)
		{
			case PistonState.extended:
				if (Network.time > extendedTime + delayBeforeRetract)
				{
					state = PistonState.retracting;
					step = 0;
				}
				break;
			case PistonState.extending:
				extend();
				break;
			case PistonState.retracted:
				if (Network.time > triggeredTime + delayBeforeLaunch)
				{
					state = PistonState.extending;
					step = 0;
					if (game.optionsManager.SoundFX)
						pistonLaunchSound.audio.Play();
					launchPlayers();
				}
				break;
			case PistonState.retracting:
				retract();
				break;
		}
	}

	#endregion
	#region Public Methods

	public void abortLaunch()
	{
		if (state == PistonState.retracted && triggeredTime != double.MaxValue)
			triggeredTime = double.MaxValue;
	}

	public void addPlayer(GameObject player)
	{
		playersOnPiston.Add(player);
	}

	public void launch()
	{
		if (state == PistonState.retracted && triggeredTime == double.MaxValue)
			triggeredTime = Network.time;
	}

	public void removePlayer(GameObject player)
	{
		playersOnPiston.Remove(player);
	}

	#endregion
	#region Private Methods

	void extend()
	{
		float percentToExtended = Vector3.Distance(retractedPosition, transform.position) / Vector3.Distance(extendedPosition, transform.position);
		step += extendSpeed;
		if (step >= 1)
		{
			transform.position = extendedPosition;
			state = PistonState.extended;
			extendedTime = Network.time;
		}
		else
		{
			Vector3 newPos = Vector3.zero;
			newPos.x = Mathf.Lerp(retractedPosition.x, extendedPosition.x, step);
			newPos.y = Mathf.Lerp(retractedPosition.y, extendedPosition.y, step);
			newPos.z = Mathf.Lerp(retractedPosition.z, extendedPosition.z, step);
			transform.position = newPos;
		}
	}

	void launchPlayers()
	{
		foreach (GameObject player in playersOnPiston)
		{
			if (zeroVelocityOnLaunch)
				player.rigidbody.velocity = Vector3.zero;
			player.rigidbody.AddForce(extendDirection * launchForce);
		}
	}

	void retract()
	{
		float percentToRetracted = Vector3.Distance(retractedPosition, transform.position) / Vector3.Distance(extendedPosition, transform.position);
		step += retractSpeed;
		if (step >= 1)
		{
			transform.position = retractedPosition;
			state = PistonState.retracted;
			triggeredTime = double.MaxValue;
		}
		else
		{
			Vector3 newPos = Vector3.zero;
			newPos.x = Mathf.Lerp(extendedPosition.x, retractedPosition.x, step);
			newPos.y = Mathf.Lerp(extendedPosition.y, retractedPosition.y, step);
			newPos.z = Mathf.Lerp(extendedPosition.z, retractedPosition.z, step);
			transform.position = newPos;
		}
	}

	#endregion
}
