using UnityEngine;
using System.Collections;
using System.Collections.Generic;

//managers
[RequireComponent(typeof(AudioManager))]
[RequireComponent(typeof(GUIManager))]
[RequireComponent(typeof(LevelManager))]
[RequireComponent(typeof(NetworkManager))]
[RequireComponent(typeof(TeamManager))]

//unity components
[RequireComponent(typeof(NetworkView))]

public class Game : MonoBehaviour
{
	//managers
	public AudioManager audioManager;
	public GUIManager guiManager;
	public LevelManager levelManager;
	public NetworkManager networkManager;
	public OptionsManager optionsManager;
	public PlayerManager playerManager;
	public TeamManager teamManager;

	void Awake()
	{
		//if we are reloading the lobby destroy this becuase there already is one
		if (GameObject.FindGameObjectsWithTag("Game").Length > 1)
			Destroy(gameObject);

		//dont ever destroy this
		DontDestroyOnLoad(this);
		networkView.group = 1;

		//setup the managers
		audioManager = GetComponent<AudioManager>();
		guiManager = GetComponent<GUIManager>();
		levelManager = GetComponent<LevelManager>();
		networkManager = GetComponent<NetworkManager>();
		optionsManager = new OptionsManager(this);
		playerManager = new PlayerManager(this);
		teamManager = GetComponent<TeamManager>();
	}

	void OnConnectedToServer()
	{
		playerManager.MyNetworkPlayer = Network.player;
		playerManager.MyName = "Client";
		networkView.RPC("JoinTeam", RPCMode.Server, Network.player, playerManager.MyName, -1);
	}

	void OnServerInitialized()
	{
		playerManager.MyNetworkPlayer = Network.player;
		playerManager.MyName = "Host";
		StartCoroutine(teamManager.JoinTeam(Network.player, playerManager.MyName, -1));
	}
}
