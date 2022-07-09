using UnityEngine;
using System.Collections;
using System;

public class Connector : MonoBehaviour
{

	public string connectionIP = "127.0.0.1";
	public int
		connectionPort = 25001,
		minConnections = 1,
		maxConnections = 64,
		currentConnections = 32;

	public GameObject
		playerPrefab,
		spawnLocation,
		player;

	public Vector2 guiLocation = Vector2.zero;

	void Awake()
	{
		Network.InitializeServer(currentConnections, connectionPort, false);
	}

	void OnGUI()
	{

		if (Network.peerType == NetworkPeerType.Disconnected)
		{
			GUI.Label(new Rect(guiLocation.x + 10, guiLocation.y + 10, 300, 20), "Status: Disconnected");
			connectionIP = GUI.TextField(new Rect(guiLocation.x + 130, guiLocation.y + 30, 120, 20), connectionIP);
			if (GUI.Button(new Rect(guiLocation.x + 10, guiLocation.y + 30, 120, 20), "Client Connect"))
			{
				Network.Connect(connectionIP, connectionPort);
			}
			if (GUI.Button(new Rect(guiLocation.x + 10, guiLocation.y + 50, 120, 20), "Initialize Server"))
			{
				Network.InitializeServer(currentConnections, connectionPort, false);
			}
			GUI.Label(new Rect(guiLocation.x + 10, guiLocation.y + 70, 300, 20), "Max Players: " + currentConnections);
			currentConnections = (int)GUI.HorizontalSlider(new Rect(guiLocation.x + 10, guiLocation.y + 90, 120, 20), currentConnections, minConnections, maxConnections);
		}
		else if (Network.peerType == NetworkPeerType.Client)
		{
			GUI.Label(new Rect(guiLocation.x + 10, guiLocation.y + 10, 300, 20), "Status: Connected as Client to IP: " + Network.connections[0].ipAddress);
			if (GUI.Button(new Rect(guiLocation.x + 10, guiLocation.y + 30, 120, 20), "Disconnect"))
			{
				Network.Disconnect(200);
			}
		}
		else if (Network.peerType == NetworkPeerType.Server)
		{
			GUI.Label(new Rect(guiLocation.x + 10, guiLocation.y + 10, 300, 20), "Status: Connected as Server at IP: " + Network.player.ipAddress);
			if (GUI.Button(new Rect(guiLocation.x + 10, guiLocation.y + 30, 120, 20), "Disconnect"))
			{
				Network.Disconnect(200);
			}
		}
	}

	void Update()
	{
		player.GetComponent<MovePlayer>().InputEnabled = true;
		player.rigidbody.isKinematic = false;
	}
	
	void OnServerInitialized()
	{
		SpawnPlayer();
	}

	void OnConnectedToServer()
	{
		SpawnPlayer();
	}

	void OnPlayerDisconnected(NetworkPlayer player)
	{
		Network.RemoveRPCs(player);
		Network.DestroyPlayerObjects(player);
	}
	
	void SpawnPlayer()
	{
		player = (GameObject)Network.Instantiate(playerPrefab, spawnLocation.transform.position, spawnLocation.transform.rotation, 0);
		GameObject.Find("Main Camera").GetComponent<CameraFollow>().follow(player);
		player.GetComponent<MovePlayer>().SetPlayer(Network.player);
		player.GetComponent<MovePlayer>().InputEnabled = true;
		player.rigidbody.isKinematic = false;
	}
}
