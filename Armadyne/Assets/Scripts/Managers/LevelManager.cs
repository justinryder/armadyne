using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LevelManager : MonoBehaviour
{
	#region Managers

	AudioManager audioManager;
	Game game;
	GUIManager guiManager;
	NetworkManager networkManager;
	OptionsManager optionsManager;
	PlayerManager playerManager;
	TeamManager teamManager;

	#endregion
	#region Public Data

	public string disconnectedLevel = "Lobby";

	public GameObject playerPrefab, meteorLevel1EndPrefab;

	public string[] supportedNetworkLevels = { "Level01", "Level02", "Level03" };

	public Texture2D[] supportedNetworkLevelPreviews;

	#endregion
	#region Private Data

	int currentLevelIndex = 0;
	public int CurrentLevelIndex
	{
		get { return currentLevelIndex; }
		set { currentLevelIndex = value; }
	}

	bool hasAskedForCountdown = false;
	public bool HasAskedForCountdown
	{
		get { return hasAskedForCountdown; }
		set { hasAskedForCountdown = value; }
	}

	int lastLevelPrefix = 0;
	public int LastLevelPrefix
	{
		get { return lastLevelPrefix; }
		set { lastLevelPrefix = value; }
	}

	public GameObject MainCamera { get; set; }

	List<GameObject> playerGameObjects = new List<GameObject>();
	public List<GameObject> PlayerGameObjects
	{
		get { return playerGameObjects; }
		set { playerGameObjects = value; }
	}

	public int PlayersFinishedWithRace { get; set; }

	public int PlayersReadyForCountdown { get; set; }

	public Transform SpawnLocations { get; set; }

	Queue<Vector3>
		spawnLocationsNotUsed = new Queue<Vector3>(),
		spawnLocationsUsed = new Queue<Vector3>();

	double startTime = double.MaxValue;
	public double StartTime
	{
		get { return startTime; }
		set { startTime = value; }
	}

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		//setup the managers
		audioManager = GetComponent<AudioManager>();
		game = GetComponent<Game>();
		guiManager = GetComponent<GUIManager>();
		networkManager = GetComponent<NetworkManager>();
		optionsManager = game.optionsManager;
		playerManager = game.playerManager;
		teamManager = GetComponent<TeamManager>();
	}

	void OnDisconnectedFromServer()
	{
		Application.LoadLevel(disconnectedLevel);
	}

	void OnPlayerDisconnected(NetworkPlayer player)
	{
		sendPlacementData();
	}

	void OnLevelWasLoaded(int level)
	{
		if (Network.isClient)
			networkView.RPC("OnClientLevelLoaded", RPCMode.Server, Network.player, level);
	}

	void Update()
	{
		updatePlayerPlacement();
	}

	#endregion
	#region RPCs

	[RPC]
	void askServerForNextSpawnLocation(NetworkPlayer player)
	{
		bool hasBeenSpawned = false;
		foreach (GameObject go in GameObject.FindGameObjectsWithTag("Player"))
			if (go.networkView.owner == player)
				hasBeenSpawned = true;
		if (!hasBeenSpawned)
			networkView.RPC("SpawnPlayer", player, getNextSpawnLocation(), Quaternion.identity);
	}

	[RPC]
	void AskServerToCountDown()
	{
		if (startTime != double.MaxValue)
			return;
		PlayersReadyForCountdown++;
		networkView.RPC("SetPlayersReadyForCountdown", RPCMode.Others, PlayersReadyForCountdown);
		if (PlayersReadyForCountdown >= Network.connections.Length + 1)
		{
			networkView.RPC("StartLevelCountdown", RPCMode.AllBuffered);
		}
	}

	[RPC]
	void SetPlayersReadyForCountdown(int playersReady)
	{
		if (Network.isServer)
			return;
		PlayersReadyForCountdown = playersReady;
	}

	[RPC]
	void LevelEnd()
	{
		LoadLevel(disconnectedLevel, lastLevelPrefix + 1);
		guiManager.RPCLevelEnd();
	}

	[RPC]
	IEnumerator LoadLevel(string level, int levelPrefix)
	{
		startTime = double.MaxValue;
		guiManager.RPCLoadLevelBegin(level, levelPrefix);
		hasAskedForCountdown = false;
		playerGameObjects.Clear();
		playerGameObjects = new List<GameObject>();

		lastLevelPrefix = levelPrefix;

		Network.RemoveRPCsInGroup(0);
		Network.RemoveRPCsInGroup(1);

		// There is no reason to send any more data over the network on the default channel,
		// because we are about to load the level, thus all those objects will get deleted anyway
		Network.SetSendingEnabled(0, false);

		// We need to stop receiving because first the level must be loaded first.
		// Once the level is loaded, rpc's and other state update attached to objects in the level are allowed to fire
		Network.isMessageQueueRunning = false;

		// All network views loaded from a level will get a prefix into their NetworkViewID.
		// This will prevent old updates from clients leaking into a newly created scene.
		Network.SetLevelPrefix(levelPrefix);
		Application.LoadLevel(level);
		yield return null;
		yield return null;

		// Allow receiving data again
		Network.isMessageQueueRunning = true;
		// Now the level has been loaded and we can start sending out data to clients
		Network.SetSendingEnabled(0, true);

		if (Network.isServer)
			OnServerLevelLoad(level);

		foreach (GameObject g in FindObjectsOfType(typeof(GameObject)))
			g.SendMessage("OnNetworkLoadedLevel", SendMessageOptions.DontRequireReceiver);

		guiManager.RPCLoadLevelEnd(level, levelPrefix);
	}

	[RPC]
	void NewPlayer(NetworkPlayer networkPlayer, string playerName, float red, float green, float blue, int teamIndex)
	{
		StartCoroutine(NewPlayerCoroutine(networkPlayer, playerName, red, green, blue, teamIndex));
	}

	IEnumerator NewPlayerCoroutine(NetworkPlayer networkPlayer, string playerName, float red, float green, float blue, int teamIndex)
	{
		bool added = false;
		while (!added)
		{
			foreach (GameObject playerObject in GameObject.FindGameObjectsWithTag("Player"))
			{
				if (playerObject.networkView.owner == networkPlayer || playerObject.GetComponent<MovePlayer>().theOwner == networkPlayer)
				{
					if (playerGameObjects.Contains(playerObject))
					{
						yield break;
					}
					Color playerColor;
					playerColor = new Color(red, green, blue);
					playerObject.GetComponent<PlayerStats>().setStats(playerName, playerGameObjects.Count + 1, 0, playerColor, (teamIndex >= 0 && teamIndex < teamManager.TeamList.Count) ? teamManager.TeamList[teamIndex] : null);
					addPlayerGameObject(playerObject);
					teamManager.connectPlayerGameObject(playerObject);
					added = true;
					yield break;
				}
			}
			yield return null;
		}
	}

	[RPC]
	void OnClientLevelLoaded(NetworkPlayer player, int level)
	{
		if (level == 0)
			return;
		bool hasBeenSpawned = false;
		foreach (GameObject go in GameObject.FindGameObjectsWithTag("Player"))
			if (go.networkView.owner == player)
				hasBeenSpawned = true;
		if (!hasBeenSpawned)
			networkView.RPC("SpawnPlayer", player, getNextSpawnLocation(), Quaternion.identity);
	}

	[RPC]
	void SetSelectedLevelIndex(int index)
	{
		currentLevelIndex = index;
	}

	[RPC]
	void SpawnPlayer(Vector3 spawnLocation, Quaternion spawnRotation)
	{
		foreach (GameObject go in GameObject.FindGameObjectsWithTag("Player"))
			if (go.networkView.owner == Network.player)
				return;

		GameObject newPlayer = (GameObject)Network.Instantiate(playerPrefab, spawnLocation, spawnRotation, 0);
		playerManager.MyGameObject = newPlayer;
		newPlayer.rigidbody.isKinematic = true;

		MainCamera = GameObject.Find("Main Camera");
		CameraFollow cameraFollow = MainCamera.GetComponent<CameraFollow>();
		cameraFollow.follow(newPlayer);
		cameraFollow.start = GameObject.Find("StartCine").transform.position;
		cameraFollow.end = GameObject.Find("EndCine").transform.position;
		cameraFollow.levelCinematicAnimate = true;

		MovePlayer movePlayerScript = newPlayer.GetComponent<MovePlayer>();
		newPlayer.networkView.RPC("SetPlayer", RPCMode.AllBuffered, Network.player);
		movePlayerScript.setNetworkColor(playerManager.MyColor);
		movePlayerScript.InputEnabled = false;

		newPlayer.GetComponent<PlayerStats>().setStats(playerManager.MyName, playerGameObjects.Count + 1, 0, playerManager.MyColor, playerManager.MyTeam);
		addPlayerGameObject(newPlayer);

		networkView.RPC("NewPlayer", RPCMode.Others, Network.player, playerManager.MyName, playerManager.MyColor.r, playerManager.MyColor.g, playerManager.MyColor.b, teamManager.TeamList.IndexOf(playerManager.MyTeam));
	}

	[RPC]
	void StartLevelCountdown()
	{
		startTime = Network.time;
		guiManager.RPCStartLevelCountdown();
	}

	[RPC]
	public void TellServerOfWin(NetworkPlayer player)
	{
		PlayersFinishedWithRace++;
		if (PlayersFinishedWithRace > Network.connections.Length)
		{
			if (Application.loadedLevel == 1)
				networkView.RPC("FollowMeteor", RPCMode.All);
			else
			{
				Network.RemoveRPCsInGroup(0);
				Network.RemoveRPCsInGroup(1);
				networkView.RPC("LevelEnd", RPCMode.All);
			}
		}
	}

	[RPC]
	IEnumerator FollowMeteor()
	{
		GameObject meteor = (GameObject)Instantiate(meteorLevel1EndPrefab, new Vector3(-1000, 5000, -1000), Quaternion.identity);
		meteor.GetComponent<MeteorAI>().overrideDestination = GameObject.FindGameObjectWithTag("Teleporter").transform.position;
		while (GameObject.FindGameObjectWithTag("Level1Meteor") == null) { yield return null; }
		GameObject.Find("Main Camera").GetComponent<CameraFollow>().follow(GameObject.FindGameObjectWithTag("Level1Meteor"));
		//GameObject.Find("Main Camera").GetComponent<CameraFollow>().overrideDistance(new Vector3(-300, 1000, -500));
		guiManager.MenuState = MenuState.none;
		while (GameObject.FindGameObjectWithTag("Level1Meteor") != null) { yield return null; }
		Network.RemoveRPCsInGroup(0);
		Network.RemoveRPCsInGroup(1);
		LevelEnd();
	}

	#endregion
	#region public Methods

	public void addPlayerGameObject(GameObject go)
	{
		if (playerGameObjects.Contains(go))
			return;
		playerGameObjects.Add(go);
	}

	public Vector3 getNextSpawnLocation()
	{
		//if out of spawn locations then swap the queues
		if (spawnLocationsNotUsed.Count == 0)
			while (spawnLocationsUsed.Count != 0)
				spawnLocationsNotUsed.Enqueue(spawnLocationsUsed.Dequeue());

		//get the next location and return it
		Vector3 spawnLoc = spawnLocationsNotUsed.Dequeue();
		spawnLocationsUsed.Enqueue(spawnLoc);
		return spawnLoc;
	}

	public GameObject getPlayer(int index)
	{
		if (index < playerGameObjects.Count && index >= 0)
			return playerGameObjects[index];
		return null;
	}

	public GameObject getPlayerNotFinished(int index)
	{
		List<GameObject> players = getPlayerGameObjectsNotFinished();
		if (index < players.Count && index >= 0)
			return players[index];
		return null;
	}

	public GameObject getPlayer(NetworkPlayer netPlayer)
	{
		foreach (GameObject go in playerGameObjects)
			if (go.networkView.owner == netPlayer)
				return go;
		return null;
	}

	public List<GameObject> getPlayersNotOnTeam(Team team)
	{
		List<GameObject> players = new List<GameObject>();
		foreach (GameObject go in playerGameObjects)
		{
			bool onTeam = false;
			foreach (PlayerManager pm in team.MemberPlayerManagers)
			{
				if (go.networkView.owner == pm.MyNetworkPlayer)
				{
					onTeam = true;
					break;
				}
			}
			if (!onTeam)
				players.Add(go);
		}
		return players;
	}

	public List<GameObject> getPlayersOnTeam(Team team)
	{
		List<GameObject> players = new List<GameObject>();
		foreach (GameObject go in playerGameObjects)
		{
			foreach (PlayerManager pm in team.MemberPlayerManagers)
			{
				if (go.networkView.owner == pm.MyNetworkPlayer)
				{
					players.Add(go);
					break;
				}
			}
		}
		return players;
	}

	public List<GameObject> getPlayerGameObjects()
	{
		for (int i = 0; i < playerGameObjects.Count; i++)
		{
			if (playerGameObjects[i] == null)
			{
				playerGameObjects.RemoveAt(i);
				i--;
			}
		}
		return playerGameObjects;
	}

	public List<GameObject> getPlayerGameObjectsNotFinished()
	{
		List<GameObject> playersInGame = new List<GameObject>();
		for (int i = 0; i < playerGameObjects.Count; i++)
		{
			if (playerGameObjects[i] == null)
			{
				playerGameObjects.RemoveAt(i);
				i--;
			}
			if (playerGameObjects[i].GetComponent<PlayerStats>().MyLapsLeft != 0)
				playersInGame.Add(playerGameObjects[i]);
		}
		return playersInGame;
	}

	public void loadSelectedLevelForAll()
	{
		Network.RemoveRPCsInGroup(0);
		Network.RemoveRPCsInGroup(1);
		networkView.RPC("LoadLevel", RPCMode.AllBuffered, supportedNetworkLevels[currentLevelIndex], lastLevelPrefix + 1);
		guiManager.MenuState = MenuState.loading;
	}

	public void selectNextLevel()
	{
		currentLevelIndex = currentLevelIndex + 1;
		if (currentLevelIndex >= supportedNetworkLevels.Length)
			currentLevelIndex = 0;
		networkView.RPC("SetSelectedLevelIndex", RPCMode.OthersBuffered, currentLevelIndex);
	}

	public void readyForCountdown()
	{
		if (hasAskedForCountdown)
			return;

		if (Network.isClient)
			networkView.RPC("AskServerToCountDown", RPCMode.Server);
		else
			AskServerToCountDown();

		hasAskedForCountdown = true;
	}

	#endregion
	#region Private Methods

	bool codeADAM(Transform t)
	{
		int numOfChildren = t.childCount;
		if (numOfChildren == 0)
			return false;

		for (int i = 0; i < numOfChildren; i++)
		{
			Transform child = t.GetChild(i);
			if (child.gameObject.tag == "Checkpoint")
			{
				spawnLocationsNotUsed.Enqueue(child.transform.position);
			}
			else if (child.childCount != 0)
				codeADAM(child);
		}

		return true;
	}

	void OnServerLevelLoad(string levelName)
	{
		if (levelName == disconnectedLevel)
			return;

		PlayersReadyForCountdown = 0;
		PlayersFinishedWithRace = 0;

		//find the network object in the level and get the spawn locations from it
		SpawnLocations = GameObject.Find("Network").GetComponent<NetworkLevelInfo>().spawnLocations;

		//clear the spawning queues
		spawnLocationsNotUsed.Clear();
		spawnLocationsUsed.Clear();

		//add the spawn locations to the not used queue
		codeADAM(SpawnLocations);

		//spawn player on server
		SpawnPlayer(getNextSpawnLocation(), Quaternion.identity);

		//spawn player on clients and update teams on clients
		foreach (NetworkPlayer networkPlayer in Network.connections)
		{
			bool hasBeenSpawned = false;
			foreach (GameObject go in GameObject.FindGameObjectsWithTag("Player"))
				if (go.networkView.owner == networkPlayer)
					hasBeenSpawned = true;
			if (!hasBeenSpawned)
				networkView.RPC("SpawnPlayer", networkPlayer, getNextSpawnLocation(), Quaternion.identity);
		}
	}

	void updatePlayerPlacement()
	{
		if (Application.loadedLevel == 0)
			return;
		//sort the players by lap then by position
		bool swapped = true;
		bool shouldSendData = false;
		while (swapped)
		{
			swapped = false;
			for (int i = 0; i < playerGameObjects.Count - 1; i++)
			{
				if (playerGameObjects[i] == null)
				{
					playerGameObjects.RemoveAt(i);
					i--;
					continue;
				}
				int iLap = playerGameObjects[i].GetComponent<PlayerStats>().MyLapsCompleted;
				int i1Lap = playerGameObjects[i + 1].GetComponent<PlayerStats>().MyLapsCompleted;
				float iX = playerGameObjects[i].transform.position.x;
				float i1X = playerGameObjects[i + 1].transform.position.x;
				if (iLap < i1Lap || (iLap == i1Lap && iX < i1X))
				{
					GameObject tempGameObject = playerGameObjects[i];
					playerGameObjects[i] = playerGameObjects[i + 1];
					playerGameObjects[i + 1] = tempGameObject;
					swapped = true;
					shouldSendData = true;
				}
			}
		}

		if (!Network.isServer)
			return;
		//if placement has changed then send new info
		if (shouldSendData)
			sendPlacementData();
	}

	void sendPlacementData()
	{
		for (int i = 0; i < playerGameObjects.Count; i++)
		{
			PlayerStats ps = playerGameObjects[i].GetComponent<PlayerStats>();
			ps.MyPlace = i + 1;
			playerGameObjects[i].networkView.RPC("SetPlace", RPCMode.All, ps.MyNetworkPlayer, ps.MyPlace);
			playerGameObjects[i].networkView.RPC("SetLaps", RPCMode.All, ps.MyNetworkPlayer, ps.MyLapsCompleted);
		}
	}

	#endregion
}
