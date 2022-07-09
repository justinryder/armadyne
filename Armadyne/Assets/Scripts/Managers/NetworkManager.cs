using UnityEngine;
using System.Collections;
using System;

public class NetworkManager : MonoBehaviour
{
	#region Managers

	AudioManager audioManager;
	Game game;
	GUIManager guiManager;
	LevelManager levelManager;
	OptionsManager optionsManager;
	PlayerManager playerManager;
	TeamManager teamManager;

	#endregion
	#region Data

	public int
		connectionPort = 25001,
		minAllowedConnections = 1,
		maxAllowedConnections = 64,
		maxConnections = 32;

	public string connectionIP = "127.0.0.1";

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		//setup the managers
		audioManager = GetComponent<AudioManager>();
		game = GetComponent<Game>();
		guiManager = GetComponent<GUIManager>();
		levelManager = GetComponent<LevelManager>();
		optionsManager = game.optionsManager;
		playerManager = game.playerManager;
		teamManager = GetComponent<TeamManager>();

		connectionIP = Network.player.ipAddress;
	}

	void OnPlayerConnected(NetworkPlayer player)
	{
		if (Application.loadedLevel != 0)
			Network.CloseConnection(player, true);
	}

	void OnPlayerDisconnected(NetworkPlayer player)
	{
		Network.RemoveRPCs(player);
		Network.DestroyPlayerObjects(player);
	}

	#endregion
	#region RPCs

	

	#endregion
	#region Methods

	public void connect()
	{
		Network.Connect(connectionIP, connectionPort);
	}

	public void disconnect()
	{
		Network.RemoveRPCs(Network.player);
		guiManager.MenuState = MenuState.main;
		guiManager.ChatOn = false;
		guiManager.PlayerSettingsOn = false;
		teamManager.clear();
		Application.LoadLevel(levelManager.disconnectedLevel);
		Network.Disconnect(200);
	}

	public void initializeServer()
	{
		Network.InitializeServer(maxConnections, connectionPort, false);
	}

	#endregion
}
