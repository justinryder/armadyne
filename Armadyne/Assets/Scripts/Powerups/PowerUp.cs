using UnityEngine;
using System.Collections;

public class PowerUp : MonoBehaviour
{
	Game game;

	#region publicVariables

    public GameObject powerUpExplosion;

	public float respawnDelay = 30;

	#endregion
	#region privateVariables

	Vector3 levelLocation;

	float playerHitTime;

	#endregion
	#region Start & Update

	void Start ()
	{
		collider.isTrigger = true;
		game = GameObject.Find("Game").GetComponent<Game>();
		levelLocation = transform.position;
	}
	
	void Update ()
	{
		transform.Rotate(1, 1, 0);
		if (Time.time > playerHitTime + respawnDelay)
		{
			transform.position = levelLocation;
		}
	}

	#endregion
	#region triggers

	void OnTriggerEnter(Collider c)
	{
        if (c.gameObject.tag == "Player")
        {
            Network.Instantiate(powerUpExplosion, transform.position, Quaternion.identity, 0);
			playerHitTime = Time.time;
			transform.Translate(0, -1000, 0);
			if (c.gameObject.networkView.owner == Network.player)
				game.audioManager.playCollectSound();
        }
	}

	#endregion
}
