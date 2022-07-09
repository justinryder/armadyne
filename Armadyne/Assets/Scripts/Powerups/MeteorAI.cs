using UnityEngine;
using System.Collections;

public class MeteorAI : MonoBehaviour {

	public float maxHeight = 50;

	public float shootUpSpeed = .05f,
		shootDownSpeed = .05f;

	public GameObject meteorAOE;

	private bool reachedHeight = false;

	private float step = 0;

	private Vector3 currentPos = Vector3.zero,
		originalPos = Vector3.zero;

	public Vector3 overrideDestination = Vector3.zero;

	Game game;

	// Use this for initialization
	void Start () {
		originalPos = currentPos = transform.position;
		game = GameObject.Find("Game").GetComponent<Game>();
		if (overrideDestination != Vector3.zero)
			shootDownSpeed = .0001f;
	}
	
	// Update is called once per frame
	void FixedUpdate () {
		if (!reachedHeight)
			MoveUp();
		else if (reachedHeight)
			ShootDown();

		transform.position = currentPos;
	}

	public void MoveUp()
	{
		currentPos = Vector3.Lerp(new Vector3(originalPos.x, originalPos.y + 20, originalPos.z), new Vector3(originalPos.x, originalPos.y + maxHeight, originalPos.z), step);
		step += shootUpSpeed;

		if (step >= 1 || overrideDestination != Vector3.zero)
		{
			originalPos = transform.position;
			step = 0;
			reachedHeight = true;
		}
	}

	public void ShootDown()
	{
		Vector3 destination = game.levelManager.getPlayer(0).transform.position;
		if (overrideDestination != Vector3.zero)
		{
			destination = overrideDestination;
			shootDownSpeed += .00001f;
		}

		currentPos = Vector3.Lerp(originalPos, destination, step);
		step += shootDownSpeed;

		if (step >= 1)
		{
			if (overrideDestination == Vector3.zero)
			{
				Network.Instantiate(meteorAOE, transform.position, Quaternion.identity, 0);
				meteorAOE.transform.position = transform.position;
			}
			Destroy(gameObject);

			game.audioManager.playMeteorSound();
		}
	}
}
