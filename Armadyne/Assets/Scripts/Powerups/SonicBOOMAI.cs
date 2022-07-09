using UnityEngine;
using System.Collections;

public class SonicBOOMAI : MonoBehaviour {

	public float sonicBOOMSpeed = 5,
		scaleStepInc = .002f;

	public Vector3 maxScale = new Vector3(100, 2, 100);

	private Vector3 originalScale = Vector3.zero,
		currentScale = Vector3.zero;

	private float step = 0;

	int teamThatSpawnedThis = -1;

	public int TeamIntThatSpawnedThis
	{
		get { return teamThatSpawnedThis; }
	}

	void Start()
	{
		transform.localScale = originalScale = currentScale;
	}

	void FixedUpdate()
	{
		expand();
	}

	public void expand()
	{
		if (step >= 1)
		{
			Destroy(gameObject);
		}

		currentScale = Vector3.Lerp(originalScale, maxScale, step);
		step += scaleStepInc;
		transform.localScale = currentScale;
	}

	[RPC]
	void SetSpawningTeam(int team)
	{
		teamThatSpawnedThis = team;
	}
}
