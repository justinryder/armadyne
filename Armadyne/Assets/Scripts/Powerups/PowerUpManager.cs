using UnityEngine;
using System.Collections;

public enum powerUpType
{
	FusRoDah = 0,
	Meteor,
	InfiniteBoost,
	SumoQuake,
	SelfDestruct,
	Teleport,
	BrickWall,
	Whirlpool,
	SonicBOOM,
	RingOfFire,
	slowBubbles,
	count,//keep this before selecting
	selecting,
	none//keep this last
}

public class PowerUpManager : MonoBehaviour
{
	#region public variables

	public powerUpType currentPowerUp = powerUpType.none;

	public Texture2D[] powerupIcons = new Texture2D[(int)powerUpType.count];

	public int boostLength = 15,
		tempPowerUp = 0;

	public float boostSpeed = 100,
		powerUpBoostDelay = .5f,
		whirlpoolSlowModifier = 4,
		destructDelay = 3,
		selectionTime = 2,
		selectionAnimateStartSpeed = 30,
		selectionAnimateEndSpeed = .01f,
		selectionAnimateSmallScaleX = .1f,
		selectionAnimateSmallScaleY = .1f;

	public GameObject fusRoDahProjectile,
		sumoQuakeProjectile,
		meteorProjectile,
		whirlpoolPrefab,
		selfDestructExplosion,
		brickWall,
		sonicBOOMProjectile,
		ringOfFirePrefab,
		slowBubblePrefab;

	public powerUpType[] firstPlayerPowerUp,
		firstSecondPercentage,
		secondThirdPercentage,
		thirdFourthPercentage,
		fourthFifthPercentage,
		fifthSixthPercentage,
		sixthSeventhPercentage,
		lastPlayerPowerUp;

	public float percentageOne,
		percentageTwo,
		percentageThree,
		percentageFour,
		percentageFive,
		percentageSix,
		percentageSeven;

	#endregion
	#region private variables

	Color initialColor;

	float numOfPlayers,
		step = 0,
		stepInc = .1f,
		nextDestructTick = 0;

	Game game;

	float selectionStartTime = float.MaxValue,
		selectionHeightOffset = -100;
	int selectionCurrentIndex = 0;

	Vector3 originalVelocity;

	public bool HasPowerUp
	{
		get { return (currentPowerUp != powerUpType.none && currentPowerUp != powerUpType.count); }
	}

	private float endboost = 0,
		origBoostDelay = 0;

	AudioManager audioManager;

	#endregion
	#region Start & Update

	void Start ()
	{
		percentageOne /= 100;
		percentageTwo /= 100;
		percentageThree /= 100;
		percentageFour /= 100;
		percentageFive /= 100;
		percentageSix /= 100;

		origBoostDelay = gameObject.GetComponent<MovePlayer>().boostDelay;
		audioManager = GameObject.Find("Game").GetComponent<AudioManager>();
		game = GameObject.Find("Game").GetComponent<Game>();
		numOfPlayers = game.levelManager.getPlayerGameObjectsNotFinished().Count;
		initialColor = renderer.material.color;
	}
	
	void FixedUpdate ()
	{
		if (currentPowerUp == powerUpType.selecting)
		{
			if (Time.time > selectionStartTime + selectionTime)
			{
				selectionStartTime = float.MaxValue;
				determinePowerUp();
			}
		}

		if (Time.time > endboost && currentPowerUp == powerUpType.InfiniteBoost && GetComponent<MovePlayer>().usePowerUp)
		{
			endInfiniteBoost();
		}

		if (currentPowerUp == powerUpType.SelfDestruct)
		{
			usePowerUp();
		}

		playerInput();
	}

	#endregion
	#region input

	public void playerInput()
	{
		if (!networkView.isMine)
			enabled = false;

		if (Input.GetKeyDown(KeyCode.Mouse1) && HasPowerUp && !gameObject.GetComponent<MovePlayer>().usePowerUp)
			usePowerUp();
	}

	#endregion
	#region GUI

	void OnGUI()
	{
		if (HasPowerUp && game.guiManager.MenuState == MenuState.inGame)
		{
			if (currentPowerUp == powerUpType.selecting)
			{
				float percentDone = (Time.time - selectionStartTime) / selectionTime;
				selectionHeightOffset += Mathf.Lerp(selectionAnimateStartSpeed, selectionAnimateEndSpeed, percentDone);
				if (selectionHeightOffset > 100)
				{
					selectionHeightOffset = -100;
					selectionCurrentIndex++;
					if (selectionCurrentIndex >= (int)powerUpType.count)
						selectionCurrentIndex = 0;
				}
				float selectionStep = 1;
				float scaleXModifier = 1;
				float scaleYModifier = 1;
				float xOffset = 0;
				float yOffest = 0;
				if (selectionHeightOffset < 0)
				{
					selectionStep = 1 - Mathf.Abs(selectionHeightOffset / 100);
					scaleXModifier = Mathf.Lerp(selectionAnimateSmallScaleX, 1, selectionStep);
					scaleYModifier = Mathf.Lerp(selectionAnimateSmallScaleY, 1, selectionStep);
					xOffset = 200 - 200 * scaleXModifier;
					yOffest = 200 - 200 * scaleYModifier;
				}
				else
				{
					selectionStep = Mathf.Abs(selectionHeightOffset / 100);
					scaleXModifier = Mathf.Lerp(1, selectionAnimateSmallScaleX, selectionStep);
					scaleYModifier = Mathf.Lerp(1, selectionAnimateSmallScaleY, selectionStep);
					xOffset = 200 - 200 * scaleXModifier;
					yOffest = 200 - 200 * scaleYModifier;
				}
				GUI.DrawTexture(new Rect(Screen.width - 220 + xOffset, Screen.height - 225 + selectionHeightOffset + yOffest, 200 * scaleXModifier, 200 * scaleYModifier), powerupIcons[selectionCurrentIndex]);
			}
			else
			{
				GUI.DrawTexture(new Rect(Screen.width - 220, Screen.height - 225, 200, 200), powerupIcons[(int)currentPowerUp]);
				if (currentPowerUp == powerUpType.SelfDestruct)
					game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 100, Screen.height / 2 - 100, 200, 200), Mathf.CeilToInt((nextDestructTick - Time.time)).ToString(), game.guiManager.largeNumberStyle, Color.black, Color.white);
			}
		}
	}

	#endregion
	#region powerup stuff
	public void determinePowerUp()
	{
		int powerUpInt;
		int myPlace = GetComponent<PlayerStats>().MyPlace;
		numOfPlayers = game.levelManager.getPlayerGameObjectsNotFinished().Count;

		if (myPlace == 1)
		{
			powerUpInt = Random.Range(0, firstPlayerPowerUp.Length);
			currentPowerUp = firstPlayerPowerUp[powerUpInt];
		}
		else if (myPlace >= numOfPlayers)
		{
			powerUpInt = Random.Range(0, lastPlayerPowerUp.Length);
			currentPowerUp = lastPlayerPowerUp[powerUpInt];

		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageOne * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageTwo * numOfPlayers))
		{
			powerUpInt = Random.Range(0, firstSecondPercentage.Length);
			currentPowerUp = firstSecondPercentage[powerUpInt];
		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageTwo * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageThree * numOfPlayers))
		{
			powerUpInt = Random.Range(0, secondThirdPercentage.Length);
			currentPowerUp = secondThirdPercentage[powerUpInt];
		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageThree * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageFour * numOfPlayers))
		{
			powerUpInt = Random.Range(0, thirdFourthPercentage.Length);
			currentPowerUp = thirdFourthPercentage[powerUpInt];
		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageFour * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageFive * numOfPlayers))
		{
			powerUpInt = Random.Range(0, fourthFifthPercentage.Length);
			currentPowerUp = fourthFifthPercentage[powerUpInt];
		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageFive * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageSix * numOfPlayers))
		{
			powerUpInt = Random.Range(0, fifthSixthPercentage.Length);
			currentPowerUp = fifthSixthPercentage[powerUpInt];
		}
		else if (myPlace >= numOfPlayers - Mathf.Ceil(percentageSix * numOfPlayers) && myPlace <= numOfPlayers - Mathf.Ceil(percentageSeven * numOfPlayers))
		{
			powerUpInt = Random.Range(0, sixthSeventhPercentage.Length);
			currentPowerUp = sixthSeventhPercentage[powerUpInt];
		}
		if (currentPowerUp == powerUpType.SelfDestruct)
			nextDestructTick = Time.time + destructDelay;
	}

	public void usePowerUp()
	{
		if (!GetComponent<MovePlayer>().InputEnabled && currentPowerUp != powerUpType.SelfDestruct)
			return;
		switch (currentPowerUp)
		{
			case powerUpType.FusRoDah:
				useFusRoDah();
				game.audioManager.playFusRoDahSound();
				break;
			case powerUpType.InfiniteBoost:
				useInfiniteBoost();
				break;
			case powerUpType.SumoQuake:
				useSumoQuake();
				game.audioManager.playSumoQuakeSound();
				break;
			case powerUpType.Meteor:
				useMeteor();
				break;
			case powerUpType.Whirlpool:
				useWhirlpool();
				break;
			case powerUpType.Teleport:
				useTeleport();
				game.audioManager.playTeleportSound();
				break;
			case powerUpType.BrickWall:
				useBrickWall();
				game.audioManager.playBrickwallSound();
				break;
			case powerUpType.SonicBOOM:
				useSonicBOOM();
				break;
			case powerUpType.RingOfFire:
				networkView.RPC("UseRingOfFire", RPCMode.All, GetComponent<PlayerStats>().MyTeamInt);
				currentPowerUp = powerUpType.none;
				game.audioManager.playFireShieldSound();
				break;
			case powerUpType.slowBubbles:
				useSlowBubbles();
				game.audioManager.playBubbleSound();
				break;
			case powerUpType.selecting:
				selectionStartTime -= selectionTime / 10;
				break;
			case powerUpType.SelfDestruct:
				SelfDestruct();
				break;
		}
	}

	public void useFusRoDah()
	{
		GameObject fusRoDah = (GameObject)Network.Instantiate(fusRoDahProjectile, new Vector3(transform.position.x, transform.position.y + 3, transform.position.z), Quaternion.identity, 0);
		fusRoDah.networkView.RPC("SetVelocity", RPCMode.All, rigidbody.velocity);
		fusRoDah.networkView.RPC("SetSpawningTeam", RPCMode.All, gameObject.GetComponent<PlayerStats>().MyTeamInt);
		currentPowerUp = powerUpType.none;
		audioManager.playFusRoDahSound();
	}

	public void useInfiniteBoost()
	{
		origBoostDelay = gameObject.GetComponent<MovePlayer>().boostDelay;
		endboost = Time.time + boostLength;
		gameObject.GetComponent<MovePlayer>().usePowerUp = true;
		gameObject.GetComponent<MovePlayer>().boostDelay = powerUpBoostDelay;
	}

	public void endInfiniteBoost()
	{
		gameObject.GetComponent<MovePlayer>().boostDelay = origBoostDelay;
		gameObject.GetComponent<MovePlayer>().usePowerUp = false;
		currentPowerUp = powerUpType.none;
	}

	public void useMeteor()
	{
		Network.Instantiate(meteorProjectile, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity, 0);
		currentPowerUp = powerUpType.none;
	}

	public void useSumoQuake()
	{
		GameObject sumoQuake = (GameObject)Network.Instantiate(sumoQuakeProjectile, new Vector3(transform.position.x, transform.position.y - 10, GameObject.Find("Lane02").transform.position.z), Quaternion.identity, 0);
		sumoQuake.networkView.RPC("SetSpawningTeam", RPCMode.All, gameObject.GetComponent<PlayerStats>().MyTeamInt);
		currentPowerUp = powerUpType.none;
		audioManager.playSumoQuakeSound();
	}

	public void useWhirlpool()
	{
		GameObject whirlpool = (GameObject)Network.Instantiate(whirlpoolPrefab, new Vector3(transform.position.x, transform.position.y + 10, GameObject.Find("Lane02").transform.position.z), Quaternion.identity, 0);
		whirlpool.networkView.RPC("SetSpawningTeam", RPCMode.All, gameObject.GetComponent<PlayerStats>().MyTeamInt);
		currentPowerUp = powerUpType.none;
	}

	public void SelfDestruct()
	{
		if (Time.time > nextDestructTick)
		{
			Network.Instantiate(selfDestructExplosion, transform.position, Quaternion.identity, 0);
			GetComponent<Respawn>().respawn();
			currentPowerUp = powerUpType.none;
		}
	}

	public void useTeleport()
	{
		int playerToSwitch = Random.Range(0, (int)Mathf.Ceil(game.levelManager.getPlayerGameObjectsNotFinished().Count / 2f));
		GameObject targetCheckPoint = game.levelManager.getPlayerNotFinished(playerToSwitch).GetComponent<Respawn>().lastCheckpoint;
		Vector3 targetPos = targetCheckPoint.transform.position;

        GetComponent<Respawn>().lastCheckpoint = targetCheckPoint;

		transform.position = targetPos;
		currentPowerUp = powerUpType.none;
	}

	public void useBrickWall()
	{
		GameObject BW = (GameObject)Network.Instantiate(brickWall, new Vector3(transform.position.x - 10, transform.position.y, 0), Quaternion.identity, 0);
		currentPowerUp = powerUpType.none;
	}

	public void useSonicBOOM()
	{
		GameObject sonicBoom = (GameObject)Network.Instantiate(sonicBOOMProjectile, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity, 0);
		sonicBoom.networkView.RPC("SetSpawningTeam", RPCMode.All, gameObject.GetComponent<PlayerStats>().MyTeamInt);
		currentPowerUp = powerUpType.none;
	}

	[RPC]
	public void UseRingOfFire(int teamInt)
	{
		GameObject ringOfFire = (GameObject)Instantiate(ringOfFirePrefab, transform.position, Quaternion.identity);
		ringOfFire.GetComponent<RingOfFireAI>().following = gameObject;
		ringOfFire.GetComponent<RingOfFireAI>().TeamIntThatSpawnedThis = teamInt;
	}

	void useSlowBubbles()
	{
		for (int i = -1; i <= 1; i++)
		{
			for (int j = -3; j <= 3; j++)
			{
				GameObject slowBubbles = (GameObject)Network.Instantiate(slowBubblePrefab, new Vector3(transform.position.x, transform.position.y - 5, 0) + new Vector3(j * 10, 0, i * 16), Quaternion.identity, 0);
				slowBubbles.GetComponent<SlowBubbleAI>().TeamIntThatSpawnedThis = GetComponent<PlayerStats>().MyTeamInt;
			}
		}
		currentPowerUp = powerUpType.none;
	}
	#endregion
	#region triggers
	public void OnTriggerEnter(Collider c)
	{
		if (Network.player == networkView.owner && c.gameObject.tag == "PowerUp" && !HasPowerUp)
		{
			currentPowerUp = powerUpType.selecting;
			selectionStartTime = Time.time;
		}
		if (c.gameObject.tag == "SonicBoom")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				gameObject.GetComponent<Respawn>().respawn();
			}
		}
		if (c.gameObject.tag == "FusRoDah")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				if (c.gameObject.GetComponent<FusRoDahAI>().TeamIntThatSpawnedThis != -1)
				{
					if (c.gameObject.GetComponent<FusRoDahAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
					{
						gameObject.GetComponent<Respawn>().respawn();
					}
				}
				else
				{
					gameObject.GetComponent<Respawn>().respawn();
				}
			}
		}
		if (c.gameObject.tag == "SumoQuake")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				if (!rigidbody.isKinematic)
				{
					if (c.gameObject.GetComponent<SumoQuakeAI>().TeamIntThatSpawnedThis != -1)
					{
						if (c.gameObject.GetComponent<SumoQuakeAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
						{
							rigidbody.angularVelocity = Vector3.zero;
							rigidbody.velocity = Vector3.zero;
							rigidbody.AddForce(new Vector3(0, 300, 0), ForceMode.Impulse);
						}
					}
					else
					{
						rigidbody.angularVelocity = Vector3.zero;
						rigidbody.velocity = Vector3.zero;
						rigidbody.AddForce(new Vector3(0, 300, 0), ForceMode.Impulse);
					}
				}
			}
		}
		if (c.gameObject.tag == "Whirlpool")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				if (!rigidbody.isKinematic)
				{
					if (c.gameObject.GetComponent<WhirlpoolAI>().TeamIntThatSpawnedThis != -1)
					{
						if (c.gameObject.GetComponent<WhirlpoolAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
						{
							rigidbody.angularVelocity /= whirlpoolSlowModifier;
							rigidbody.velocity /= whirlpoolSlowModifier;
						}
					}
					else
					{
						rigidbody.angularVelocity /= whirlpoolSlowModifier;
						rigidbody.velocity /= whirlpoolSlowModifier;
					}
				}
			}
		}
		if (c.gameObject.tag == "RingOfFire")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				if (!rigidbody.isKinematic)
				{
					if (c.gameObject.GetComponent<RingOfFireAI>().TeamIntThatSpawnedThis != -1)
					{
						if (c.gameObject.GetComponent<RingOfFireAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
						{
							GetComponent<Respawn>().respawn();
						}
					}
					else
					{
						GetComponent<Respawn>().respawn();
					}
				}
			}
		}
		if (c.gameObject.tag == "SonicBOOM")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
				if (c.gameObject.GetComponent<SonicBOOMAI>().TeamIntThatSpawnedThis != -1)
				{
					if (c.gameObject.GetComponent<SonicBOOMAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
					{
						GetComponent<Respawn>().respawn();
					}
				}
				else
				{
					//rigidbody.AddForce(new Vector3(0, 300, 0), ForceMode.Impulse);
				}
			}
		}
		if (c.gameObject.tag == "SlowBubble")
		{
			if (c.gameObject.networkView.owner != Network.player)
			{
			    if (c.gameObject.GetComponent<SlowBubbleAI>().TeamIntThatSpawnedThis != -1)
			    {
			        if (c.gameObject.GetComponent<SlowBubbleAI>().TeamIntThatSpawnedThis != gameObject.GetComponent<PlayerStats>().MyTeamInt)
			        {
						rigidbody.velocity *= 3 / 4;
						rigidbody.angularVelocity *= 3 / 4;
						Network.Destroy(c.gameObject);
					}
				}
				else
				{
					rigidbody.velocity *= 3 / 4;
					rigidbody.angularVelocity *= 3 / 4;
					Network.Destroy(c.gameObject);
				}
			}
		}
	}

	#endregion
	#region RPCs

	[RPC]
	public void GetPowerup(int powerup)
	{
		currentPowerUp = (powerUpType)powerup;
	}

	#endregion
}
