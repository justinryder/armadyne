using UnityEngine;
using System.Collections;

[RequireComponent(typeof(PlayerStats))]
[RequireComponent(typeof(NetworkView))]

public class MovePlayer : MonoBehaviour
{
	Game game;

	#region Modifiable Values

	public float
		//delays
		moveDelay = .5f,
		boostDelay = 3,
		stickDelay = .01f,
		jumpDelay = .1f,

		//level size tweaks
		laneSwitchDistance = 16,

		//physics
		stickyGravity = 2100,
		gravity = 175,

		//player modifiers
		aSpeed = 70,
		pSpeed = 50,
		jumpForceTerrain = 8000,
		jumpForceOffTerrain = 4500,
		laneJumpForce = 1000,
		accelerationModifier = 400,
		boostSpeed = 100;

	public GameObject boostPrefab;

	#endregion
	#region Private Data

	GameObject level2Water,
		boostThing;

	private bool
		jumping = false,
		stickyGrav = false,
		right = true,
		opposite = false,
		inBubble = false,
		canSwitchLanes = true,
		inputEnabled = true,
		usingPowerUp = false,
		underWater = false;

	public bool InputEnabled
	{
		get { return inputEnabled; }
		set { inputEnabled = value; }
	}

	public bool usePowerUp
	{
		get { return usingPowerUp; }
		set { usingPowerUp = value; }
	}

    float
		//delays
		nextMove = 0,
        nextBoost = 0,
        nextStick = 0,
		nextJump = 0,
		
		//lane switching
		lastLane = 0,
		nextLane = 0,
		laneStep = 1.5f,//DO NOT EVER START THIS AT 1 OR LESS
		laneStepInterval = .075f,
		lastYCoord; //This is used for the invisible ceiling

	Vector3
		stickyGravityVec = Vector3.down,
		deltaTorque = Vector3.zero,
		boostVector = Vector3.right;

	GameObject
		onTerrain = null,
		bubble = null;

	CameraFollow cameraFollow;

	//networking data
	public NetworkPlayer theOwner;
	Vector3
		lastPosition,
		lastVelocity;
	float lastAngularVelocity;
	Quaternion lastRotation;
	float
		minimumMovementToSend = .05f,
		minimumRotationToSend = .05f,
		minimumVelocityToSend = .05f,
		minimumAngularVelocityToSend = .05f;

	//input data
	float
		currentInputHorizontal = 0f,
		currentInputVertical = 0f;
	bool
		currentInputJump = false,
		currentInputBoost = false;

	public bool SwitchingLanes
	{
		get { return (laneStep > .2f && laneStep < .8f); }
	}

	#endregion
	#region Inherited from MonoBhaviour

	void Awake()
	{
		if (!networkView.isMine)
			enabled = false;

        cameraFollow = GameObject.Find("Main Camera").GetComponent<CameraFollow>();
		game = GameObject.Find("Game").GetComponent<Game>();
		if (Application.loadedLevel == 2)
			level2Water = GameObject.Find("Daylight Water");

		rigidbody.isKinematic = true;
		inputEnabled = false;
		lastYCoord = transform.position.y;
	}

    void Start()
	{
        gameObject.rigidbody.maxAngularVelocity = aSpeed;
    }

	void Update()
	{
		if (Application.loadedLevel == 2)
		{
			//above water
			if (aSpeed != 70 && transform.position.y > level2Water.transform.position.y)
			{
				aSpeed = 70;
				rigidbody.maxAngularVelocity = aSpeed;
				pSpeed = 50;
				gravity = 175;
				stickyGravity = 700;
				accelerationModifier = 100;
				jumpForceTerrain = 6000;
				jumpForceOffTerrain = 4500;
				laneJumpForce = 2000;
				game.audioManager.setInWater(false);
				underWater = false;
			}
			//under water
			else if (aSpeed != 40 && transform.position.y < level2Water.transform.position.y)
			{
				aSpeed = 40;
				pSpeed = 40;
				rigidbody.maxAngularVelocity = aSpeed;
				gravity = 50;
				stickyGravity = 1500;
				boostSpeed = 60;
				accelerationModifier = 100;
				jumpForceTerrain = 4000;
				jumpForceOffTerrain = 1500;
				laneJumpForce = 700;
				game.audioManager.setInWater(true);
				underWater = true;
			}
		}
		if (inBubble)
		{
			transform.position = bubble.transform.position;
			lastYCoord = transform.position.y;
		}
		else if (inputEnabled)
		{
			if (networkView.isMine)
			{
				//get current input
				currentInputHorizontal = Input.GetAxis("Horizontal");
				currentInputVertical = Input.GetAxis("Vertical");
				currentInputJump = Input.GetAxis("Jump") > 0.1;
				currentInputBoost = Input.GetButton("Fire1");

				//apply input
                inputSetDirection();
                inputSwitchLanes();
                inputBoost();
                inputTorque();
                inputJump();

				//Changes the pitch on the roll sound based on speed
				//game.audioManager.rollSound.audio.volume = Mathf.Max(Mathf.Abs(gameObject.rigidbody.velocity.x * (.25f / (aSpeed))), 
					//Mathf.Abs(gameObject.rigidbody.velocity.y * (.25f / (aSpeed))));

				//switch lanes
				if (laneStep <= 1)
					interpolateLaneSwitching();

				//apply forces
				applyTorque();
				applyGravities();
				
				//checks the player position and moves them to a lane if theyre not on the three lanes
				checkPosition();
			}
		}
		
		/////////////////////////////////////////////Network send transform and rigidbody data
		if (networkView.isMine)
		{
			if (Vector3.Distance(transform.position, lastPosition) > minimumMovementToSend)
			{
				lastPosition = transform.position;
				networkView.RPC("SetPosition", RPCMode.Others, transform.position);
			}
			if (Quaternion.Angle(transform.rotation, lastRotation) > minimumRotationToSend)
			{
				lastRotation = transform.rotation;
				networkView.RPC("SetRotation", RPCMode.Others, transform.rotation);
			}
			if (!rigidbody.isKinematic)
			{
				if (Vector3.Distance(rigidbody.velocity, lastVelocity) > minimumVelocityToSend)
				{
					lastVelocity = rigidbody.velocity;
					networkView.RPC("SetVelocity", RPCMode.Others, rigidbody.velocity);
				}
				if (Mathf.Abs(rigidbody.angularVelocity.z - lastAngularVelocity) > minimumAngularVelocityToSend)
				{
					lastAngularVelocity = rigidbody.angularVelocity.z;
					networkView.RPC("SetAngularVelocity", RPCMode.Others, rigidbody.angularVelocity.z);
				}
			}
		}

		if (boostThing != null)
			boostThing.transform.position = transform.position;
	}

	void OnCollisionStay(Collision c)
	{
		boostVector = Vector3.Cross(c.contacts[0].normal, Vector3.forward);

        if (c.gameObject.tag == "Terrain")
        {
			stickyGravityVec = -c.contacts[0].normal;
            onTerrain = c.gameObject;
        }
		else if (c.gameObject.tag == "Opposite")
		{
			stickyGravityVec = -c.contacts[0].normal;
			onTerrain = c.gameObject;
			boostVector = -Vector3.Cross(c.contacts[0].normal, Vector3.forward);
		}
        else 
        {
			onTerrain = null;
        }

		canSwitchLanes = true;
	}

    void OnCollisionEnter(Collision c)
	{
		boostVector = Vector3.Cross(c.contacts[0].normal, Vector3.forward);

		if (SwitchingLanes)
		{
			if (c.gameObject.tag == "Player")
			{
				if (c.gameObject.transform.position.z != transform.position.z)
				{
					if (c.gameObject.transform.position.z < transform.position.z)
					{
						c.gameObject.networkView.RPC("SwitchLanesBackward", c.gameObject.networkView.owner);
						switchLanesForward();
					}
					if (c.gameObject.transform.position.z > transform.position.z)
					{
						c.gameObject.networkView.RPC("SwitchLanesForward", c.gameObject.networkView.owner);
						switchLanesBackward();
					}
				}
				game.audioManager.playHitSound();
			}
			else
			{
				canSwitchLanes = false;
				transform.position = new Vector3(transform.position.x, transform.position.y, lastLane);
				nextLane = lastLane;
				laneStep = 0;
			}
		}

        if (c.gameObject.tag == "Terrain")
        {
            stickyGravityVec = -c.contacts[0].normal;
			onTerrain = c.gameObject;
			jumping = false;
			if (!usingPowerUp)
				rigidbody.maxAngularVelocity = pSpeed;

			applyStickyGravity();
        }

		if(c.gameObject.tag == "Opposite")
		{
			opposite = true;
			stickyGravityVec = -c.contacts[0].normal;
			onTerrain = c.gameObject;
			jumping = false;
			rigidbody.angularVelocity = -rigidbody.angularVelocity;
			deltaTorque *= -1;
			if (!usingPowerUp)
				rigidbody.maxAngularVelocity = pSpeed;

			applyStickyGravity();
		}

		jumping = false;
		lastYCoord = transform.position.y;
    }

	void OnCollisionExit(Collision c)
	{
		boostVector = Vector3.right;

		if (c.gameObject.tag == "Terrain")
		{
			nextStick = Time.time + stickDelay;
			onTerrain = null;
			stickyGravityVec = Vector3.down;

			if (!usingPowerUp)
				rigidbody.maxAngularVelocity = aSpeed;

			applyStickyGravity();
		}

		if (c.gameObject.tag == "Opposite")
		{
			opposite = false;
			nextStick = Time.time + stickDelay;
			onTerrain = null;
			stickyGravityVec = Vector3.down;
			rigidbody.angularVelocity = -rigidbody.angularVelocity;

			if (!usingPowerUp)
				rigidbody.maxAngularVelocity = aSpeed;

			applyStickyGravity();
		}

		lastYCoord = transform.position.y;
	}

	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Glass")
			boost();

		if (networkView.isMine)//networkView.owner == Network.player)
	        changeCameraView(c);
	}
	void OnTriggerExit(Collider c)
	{

	}

	void interpolateLaneSwitching()
	{
		if (laneStep > 1 || !canSwitchLanes)
			return;
		else
		{
			transform.position = new Vector3(transform.position.x, transform.position.y, Mathf.Lerp(lastLane, nextLane, laneStep));

			laneStep += laneStepInterval;
		}
	}

	#endregion
	#region Apply Forces

	void applyGravities()
	{
		//add force to stick player to terrain or add normal gravity
        if (onTerrain != null)
		{
			applyStickyGravity();
		}
		else
		{
            if (Time.time < nextStick)
            {
				applyStickyGravity();
            }
            else
            {
                applyGravity();
            }
		}
	}

	void applyGravity()
    {
        transform.rigidbody.AddForce(-Vector3.up * gravity);
        stickyGrav = false;
    }

    public void applyStickyGravity()
    {
        transform.rigidbody.AddForce(stickyGravityVec * stickyGravity);
        stickyGrav = true;
    }

	void applyTorque()
	{
        if (!cameraFollow.teleportAnimate)
		    transform.rigidbody.AddRelativeTorque(deltaTorque, ForceMode.Acceleration);
	}

	#endregion
	#region Input

	void inputBoost()
	{
        if (Time.time > nextBoost && currentInputBoost && !cameraFollow.teleportAnimate)
		{
			boost();

			nextBoost = Time.time + boostDelay;

			cameraFollow.boostGauge.nextBoost = nextBoost;
		}
	}

	void inputJump()
	{
		if (!jumping && currentInputJump && Time.time > nextJump)
		{
			jump();
			nextJump = Time.time + jumpDelay;
		}
	}

	void inputSetDirection()
	{
		if (currentInputVertical > .1f)
			right = true;
		if (currentInputVertical < -.1f)
			right = false;
	}

	void inputSwitchLanes()
	{
		if (Time.time > nextMove)
		{
			if (currentInputHorizontal > .1 && transform.position.z > -16)
				switchLanesBackward();
			if (currentInputHorizontal < -.1 && transform.position.z < 16)
				switchLanesForward();

			canSwitchLanes = true;
		}
	}

	void inputTorque()
	{
        if (!cameraFollow.teleportAnimate)
        {
            if (!opposite)
            {
                deltaTorque = -transform.forward * currentInputVertical * accelerationModifier;
            }
            else
            {
                deltaTorque = transform.forward * currentInputVertical * accelerationModifier;
            }
        }
	}

	#endregion
	#region Actions

	public void boost()
	{
        if (!cameraFollow.teleportAnimate)
		{
            if (right)
                rigidbody.AddForce(boostVector * boostSpeed, ForceMode.Impulse);
            else
                rigidbody.AddForce(-boostVector * boostSpeed, ForceMode.Impulse);

			if (right)
				boostThing = (GameObject)Network.Instantiate(boostPrefab, transform.position, new Quaternion(0, 1, 0, -1), 0);
			else
				boostThing = (GameObject)Network.Instantiate(boostPrefab, transform.position, new Quaternion(0, 1, 0, 1), 0);

			Color tempColor = boostThing.GetComponent<ParticleSystem>().startColor = GetComponent<PlayerStats>().MyColor;
			networkView.RPC("SetBoostColor", RPCMode.Others, tempColor.r, tempColor.g, tempColor.b);

			if (networkView.isMine)
				game.audioManager.playBoostSound();
        }
	}

	[RPC]
	IEnumerator SetBoostColor(float r, float g, float b)
	{
		while (boostThing == null)
		{
			foreach (GameObject go in GameObject.FindGameObjectsWithTag("BoostParticles"))
			{
				if (go.networkView.owner == theOwner || go.networkView.owner == networkView.owner)
				{
					boostThing = go;
					boostThing.GetComponent<ParticleSystem>().startColor = new Color(r, g, b);
					yield break;
				}
			}
			yield return null;
		}
	}

	public void jump()
	{
        jumping = true;

        if (stickyGrav)
            transform.rigidbody.AddForce(-stickyGravityVec * (jumpForceTerrain + stickyGravity));
        else
			transform.rigidbody.AddForce(-stickyGravityVec * (jumpForceOffTerrain + gravity));

		nextStick = Time.time - stickDelay;

		if (networkView.isMine)
			game.audioManager.playJumpSound();
	}

    public void laneJump()
    {
        jumping = true;

        if (stickyGrav)
            transform.rigidbody.AddForce(-stickyGravityVec * (laneJumpForce + stickyGravity));
        else
            transform.rigidbody.AddForce(-stickyGravityVec * (laneJumpForce + gravity));

		if (networkView.isMine)
			game.audioManager.playJumpSound();
    }

	void switchLanesForward()
	{
		if (SwitchingLanes)
			return;

		nextMove = Time.time + moveDelay;

		laneJump();

		laneStep = 0;
		lastLane = transform.position.z;
		nextLane = transform.position.z + laneSwitchDistance;
	}

	void switchLanesBackward()
	{
		if (SwitchingLanes)
		{
			return;
		}
        nextMove = Time.time + moveDelay;

        laneJump();

		laneStep = 0;
		lastLane = transform.position.z;
		nextLane = transform.position.z - laneSwitchDistance;
	}

	#endregion
	#region Set Methods

	public IEnumerator setColor(Color newColor)
	{
		gameObject.transform.FindChild("Character").GetChild(0).renderer.material.color = newColor;
		if (Application.loadedLevel == 1)
		{
			DelayedCollisionGlow pulsingTrail = null;
			while (pulsingTrail == null)
			{
				pulsingTrail = GetComponent<DelayedCollisionGlow>();
				yield return null;
			}
			pulsingTrail.setColor(newColor);
		}
	}

	void setNextLane(float nLane)
	{
		nextLane = nLane;
	}

	void setLastLane(float lLane)
	{
		lastLane = lLane;
	}

	#endregion
	#region Get Methods

	public Color getColor()
	{
		return gameObject.transform.FindChild("Character").GetChild(0).renderer.material.color;
	}

	public bool getUnderWater()
	{
		if (Application.loadedLevel == 2)
			return (transform.position.y < level2Water.transform.position.y);
		else
			return underWater;
	}

	#endregion
	#region Networking

	[RPC]
	public void NetworkInit()
	{
		GameObject.Find("Main Camera").GetComponent<CameraFollow>().follow(gameObject);
	}

	[RPC]
	public void SetColor(NetworkViewID playerID, float r, float g, float b)
	{
		if (playerID == networkView.viewID)
			StartCoroutine("setColor", new Color(r, g, b));
	}

	public void setNetworkColor(Color color)
	{
		networkView.RPC("SetColor", RPCMode.AllBuffered, networkView.viewID, color.r, color.g, color.b);
	}

	[RPC]
	public void SetPlayer(NetworkPlayer player)
	{
		theOwner = player;
		if (player == Network.player)
			enabled = true;
	}

	[RPC]
	void SetAngularVelocity(float newAngVel)
	{
		if (rigidbody.isKinematic)
			return;
		rigidbody.angularVelocity = new Vector3(0, 0, newAngVel);
	}

	[RPC]
	void SetPosition(Vector3 newPos)
	{
		transform.position = newPos;
	}

	[RPC]
	void SetRotation(Quaternion newRot)
	{
		transform.rotation = newRot;
	}

	[RPC]
	void SetVelocity(Vector3 newVel)
	{
		if (rigidbody.isKinematic)
			return;
		rigidbody.velocity = newVel;
	}

	[RPC]
	void SwitchLanesForward()
	{
		switchLanesForward();
	}

	[RPC]
	void SwitchLanesBackward()
	{
		switchLanesBackward();
	}

	#endregion
    #region Camera Stuff
    public void changeCameraView(Collider c)
    {
		if (cameraFollow.enumOriginalCameraView == cameraView.normalView)
            cameraFollow.originalDistance = cameraFollow.normalDistance;
        else if (cameraFollow.enumOriginalCameraView == cameraView.behindView)
            cameraFollow.originalDistance = cameraFollow.behindDistance;
        else if (cameraFollow.enumOriginalCameraView == cameraView.otherView)
            cameraFollow.originalDistance = cameraFollow.otherDistance;
		else if (cameraFollow.enumOriginalCameraView == cameraView.otherView02)
            cameraFollow.originalDistance = cameraFollow.otherDistance02;
		else if (cameraFollow.enumOriginalCameraView == cameraView.otherView03)
            cameraFollow.originalDistance = cameraFollow.otherDistance03;
        else if (cameraFollow.enumOriginalCameraView == cameraView.sideView)
            cameraFollow.originalDistance = cameraFollow.sideDistance;
        else if (cameraFollow.enumOriginalCameraView == cameraView.topView)
            cameraFollow.originalDistance = cameraFollow.topDistance;

        if (c.gameObject.tag == "SideView")
        {
            cameraFollow.enumOriginalCameraView = cameraView.sideView;
            cameraFollow.enumTargetCameraView = cameraView.sideView;
            cameraFollow.animatingCamera = true;
        }
        else if (c.gameObject.tag == "BehindView")
        {
            cameraFollow.enumOriginalCameraView = cameraView.behindView;
            cameraFollow.enumTargetCameraView = cameraView.behindView;
            cameraFollow.animatingCamera = true;
        }
        else if (c.gameObject.tag == "TopView")
        {
           cameraFollow.enumOriginalCameraView = cameraView.topView;
           cameraFollow.enumTargetCameraView = cameraView.topView;
           cameraFollow.animatingCamera = true;
        }
        else if (c.gameObject.tag == "OtherView")
        {
            cameraFollow.enumOriginalCameraView = cameraView.otherView;
            cameraFollow.enumTargetCameraView = cameraView.otherView;
            cameraFollow.animatingCamera = true;
        }
		else if (c.gameObject.tag == "OtherView02")
        {
            cameraFollow.enumOriginalCameraView = cameraView.otherView02;
            cameraFollow.enumTargetCameraView = cameraView.otherView02;
            cameraFollow.animatingCamera = true;
        }
		else if (c.gameObject.tag == "OtherView03")
        {
            cameraFollow.enumOriginalCameraView = cameraView.otherView03;
            cameraFollow.enumTargetCameraView = cameraView.otherView03;
            cameraFollow.animatingCamera = true;
        }
        else if (c.gameObject.tag == "NormalView")
        {
            cameraFollow.enumOriginalCameraView = cameraView.normalView;
            cameraFollow.enumTargetCameraView = cameraView.normalView;
            cameraFollow.animatingCamera = true;
        }
    }
    #endregion
	#region Bubble Stuff

	public void generateBubble(GameObject bubblePrefab)
	{
		foreach (GameObject b in GameObject.FindGameObjectsWithTag("Bubble"))
			if (b.GetComponent<Bubble>().Player == gameObject)
				return;
		bubble = (GameObject)Instantiate(bubblePrefab, transform.position, Quaternion.identity);
		bubble.GetComponent<Bubble>().setPlayer(gameObject);
		inBubble = true;
	}

	public void popBubble()
	{
		inBubble = false;
	}

	#endregion
	#region checks
	public void checkPosition()
	{
		if (laneStep == 0 && !canSwitchLanes && !SwitchingLanes)
		{
			if (transform.position.z > 10)
				transform.position = new Vector3(transform.position.x, transform.position.y, 16);
			else if (transform.position.z < -10)
				transform.position = new Vector3(transform.position.x, transform.position.y, -16);
			else if (transform.position.z > -5 && transform.position.x < 5)
				transform.position = new Vector3(transform.position.x, transform.position.y, 0);
		}

		if (transform.position.z > 16)
			transform.position = new Vector3(transform.position.x, transform.position.y, 16);
		else if (transform.position.z < -16)
			transform.position = new Vector3(transform.position.x, transform.position.y, -16);
	}
	#endregion
}