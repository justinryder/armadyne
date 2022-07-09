using UnityEngine;
using System.Collections;
using System.Collections.Generic;


#region enumForView
public enum cameraView
{
    normalView = 0,
    sideView,
    behindView,
    topView,
    otherView,
	otherView02,
	otherView03
}
#endregion
public class CameraFollow : MonoBehaviour
{
	#region publicVariables

	public GameObject startCinematic,
                      endCinematic;

    public cameraView enumOriginalCameraView = 0,
        enumTargetCameraView = 0;

	public float
		cameraMoveTime = .001f,
		cameraMoveStepInterval = .01f,
		teleportStepInterval = .005f,
		//cineStepInterval = .00028f; //Rocket
		//cineStepInterval = .000315f, //Hold Your colour
		//cineStepInterval = .00044f; //Northern Lights
		cineStepInterval = .01f,
		toPlayerStepInterval = .005f,
		fogStartDistance = 150,
		fogEndDistance = 500;

	public int numberOfLaps = 3;

    public Vector3
        //Distance Vector3s
        normalDistance = new Vector3(-15, 20, -75),
        sideDistance = new Vector3(0, 15, -80),
        behindDistance = new Vector3(-50, 25, 0),
        topDistance = new Vector3(-5, 50, 0),
        otherDistance = new Vector3(-20, 80, 0),
		otherDistance02 = new Vector3(100, -50, 0),
		otherDistance03 = new Vector3(-20, 80, 0),
        originalDistance = Vector3.zero,
        targetDistance = Vector3.zero,
        currentDistance = Vector3.zero,
		start = Vector3.zero,
		end = Vector3.zero;

    public bool
        win = false,
        animatingCamera = false,
		teleportAnimate = false,
		levelCinematicAnimate = false,
		toPlayerAnimate = false;
		
	#endregion
	#region privateVariables
	GameObject level2Water;

	public BoostGauge boostGauge;

	private bool underWater = false;
    private int
		lap = 0,
		spectatingIndex = 0;


	private float
		followStep = 0,
		animateStep = 0,
		nextCameraMove = 0;

	public float AnimateStep
	{
		get { return animateStep; }
		set { animateStep = value; }
	}
	public float FollowStep
	{
		get { return followStep; }
		set { followStep = value; }
	}

	private GameObject player;
	public GameObject IsFollowing
	{
		get { return player; }
	}

	private Game game;

	#endregion
	#region GUI Start & Update

	void OnGUI()
	{
		if (!win)
		{
			GUI.skin = game.guiManager.armadyneSkin;
			if (levelCinematicAnimate || toPlayerAnimate)
			{
				if (GUI.Button(new Rect(Screen.width - 200, Screen.height - 50, 200, 50), "Skip"))
				{
					animateStep = 0;
					levelCinematicAnimate = false;
					toPlayerAnimate = false;
					nextCameraMove = Time.time + cameraMoveTime;
					originalDistance = normalDistance;
					targetDistance = normalDistance;
					transform.LookAt(player.transform);
					game.levelManager.readyForCountdown();
				}
			}
			else if (game.levelManager.StartTime == double.MaxValue && game.guiManager.MenuState != MenuState.loading)
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height / 2 - 25, 400, 50), "Waiting for " + (game.levelManager.PlayerGameObjects.Count - game.levelManager.PlayersReadyForCountdown) + " players...", game.guiManager.centeredStyle, Color.black, Color.white);
		}
	}

	void Start ()
	{
		transform.position = behindDistance;
		transform.LookAt(Vector3.zero);
		transform.position = currentDistance = targetDistance = normalDistance;

		if (Application.loadedLevel == 2)
		{
			level2Water = GameObject.Find("Daylight Water");
			underWater = true;
			determineShaders();
		}

		if (Application.loadedLevel != 0)
		{
			boostGauge = transform.FindChild("Boost Gauge").gameObject.GetComponent<BoostGauge>();
		}

		GameObject gameGO = GameObject.Find("Game");
		if (gameGO != null)
			game = gameGO.GetComponent<Game>();

		if (!game.optionsManager.SoundMusic)
			audio.enabled = false;
    }

	void Update ()
    {
		if (!win)
		{
			if (levelCinematicAnimate)
			{
				PlayCinematic(cineStepInterval);

				if (animateStep >= 1)
				{
					animateStep = 0;
					toPlayerAnimate = true;
					levelCinematicAnimate = false;
					start = transform.position;
					end = player.transform.position + normalDistance;
				}
			}
			else if (toPlayerAnimate)
			{
				PlayCinematic(toPlayerStepInterval);

				transform.LookAt(player.transform);

				if (animateStep >= 1)
				{
					animateStep = 0;
					toPlayerAnimate = false;
					nextCameraMove = Time.time + cameraMoveTime;
					originalDistance = currentDistance;
					targetDistance = normalDistance;
					game.levelManager.readyForCountdown();
				}
			}
			else if (teleportAnimate)
			{
				PlayCinematic(teleportStepInterval);

				if (animateStep >= 1)
				{
					animateStep = 0;
					teleportAnimate = false;
					player.rigidbody.isKinematic = false;
					player.GetComponent<MovePlayer>().InputEnabled = true;
				}
			}
			else
			{
				followPlayer();
			}
			if (player != null && player.GetComponent<PlayerStats>().MyLapsCompleted >= numberOfLaps)
				Win();
		}
		else
		{
			if (Input.GetKeyUp(KeyCode.D))
			{
				spectateNext();
			}
			if (Input.GetKeyUp(KeyCode.A))
			{
				spectatePrevious();
			}
			followPlayer();
		}
		if (Application.loadedLevel == 2)
		{
			underWater = transform.position.y < level2Water.transform.position.y;
			determineShaders();
		}
	}
	#endregion
	#region animateCamera
	private IEnumerator animationControl(Vector3 startCameraDistance, Vector3 endCameraDistance)
    {
        if (followStep >= 1)
        {
            followStep = 0;
            animatingCamera = true;
        }

        while (followStep < 1f)
        {
            followStep += cameraMoveStepInterval;
            currentDistance = Vector3.Lerp(startCameraDistance, endCameraDistance, followStep);
			
            yield return null;
        }
		followStep = 0;
        animatingCamera = false;
        yield return 0;
    }
    #endregion
	#region cameraStuff

	public void determineTargetDistance()
	{
        if (enumTargetCameraView == cameraView.normalView)
            targetDistance = normalDistance;
        else if (enumTargetCameraView == cameraView.behindView)
            targetDistance = behindDistance;
        else if (enumTargetCameraView == cameraView.topView)
            targetDistance = topDistance;
        else if (enumTargetCameraView == cameraView.otherView)
            targetDistance = otherDistance;
		else if (enumTargetCameraView == cameraView.otherView02)
            targetDistance = otherDistance02;
		else if (enumTargetCameraView == cameraView.otherView03)
            targetDistance = otherDistance03;
        else if (enumTargetCameraView == cameraView.sideView)
            targetDistance = sideDistance;
        else
            targetDistance = normalDistance;
	}

	public void overrideDistance(Vector3 newDist)
	{
		targetDistance = newDist;
		originalDistance = newDist;
		currentDistance = newDist;
	}

	void followPlayer()
	{
		if (player == null)
			return;
		
		if (Time.time > nextCameraMove && animatingCamera)
		{
			determineTargetDistance();
			nextCameraMove = Time.time + cameraMoveTime;
			StartCoroutine(animationControl(originalDistance, targetDistance));
		}
		else if (!animatingCamera)
			currentDistance = targetDistance;

		transform.position = player.transform.position + currentDistance;
		transform.LookAt(player.transform);

		if (player.tag == "Player" && player.GetComponent<PlayerStats>().MyLapsLeft == 0)
			spectateNext();
	}

	public void PlayCinematic(float stepInterval)
	{
		if (animateStep >= 1)
		{
			animateStep = 0;
			start = transform.position;
			end = player.transform.position + currentDistance;
		}

		transform.position = Vector3.Lerp(start, end, animateStep);
		animateStep += stepInterval;
	}

    public void Win()
    {
		if (Network.isServer)
			game.levelManager.TellServerOfWin(Network.player);
		else
			game.networkView.RPC("TellServerOfWin", RPCMode.Server, Network.player);
        win = true;
		spectateNext();
    }

	#endregion
	#region Shaders

	public void determineShaders()
	{
		if (underWater)
		{
			//flip water
			//level2Water.transform.rotation = new Quaternion(level2Water.transform.rotation.x, level2Water.transform.rotation.y, 1, level2Water.transform.rotation.z);

			//blur
			//((MonoBehaviour)camera.GetComponent("Vignetting")).enabled = true;

			//color correction
			//((MonoBehaviour)camera.GetComponent("ColorCorrectionCurves")).enabled = true;

			//rendersetting fog
			float depth = level2Water.transform.position.y - transform.position.y;
			float step = Mathf.Clamp(depth / 1200, 0, 1);
			RenderSettings.fog = true;
			RenderSettings.fogStartDistance = Mathf.Lerp(fogStartDistance * 2, fogStartDistance, step);
			RenderSettings.fogEndDistance = Mathf.Lerp(fogEndDistance * 2, fogEndDistance, step);
			//Debug.Log("depth: " + depth + " step: " + step + " startDis: " + fogStartDistance + " calcedStartDis: " + Mathf.Lerp(fogStartDistance * 2, fogStartDistance, step));

			//global fog (on the camera)
			((MonoBehaviour)camera.GetComponent("GlobalFog")).enabled = true;

			//frustum distance
			camera.farClipPlane = 1000;

			//skybox
			camera.clearFlags = CameraClearFlags.SolidColor;
		}
		else
		{
			//flip water
			//level2Water.transform.rotation = new Quaternion(level2Water.transform.rotation.x, level2Water.transform.rotation.y, 0, level2Water.transform.rotation.z);

			//blur
			//((MonoBehaviour)camera.GetComponent("Vignetting")).enabled = false;

			//color correction
			//((MonoBehaviour)camera.GetComponent("ColorCorrectionCurves")).enabled = false;

			//rendersetting fog
			RenderSettings.fog = false;

			//global fog (on the camera)
			((MonoBehaviour)camera.GetComponent("GlobalFog")).enabled = false;

			//frustum distance
			camera.farClipPlane = 3500;

			//skybox
			camera.clearFlags = CameraClearFlags.Skybox;
		}
	}

	#endregion
	#region Spectating

	void spectateNext()
	{
		spectatingIndex++;
		List<GameObject> players = game.levelManager.getPlayerGameObjectsNotFinished();
		if (spectatingIndex >= players.Count)
			spectatingIndex = 0;
		if (players.Count != 0)
			follow(players[spectatingIndex]);
	}

	void spectatePrevious()
	{
		spectatingIndex--;
		List<GameObject> players = game.levelManager.getPlayerGameObjectsNotFinished();
		if (spectatingIndex < 0)
		if (players.Count != 0)
			follow(players[spectatingIndex]);
	}

	#endregion
	#region otherMethods

	public void follow(GameObject g)
	{
		player = g;
	}

	#endregion
}