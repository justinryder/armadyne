using UnityEngine;
using System.Collections;

public class Respawn : MonoBehaviour {

	Game game;

	public GameObject
		playerPrefab = null,
		lastCheckpoint = null,
		respawnParticleEffect = null;

	public float invincibleTime = 2;
	
	public Vector3 lastPosition = Vector3.zero;

	private CameraFollow cameraFollow;

	private GameObject teleportPoint;

	bool invincible = false;

	float invincibleEnd = 1;

	void Start ()
	{
		if (!networkView.isMine)
			enabled = false;
		game = GameObject.Find("Game").GetComponent<Game>();
		cameraFollow = GameObject.Find("Main Camera").GetComponent<CameraFollow>();
		teleportPoint = GameObject.Find("TeleportPoint");
	}

	void Update()
	{
		if (Time.time > invincibleEnd)
			invincible = false;
	}

	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "KillZone")
		{
			respawn(true);
			if (networkView.isMine)
				game.audioManager.playDeathSound();
		}
		if (c.gameObject.tag == "MeteorAOE")
		{
			respawn();
			if (networkView.isMine)
				game.audioManager.playDeathSound();
		}
		if (c.gameObject.tag == "Checkpoint")
		{
			lastPosition = transform.position;
			lastCheckpoint = c.gameObject;
		}
		else if(c.gameObject.tag == "Teleporter")
        {
			if (cameraFollow.IsFollowing == gameObject)
				if (networkView.isMine)
					teleportRespawn();
		}
		else if (c.gameObject.tag == "Lava")
		{
			respawn(true);
			if (networkView.isMine)
				game.audioManager.playDeathSizzle();
		}
	}

	public void respawn(bool overrideInvincible = false)
	{
		if (!invincible || overrideInvincible)
		{
			transform.position = lastCheckpoint.transform.position;
			transform.rotation = lastCheckpoint.transform.rotation;
			if (!rigidbody.isKinematic)
			{
				rigidbody.angularVelocity = Vector3.zero;
				rigidbody.velocity = Vector3.zero;
			}

			//spawn particle effect
			Network.Instantiate(respawnParticleEffect, transform.position, Quaternion.identity, networkView.group);

			if (GetComponent<PowerUpManager>().currentPowerUp == powerUpType.InfiniteBoost)
			{
				GetComponent<PowerUpManager>().endInfiniteBoost();
			}
			GetComponent<PowerUpManager>().currentPowerUp = powerUpType.none;
			GetComponent<MovePlayer>().usePowerUp = false;
			invincibleEnd = Time.time + invincibleTime;
			invincible = true;
		}
	}

    void teleportRespawn()
    {
		lastCheckpoint = teleportPoint;
        cameraFollow.teleportAnimate = true;
		cameraFollow.AnimateStep = 1.5f;
		if (!rigidbody.isKinematic)
		{
			rigidbody.angularVelocity = Vector3.zero;
			rigidbody.velocity = Vector3.zero;
		}
        transform.position = teleportPoint.transform.position;
        transform.rotation = lastCheckpoint.transform.rotation;
		rigidbody.isKinematic = true;
		gameObject.GetComponent<MovePlayer>().InputEnabled = false;
		gameObject.GetComponent<PlayerStats>().lapComplete();
		invincibleEnd = Time.time + invincibleTime;
		invincible = true;

		game.audioManager.playTeleportSound();
    }

	public bool getInvincible()
	{
		return invincible;
	}
}
