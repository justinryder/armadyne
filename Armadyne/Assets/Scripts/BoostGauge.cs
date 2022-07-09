using UnityEngine;
using System.Collections;

public enum NeedleState
{
	down = 0,
	up,
	ready
}

public class BoostGauge : MonoBehaviour
{

	public float boostDelay = 3, nextBoost = 0;

	Transform needle;

	Quaternion initialRot;

	Vector3 initialPosition;

	NeedleState state;

	Game game;

	void Start ()
	{
		needle = transform.FindChild("GagePointer");
		initialRot = needle.localRotation;
		state = NeedleState.ready;
		game = GameObject.Find("Game").GetComponent<Game>();
		initialPosition = transform.localPosition;
	}

	void Update ()
	{
		if (game.guiManager.MenuState != MenuState.inGame)
		{
			transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, -1);
			return;
		}
		transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, 1);

		float step = 0, rot = 0, offset = 0;
		Vector3 gaugeOffset = Vector3.zero;

		if (Time.time < nextBoost - 2.5f)
			state = NeedleState.down;
		else if (Time.time < nextBoost)
			state = NeedleState.up;
		else
			state = NeedleState.ready;

		switch (state)
		{
			case NeedleState.down:
				step = Mathf.Clamp(nextBoost - 2.5f - Time.time, 0, .5f) * 2;
				rot = Mathf.Lerp(10, 170, step);
				needle.gameObject.GetComponent<DiscoFever>().enabled = false;
				needle.gameObject.renderer.material.color = new Color(1, 0, 0, needle.gameObject.renderer.material.color.a);
				break;
			case NeedleState.up:
				step = Mathf.Clamp(nextBoost - Time.time, 0, 2.5f) / 2.5f;
				rot = Mathf.Lerp(170, 10, step);
				needle.gameObject.GetComponent<DiscoFever>().enabled = false;
				needle.gameObject.renderer.material.color = new Color(1, 0, 0, needle.gameObject.renderer.material.color.a);
				break;
			case NeedleState.ready:
				rot = 170;
				offset = Random.Range(-2.5f, 2.5f);
				gaugeOffset = new Vector3(Random.Range(-.005f, .005f), Random.Range(-.005f, .005f), 0);
				needle.gameObject.GetComponent<DiscoFever>().enabled = true;
				break;
		}

		transform.localPosition = initialPosition + gaugeOffset;
		needle.localRotation = initialRot;
		needle.Rotate(new Vector3(0, 1, 0), rot + offset, Space.Self);
	}

}
