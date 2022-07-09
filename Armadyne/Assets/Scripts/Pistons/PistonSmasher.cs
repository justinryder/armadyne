using UnityEngine;
using System.Collections;

public enum PistonState
{
	extending = 0,
	extended,
	retracting,
	retracted
}

public class PistonSmasher : MonoBehaviour
{
	#region Public Data

	public float
		extendedLength = 50,
		delayBeforeExtend = 1,
		extendSpeed1 = .1f,
		extendSpeed2 = .2f,
		extendSwitchPercent = 0.5f,
		delayBeforeRetract = 1,
		retractSpeed1 = .01f,
		retractSpeed2 = .05f,
		retractSwitchPercent = 0.5f;
	
	public bool isSilent = false;
	
	public Vector3 extendDirection = new Vector3(0, 1, 0);
		

	public GameObject extendTrigger = null,
		pistonBangSound,
		pistonSHHHSound;

	#endregion
	#region Private Data

	PistonState state = PistonState.retracted;

	Vector3 retractedPosition, extendedPosition;

	double
		extendedTime = 0,
		retractedTime = 0;

	float step = 0;

	Game game;

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		if (extendTrigger != null)
		{
			extendTrigger.GetComponent<PistonSmashTrigger>().PistonToTrigger = gameObject;
			retractedTime = double.MaxValue;
		}
		else
			retractedTime = Network.time;
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
				if (Network.time > retractedTime + delayBeforeExtend)
				{
					state = PistonState.extending;
					step = 0;
				}
				break;
			case PistonState.retracting:
				retract();
				break;
		}
	}

	#endregion
	#region Public Methods

	public void beginExtending()
	{
		if (state == PistonState.retracted && retractedTime == double.MaxValue)
			retractedTime = Network.time;
	}

	#endregion
	#region Private Methods

	void extend()
	{
		float percentToExtended = Vector3.Distance(retractedPosition, transform.position) / Vector3.Distance(extendedPosition, transform.position);
		if (percentToExtended < extendSwitchPercent)
			step += extendSpeed1;
		else
			step += extendSpeed2;
		if (step >= 1)
		{
			transform.position = extendedPosition;
			state = PistonState.extended;
			extendedTime = Network.time;
			if (game.optionsManager.SoundFX && pistonBangSound != null  && !isSilent)
			{
				pistonSHHHSound.audio.loop = false;
				pistonBangSound.audio.Play();
			}
		}
		else
		{
			Vector3 newPos = Vector3.zero;
			newPos.x = Mathf.Lerp(retractedPosition.x, extendedPosition.x, step);
			newPos.y = Mathf.Lerp(retractedPosition.y, extendedPosition.y, step);
			newPos.z = Mathf.Lerp(retractedPosition.z, extendedPosition.z, step);
			transform.position = newPos;
		}

		if (step < 1 && game.optionsManager.SoundFX && pistonSHHHSound != null && !isSilent)
		{
			pistonSHHHSound.audio.loop = true;
			pistonSHHHSound.audio.Play();
		}
	}

	void retract()
	{
		float percentToRetracted = Vector3.Distance(retractedPosition, transform.position) / Vector3.Distance(extendedPosition, transform.position);
		if (percentToRetracted < retractSwitchPercent)
			step += retractSpeed1;
		else
			step += retractSpeed2;
		if (step >= 1)
		{
			transform.position = retractedPosition;
			state = PistonState.retracted;
			if (extendTrigger != null)
				retractedTime = double.MaxValue;
			else
				retractedTime = Network.time;
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
