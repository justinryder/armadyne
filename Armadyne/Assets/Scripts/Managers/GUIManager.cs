using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public enum MenuState
{
	main = 0,
	lobby,
	inGame,
	pause,
	options,
	leaderBoard,
	countdown,
	loading,
	none
}

public class GUIManager : MonoBehaviour
{
	#region Managers

	AudioManager audioManager;
	Game game;
	LevelManager levelManager;
	NetworkManager networkManager;
	OptionsManager optionsManager;
	PlayerManager playerManager;
	TeamManager teamManager;

	#endregion
	#region Public Data

	public GUISkin
		armadyneSkin;

    public GUIStyle
        centeredStyle,
        gameTitleStyle,//upper center alignment, size 40 font
        invisStyle,
		smallNumberStyle,
		largeNumberStyle,
        numberTextStyle;//for numbers in text fields

	public Texture2D
		backgroundLobby,
		backgroundMain,
		backgroundLeaderBoard,
		backgroundLoading1,
		backgroundLoading2,
		backgroundLoading3,
		backgroundOptions,
		miniMapLine,
		minimapPlayerIcon,
		placingDot,
		placingBackground,
		placingBar,
		powerupHolster,
		spikeBall,
		whiteColorBox;

	#endregion
	#region Chat Data

	int chatHeight = 50;
	Vector2 chatScrollPosition = Vector2.zero;

	List<ChatMessage> chat = new List<ChatMessage>();

	string
		message = "",
		temp = "";

	#endregion
	#region GUI Data

	public bool ChatOn { get; set; }

	public MenuState MenuState { get; set; }

	public bool PlayerSettingsOn { get; set; }

	Vector2 teamScrollPosition = Vector2.zero;

	float endX = 1;

	Texture2D backgroundLoading;

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		//setup the managers
		audioManager = GetComponent<AudioManager>();
		game = GetComponent<Game>();
		levelManager = GetComponent<LevelManager>();
		networkManager = GetComponent<NetworkManager>();
		optionsManager = game.optionsManager;
		playerManager = game.playerManager;
		teamManager = GetComponent<TeamManager>();

		ChatOn = false;
		PlayerSettingsOn = false;

		backgroundLoading = backgroundLoading1;
	}

	void OnConnectedToServer()
	{
		if (Application.loadedLevelName == levelManager.disconnectedLevel)
		{
			ChatOn = true;
			PlayerSettingsOn = true;
		}
	}

	void OnGUI()
	{
		GUI.skin = armadyneSkin;
		switch (MenuState)
		{
			case MenuState.countdown:
				GUI_countdown();
				break;
			case MenuState.inGame:
				GUI_inGame();
				break;
			case MenuState.leaderBoard:
				GUI_leaderBoard();
				break;
			case MenuState.loading:
				GUI_loading();
				break;
			case MenuState.lobby:
				GUI_lobby();
				break;
			case MenuState.main:
				GUI_main();
				break;
			case MenuState.none:
				break;
			case MenuState.options:
				GUI_options();
				break;
			case MenuState.pause:
				GUI_pause();
				break;
		}
	}

	void OnDisconnectedFromServer()
	{
		PlayerSettingsOn = false;
		ChatOn = false;
	}

	void OnLevelWasLoaded(int level)
	{
		if (level == 0 && Network.peerType == NetworkPeerType.Disconnected)
			MenuState = MenuState.main;
		if (level == 0 && Network.peerType != NetworkPeerType.Disconnected)
		{
			MenuState = MenuState.lobby;
			ChatOn = true;
			PlayerSettingsOn = true;
		}
		if (level != 0)
		{
			endX = GameObject.FindGameObjectWithTag(level == 3 ? "LevelEnd" : "Teleporter").transform.position.x;
		}
		chat.Clear();
	}

	void OnServerInitialized()
	{
		ChatOn = true;
		PlayerSettingsOn = true;
	}

	void Update()
	{
		if (ChatOn)
		{
			if (message.EndsWith("\n") || Input.GetKeyUp(KeyCode.Return) || Input.GetKeyUp(KeyCode.KeypadEnter))
				sendMyMessage();
		}
		if (Input.GetKeyUp(KeyCode.Escape))
		{
			if (MenuState == MenuState.inGame)
			{
				MenuState = MenuState.pause;
			}
			else if (MenuState == MenuState.pause)
			{
				MenuState = MenuState.inGame;
			}
		}
	}

	#endregion
	#region GUI Functions

	int
		countdownTopX = Screen.width / 2 - 100,
		countdownTopY = Screen.height / 2 - 100,
		countdownWidth = 200,
		countdownHeight = 200;

	void GUI_countdown()
	{
		Color lastGUIColor = GUI.color;

		double countdown = levelManager.StartTime + 3 - Network.time;
		temp = Mathf.CeilToInt((float)countdown).ToString();

		drawOutlinedText(new Rect(countdownTopX, countdownTopY, countdownWidth, countdownHeight), temp, gameTitleStyle, Color.black, Color.white);

		if (countdown <= 0)
		{
			foreach (GameObject player in GameObject.FindGameObjectsWithTag("Player"))
			{
				if (player.networkView.isMine)
				{
					player.rigidbody.isKinematic = false;
					player.GetComponent<MovePlayer>().InputEnabled = true;
					break;
				}
			}

			//set the actual start time for the race
			levelManager.StartTime = Network.time;

			//switch to the in game gui
			MenuState = MenuState.inGame;
		}

		GUI.color = lastGUIColor;
	}

	void GUI_inGame()
	{
		if (playerManager == null || playerManager.MyGameObject == null)
			return;

		Color lastGUIColor = GUI.color;

		PlayerStats myStats = playerManager.MyGameObject.GetComponent<PlayerStats>();

		int xPos = 0;
		int yPos = 10;
		int height = 60;

		//---------your stats (top left)----------//
		//place
		switch (myStats.MyLapsCompleted)
		{
			case 0:
				height = 90;
				break;
			case 1:
				height = 120;
				break;
			case 2:
				height = 140;
				break;
			case 3:
				height = 170;
				break;
		}

		GUI.color = Color.white;
		//GUI.DrawTexture(new Rect(0, 0, 170, height), whiteColorBox);

		switch (myStats.MyPlace)
		{
			case 1:
				GUI.color = Color.green;
				break;
			case 2:
				GUI.color = Color.yellow;
				break;
			case 3:
				GUI.color = new Color(1, .5f, 0);
				break;
			default:
				GUI.color = Color.red;
				break;
		}
		if (myStats.MyPlace == 1 || myStats.MyPlace == 21)
			temp = "st";
		else if (myStats.MyPlace == 2 || myStats.MyPlace == 22)
			temp = "nd";
		else if (myStats.MyPlace == 3 || myStats.MyPlace == 23)
			temp = "rd";
		else
			temp = "th";
		drawOutlinedText(new Rect(0, 0, 80, 40), "" + myStats.MyPlace, largeNumberStyle, Color.black, Color.white);
		drawOutlinedText(new Rect(80, 10, 40, 30), temp, smallNumberStyle, Color.black, Color.white);
		GUI.color = lastGUIColor;
		drawOutlinedText(new Rect(10, 50, 150, 30), "Lap" + Mathf.Clamp((myStats.MyLapsCompleted + 1), 0, 3) + "of3", smallNumberStyle, Color.black, Color.white);

		if (myStats.Lap1Time != 0)
			drawOutlinedText(new Rect(10, 80, 200, 30), "1 " + secondsToString(myStats.Lap1Time), smallNumberStyle, Color.black, Color.white);
		if (myStats.Lap2Time != 0)
		{
			drawOutlinedText(new Rect(10, 110, 200, 25), "2 " + secondsToString(myStats.Lap2Time), smallNumberStyle, Color.black, Color.white);
			if (myStats.Lap2Diff < 0)
			{
				temp = "-";
				GUI.color = Color.green;
			}
			else
			{
				temp = "+";
				GUI.color = Color.red;
			}
			drawOutlinedText(new Rect(190, 80, 200, 25), temp + "(" + secondsToString(Mathf.Abs(myStats.Lap2Diff)) + ")", smallNumberStyle, Color.black, Color.white);
		}
		if (myStats.Lap3Time != 0)
		{
			GUI.color = lastGUIColor;
			drawOutlinedText(new Rect(10, 140, 200, 25), "3 " + secondsToString(myStats.Lap3Time), smallNumberStyle, Color.black, Color.white);
			if (myStats.Lap3Diff < 0)
			{
				temp = "-";
				GUI.color = Color.green;
			}
			else
			{
				temp = "+";
				GUI.color = Color.red;
			}
			drawOutlinedText(new Rect(190, 110, 200, 25), temp + "(" + secondsToString(Mathf.Abs(myStats.Lap3Diff)) + ")", smallNumberStyle, Color.black, Color.white);
		}

		//---------leaderboad (top right)---------//
		xPos = Screen.width - 200;
		yPos = 5;
		height = 140;
		switch (levelManager.PlayerGameObjects.Count)
		{
			case 1:
				height = 60;
				break;
			case 2:
				height = 80;
				break;
			case 3:
				height = 100;
				break;
			case 4:
				height = 120;
				break;
		}
		//bg
		GUI.color = Color.white;
		GUI.DrawTexture(new Rect(xPos, 0, 200, height), placingBackground);

		//heading
		GUI.color = Color.white;
		GUI.Label(new Rect(xPos + 30, yPos, 140, 30), "Top Players");
		yPos += 25;

		for (int i = 0; i < 5; i++)
		{
			GameObject go = levelManager.getPlayer(i);
			if (go == null)
				break;
			PlayerStats ps = go.GetComponent<PlayerStats>();


			//place
			GUI.color = ps.MyTeamInt == myStats.MyTeamInt ? Color.green : Color.red;
			GUI.DrawTexture(new Rect(xPos + 5, yPos, 20, 20), placingDot);
			GUI.Label(new Rect(xPos + 11, yPos, 20, 20), "" + ps.MyPlace);

			//name bg
			GUI.color = ps.MyTeam.Color;
			GUI.DrawTexture(new Rect(xPos + 10, yPos, 190, 20), placingBar);

			//name txt
			GUI.color = getReadableOppositeColor(ps.MyTeam.Color);
			GUI.Label(new Rect(xPos + 32, yPos - 2, 140, 25), ps.MyName);

			yPos += 20;
		}

		//minimap
		xPos = 300;
		yPos = 10;
		GUI.color = Color.white;
		GUI.DrawTexture(new Rect(xPos, yPos + 5, Screen.width - 600, 10), miniMapLine);
		GUI.DrawTexture(new Rect(xPos, yPos + 25, Screen.width - 600, 10), miniMapLine);
		GUI.DrawTexture(new Rect(xPos, yPos + 45, Screen.width - 600, 10), miniMapLine);
		foreach (GameObject go in levelManager.PlayerGameObjects)
		{
			if (go == null)
			{
				levelManager.PlayerGameObjects.Remove(go);
				break;
			}
			PlayerStats ps = go.GetComponent<PlayerStats>();
			float xStep = go.transform.position.x / endX;
			float xOffset = Mathf.Lerp(0, Screen.width - 600, xStep);
			float yOffset = 0;
			GUI.color = ps.MyColor;
			switch (ps.MyLapsCompleted)
			{
				case 1:
					yOffset = 20;
					break;
				case 2:
					yOffset = 40;
					break;
			}
			int w = 20;
			int h = 20;
			if (go.networkView.owner == Network.player)
			{
				xOffset -= w;
				yOffset -= h / 2;
				w *= 2;
				h *= 2;
			}
			else
				xOffset -= w / 2;
			GUI.DrawTexture(new Rect(xPos + xOffset, yPos + yOffset, w, h), minimapPlayerIcon);
		}

		GUI.color = lastGUIColor;

		//powerup holster
		GUI.DrawTexture(new Rect(Screen.width - 400, Screen.height - 400, 400, 400), powerupHolster);
	}

	void GUI_leaderBoard()
	{
		GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), backgroundLeaderBoard, ScaleMode.ScaleAndCrop);

		Color lastGUIColor = GUI.color;

		int xPos = 20;
		int yPos = 20;
		int count = 0;
		foreach (GameObject go in levelManager.PlayerGameObjects)
		{
			if (go == null)
			{
				levelManager.PlayerGameObjects.Remove(go);
				break;
			}
			count++;
			PlayerStats ps = go.GetComponent<PlayerStats>();
			GUI.color = ps.MyColor;
			if (count * 40 + 40 > Screen.height)
			{
				xPos += 280;
				yPos = 20;
				count = 0;
			}
			drawOutlinedText(new Rect(xPos - 10, yPos, 20, 50), ps.MyPlace.ToString() + ":", smallNumberStyle, Color.black, Color.white);
			drawOutlinedText(new Rect(xPos + 20, yPos, 200, 40), ps.MyName, smallNumberStyle, Color.black, Color.white);
			yPos += 40;
		}

		GUI.color = lastGUIColor;

		if (GUI.Button(new Rect(Screen.width - 200, Screen.height - 50, 200, 50), "Quit to Lobby"))
		{
			Application.LoadLevel(levelManager.disconnectedLevel);
			MenuState = MenuState.lobby;
		}
	}

	void GUI_loading()
	{
		GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), backgroundLoading, ScaleMode.ScaleAndCrop);

		drawOutlinedText(new Rect(Screen.width / 2, Screen.height / 2, 200, 100), "Loading", centeredStyle, Color.black, Color.white);
	}

	void GUI_lobby()
	{
		GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), backgroundLobby, ScaleMode.ScaleAndCrop);

		Color lastGUIColor = GUI.color;

		int xPos = 0;
		int yPos = 0;

		//-------connection area (top left)-------//
		if (Network.peerType == NetworkPeerType.Disconnected)
		{
			yPos = 0;

			GUI.Box(new Rect(0, yPos, 200, Screen.height), "");

            yPos += 25;

			GUI.Label(new Rect(10, yPos, 180, 40), "Status: Disconnected");

			yPos += 50;
			//if (GUI.Button(new Rect(0, yPos, 200, 50), networkManager.TryingQuickConnect ? "Stop" : "Quick Connect"))
			//    networkManager.quickConnect();
			//if (networkManager.TryingQuickConnect)
			//    GUI.Label(new Rect(200, yPos, 200, 50), "Trying to connect to: " + networkManager.CurrentQuickConnectIp);

			//yPos += 45;
			if (GUI.Button(new Rect(0, yPos, 200, 50), "Client Connect"))
				networkManager.connect();

			yPos += 45;
			networkManager.connectionIP = GUI.TextField(new Rect(10, yPos, 180, 30), networkManager.connectionIP, numberTextStyle);

			yPos += 75;
			if (GUI.Button(new Rect(0, yPos, 200, 50), "Initialize Server"))
				networkManager.initializeServer();

			yPos += 55;
			GUI.Label(new Rect(10, yPos, 180, 40), "Team Count: " + teamManager.TeamCount);
			yPos += 30;
			teamManager.TeamCount = (int)GUI.HorizontalSlider(new Rect(10, yPos, 180, 20), teamManager.TeamCount, teamManager.minTeamCount, teamManager.maxTeamCount);

			yPos += 20;
			GUI.Label(new Rect(10, yPos, 180, 40), "Team Size: " + teamManager.TeamSize);
			yPos += 30;
			teamManager.TeamSize = (int)GUI.HorizontalSlider(new Rect(10, yPos, 180, 20), teamManager.TeamSize, teamManager.minTeamSize, teamManager.maxTeamSize);

			networkManager.maxConnections = teamManager.TeamCount * teamManager.TeamSize;
		}

		else if (Network.peerType == NetworkPeerType.Client)
		{
			PlayerSettingsOn = true;
			ChatOn = true;

			yPos = 0;

			GUI.Box(new Rect(0, yPos, 200, Screen.height), "");

			yPos += 10;
			GUI.Label(new Rect(10, yPos, 180, 40), "Status: Client\nIP: " + Network.connections[0].ipAddress);

			yPos += 40;
			if (GUI.Button(new Rect(0, yPos, 200, 50), "Disconnect"))
				networkManager.disconnect();

			yPos += 60;
			GUI.DrawTexture(new Rect(0, yPos, 200, 200), levelManager.supportedNetworkLevelPreviews[levelManager.CurrentLevelIndex]);
		}

		else if (Network.peerType == NetworkPeerType.Server)
		{
			PlayerSettingsOn = true;
			ChatOn = true;

			yPos = 0;

			GUI.Box(new Rect(0, yPos, 200, Screen.height), "");

			GUI.Label(new Rect(10, yPos, 180, 40), "Status: Server\nIP: " + Network.player.ipAddress);

			yPos += 40;
			if (GUI.Button(new Rect(0, yPos, 200, 50), "Disconnect"))
				networkManager.disconnect();

			yPos += 50;
			if (GUI.Button(new Rect(0, yPos, 200, 50), "Start Game"))
				levelManager.loadSelectedLevelForAll();

			yPos += 50;
			if (GUI.Button(new Rect(0, yPos, 200, 50), levelManager.supportedNetworkLevels[levelManager.CurrentLevelIndex]))
				levelManager.selectNextLevel();

			yPos += 60;
			GUI.DrawTexture(new Rect(0, yPos, 200, 200), levelManager.supportedNetworkLevelPreviews[levelManager.CurrentLevelIndex]);
		}

		//-------quit to menu (bottom left)-------//
		if (GUI.Button(new Rect(0, Screen.height - 50, 200, 50), "Quit to Main Menu"))
			networkManager.disconnect();

		//-------chat area (middle)-------//
		if (ChatOn)
		{
			GUI.Box(new Rect(200, 0, Screen.width - 400, Screen.height - 50), "");

			chatScrollPosition = GUI.BeginScrollView(new Rect(200, 0, Screen.width - 400, Screen.height - 50), chatScrollPosition, new Rect(0, 0, Screen.width - 600, chatHeight));

			chatHeight = 0;

			foreach (ChatMessage cm in chat)
			{
				GUI.color = cm.SenderColor;
				GUI.Label(new Rect(0, chatHeight, 150, 25), cm.SenderName);
				GUI.color = lastGUIColor;
				GUI.Label(new Rect(150, chatHeight, Screen.width - 580, 25), cm.Message);

				chatHeight += 20;
			}
			
			GUI.EndScrollView();

			message = GUI.TextArea(new Rect(200, Screen.height - 43, Screen.width - 400, 30), message);

			if (GUI.Button(new Rect(Screen.width - 200, Screen.height - 50, 200, 50), "Send"))
				sendMyMessage();
		}

		//-------player area (right)-------//
		if (PlayerSettingsOn)
		{
			xPos = Screen.width - 200;
			yPos = 0;

			GUI.Box(new Rect(xPos, yPos, 200, Screen.height - 50), "");

			//name selection
			yPos += 10;
			GUI.Label(new Rect(xPos + 10, yPos, 180, 20), "Name:");
			temp = GUI.TextField(new Rect(Screen.width - 150, 10, 140, 30), playerManager.MyName);
			if (temp != playerManager.MyName)
			{
				playerManager.MyName = temp;
				networkView.RPC("UpdatePlayerName", RPCMode.AllBuffered, Network.player, temp);
			}

			//color selection
			yPos += 30;
			GUI.Label(new Rect(xPos + 10, yPos, 180, 20), "Color:");

			//color box
			GUI.color = playerManager.MyColor;
			GUI.DrawTexture(new Rect(xPos + 50, yPos, 140, 20), whiteColorBox);
			GUI.color = lastGUIColor;

			//color sliders
			Color tempColor = playerManager.MyColor;
			float
				colorMaxR = 1,
				colorMaxB = 1,
				colorMaxG = 1;
			if (playerManager.MyTeam.ColorType == TeamColorType.red)
			{
				tempColor.r = 1;
				colorMaxG = .5f;
				colorMaxB = .5f;
			}
			if (playerManager.MyTeam.ColorType == TeamColorType.green)
			{
				tempColor.g = 1;
				colorMaxR = .5f;
				colorMaxB = .5f;
			}
			if (playerManager.MyTeam.ColorType == TeamColorType.blue)
			{
				tempColor.b = 1;
				colorMaxR = .5f;
				colorMaxG = .5f;
			}

			yPos += 20;
			GUI.Label(new Rect(xPos + 10, yPos + 20, 180, 20), "R");
			tempColor.r = GUI.VerticalSlider(new Rect(xPos + 30, yPos, 20, 60), tempColor.r, colorMaxR, 0);
			if (playerManager.MyTeam.ColorType == TeamColorType.grey)
				tempColor.g = tempColor.b = tempColor.r;

			GUI.Label(new Rect(xPos + 50, yPos + 20, 180, 20), "G");
			tempColor.g = GUI.VerticalSlider(new Rect(xPos + 70, yPos, 20, 60), tempColor.g, colorMaxG, 0);
			if (playerManager.MyTeam.ColorType == TeamColorType.grey)
				tempColor.r = tempColor.b = tempColor.g;

			GUI.Label(new Rect(xPos + 90, yPos + 20, 180, 20), "B");
			tempColor.b = GUI.VerticalSlider(new Rect(xPos + 110, yPos, 20, 60), tempColor.b, colorMaxB, 0);
			if (playerManager.MyTeam.ColorType == TeamColorType.grey)
				tempColor.r = tempColor.g = tempColor.b;

			if (tempColor != playerManager.MyColor)
			{
				playerManager.MyColor = tempColor;
				networkView.RPC("UpdatePlayerColor", RPCMode.AllBuffered, Network.player, playerManager.MyColor.r, playerManager.MyColor.g, playerManager.MyColor.b);
			}

			GUI.color = lastGUIColor;

			//-------team area (middle right)-------//
			yPos += 70;

			teamScrollPosition = GUI.BeginScrollView(new Rect(xPos, yPos, 200, Screen.height - 50 + yPos), teamScrollPosition, new Rect(0, 0, 180, networkManager.maxConnections * 20));
				
				yPos = 0;

				for (int i = 0; i < teamManager.TeamList.Count; i++)
				{
					temp = "Team " + (i + 1);

					if (teamManager.TeamList[i].Name != "")
						temp = "Team " + teamManager.TeamList[i].Name;

					if (GUI.Button(new Rect(0, yPos, 200, 50), temp))
						networkView.RPC("JoinTeam", RPCMode.AllBuffered, Network.player, playerManager.MyName, i);
					
					yPos += 50;

					for (int j = 0; j < teamManager.TeamList[i].MemberPlayerManagers.Count; j++)
					{
						temp = "Empty";

						if (teamManager.TeamList[i].MemberPlayerManagers.Count > j)
						{
							GUI.color = teamManager.TeamList[i].MemberPlayerManagers[j].MyColor;
							GUI.DrawTexture(new Rect(10, yPos, 10, 20), whiteColorBox);
							GUI.color = lastGUIColor;

							temp = teamManager.TeamList[i].MemberPlayerManagers[j].MyName;
						}

						GUI.Label(new Rect(20, yPos, 150, 25), temp);

						yPos += 20;
					}
				}
				
			GUI.EndScrollView();
		}

		GUI.color = lastGUIColor;
	}

	void GUI_main()
	{
		if (Network.peerType == NetworkPeerType.Client || Network.peerType == NetworkPeerType.Server)
            MenuState = MenuState.lobby;
		return;

		//int xPos = Screen.width / 2 - 100;
		//int yPos = Screen.height / 2 - 100;

		//GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), backgroundMain, ScaleMode.ScaleAndCrop);

		//GUI.DrawTexture(new Rect(Screen.width / 2 - 125, 125, 100, 100), spikeBall);

		//GUI.Label(new Rect(Screen.width / 2 - 140, 150, 300, 100), "Armadyne", gameTitleStyle);
		//yPos += 55;

		//if (GUI.Button(new Rect(xPos, yPos, 200, 50), "Lobby"))
		//    MenuState = MenuState.lobby;

		//yPos += 50;
		//if (GUI.Button(new Rect(xPos, yPos, 200, 50), "Options"))
		//    MenuState = MenuState.options;

		//yPos += 50;
		//if (GUI.Button(new Rect(xPos, yPos, 200, 50), "Quit"))
		//    Application.Quit();
	}

	int
		optionsTopX = Screen.width / 2 - 110,
		optionsTopY = Screen.height / 2 - 100,
		optionsWidth = 200,
		optionsHeight = 220;

	void GUI_options()
	{
		//only draw the background in the lobby so we don't cover the game
		if (Application.loadedLevel == 0)
			GUI.DrawTexture(new Rect(0, 0, Screen.width, Screen.height), backgroundOptions, ScaleMode.ScaleAndCrop);

		GUI.Box(new Rect(optionsTopX, optionsTopY, optionsWidth, optionsHeight), "");

		drawOutlinedText(new Rect(optionsTopX + optionsWidth / 2 - 75, optionsTopY + 10, 150, 20), "Options", Color.black, Color.white);

		if (GUI.Button(new Rect(optionsTopX, optionsTopY + 30, 200, 50), "Music: " + (game.optionsManager.SoundMusic ? "On" : "Off")))
		{
			game.optionsManager.SoundMusic = !game.optionsManager.SoundMusic;
			GameObject.Find("Main Camera").audio.enabled = game.optionsManager.SoundMusic;
			if (game.optionsManager.SoundMusic)
				GameObject.Find("Main Camera").audio.Play();
		}
		if (GUI.Button(new Rect(optionsTopX, optionsTopY + 70, 200, 50), "Effects: " + (game.optionsManager.SoundFX ? "On" : "Off")))
			game.optionsManager.SoundFX = !game.optionsManager.SoundFX;
		if (GUI.Button(new Rect(optionsTopX, optionsTopY + 110, 200, 50), "Powerups: " + (game.optionsManager.SoundPowerup ? "On" : "Off")))
			game.optionsManager.SoundPowerup = !game.optionsManager.SoundPowerup;

		if (GUI.Button(new Rect(optionsTopX + optionsWidth / 2 - 100, optionsTopY + optionsHeight - 60, 200, 50), "Back"))
		{
			if (Application.loadedLevel == 0)
				MenuState = MenuState.main;
			else
				MenuState = MenuState.pause;
		}
	}

	int
		pauseTopX = Screen.width / 2 - 100,
		pauseTopY = Screen.height / 2 - 100,
		pauseWidth = 200,
		pauseHeight = 200;

	void GUI_pause()
	{
		GUI.Box(new Rect(pauseTopX, pauseTopY, pauseWidth, pauseHeight), "");

		if (GUI.Button(new Rect(pauseTopX + pauseWidth / 2 - 100, pauseTopY, 200, 50), "Return to Game"))
			MenuState = MenuState.inGame;

		if (GUI.Button(new Rect(pauseTopX + pauseWidth / 2 - 100, pauseTopY + pauseHeight / 2 - 25, 200, 50), "Options"))
			MenuState = MenuState.options;

		if (GUI.Button(new Rect(pauseTopX + pauseWidth / 2 - 100, pauseTopY + pauseHeight - 50, 200, 50), "Quit to Menu"))
			networkManager.disconnect();
	}

	#endregion
	#region RPCs

	public void RPCLevelEnd()
	{
		MenuState = MenuState.leaderBoard;
	}

	public void RPCLoadLevelBegin(string level, int levelPrefix)
	{
		MenuState = MenuState.loading;
		ChatOn = false;
		PlayerSettingsOn = false;
		if (level == "Level01")
			backgroundLoading = backgroundLoading1;
		if (level == "Level02")
			backgroundLoading = backgroundLoading2;
		if (level == "Level03")
			backgroundLoading = backgroundLoading3;
	}

	public void RPCLoadLevelEnd(string level, int levelPrefix)
	{
		if (level != levelManager.disconnectedLevel && MenuState != MenuState.countdown)
			MenuState = MenuState.none;
	}

	[RPC]
	IEnumerator sendChatMessage(NetworkPlayer sender, string theMessage)
	{
		PlayerManager senderPM = null;
		while (senderPM == null)
		{
			foreach (Team t in teamManager.TeamList)
				foreach (PlayerManager pm in t.MemberPlayerManagers)
					if (pm.MyNetworkPlayer == sender)
						senderPM = pm;
			yield return null;
		}
		ChatMessage newMessage = new ChatMessage(senderPM, theMessage);
		chat.Add(newMessage);
		chatHeight = chat.Count * 20;
		chatScrollPosition = new Vector2(0, chatHeight);

		//reset color if changed for each player on their old messages
		Dictionary<NetworkPlayer, Color> playerColor = new Dictionary<NetworkPlayer, Color>();
		for (int i = chat.Count - 1; i > -1; i--)
		{
			NetworkPlayer netPlayer = chat[i].PlayerSender.MyNetworkPlayer;
			Color color = chat[i].PlayerSender.MyColor;
			if (playerColor.ContainsKey(netPlayer))
			{
				if (playerColor[netPlayer] != color)
				{
					chat[i].PlayerSender.MyColor = playerColor[netPlayer];
				}
			}
			else
				playerColor.Add(netPlayer, color);
		}
	}

	public void RPCStartLevelCountdown()
	{
		MenuState = MenuState.countdown;
	}

	#endregion
	#region Methods

	Color getReadableOppositeColor(Color color)
	{
		float colorAvg = (color.r + color.g + color.b) / 3;
		if (colorAvg > .5)
			return Color.black;
		return Color.white;
	}

	public void drawOutlinedText(Rect rect, string text, GUIStyle style, Color textColor, Color outlineColor)
	{
		int dist = 1;
		Color lastColor = style.normal.textColor;
		style.normal.textColor = outlineColor;
		Rect tempRect = rect;
		tempRect.x += dist;
		GUI.Label(tempRect, text, style);
		tempRect.x -= dist * 2;
		GUI.Label(tempRect, text, style);
		tempRect.y += dist;
		GUI.Label(tempRect, text, style);
		tempRect.y -= dist * 2;
		GUI.Label(tempRect, text, style);
		style.normal.textColor = textColor;
		GUI.Label(rect, text, style);
		style.normal.textColor = lastColor;
	}

	public void drawOutlinedText(Rect rect, string text, Color textColor, Color outlineColor)
	{
		int dist = 1;
		Color lastColor = GUI.color;
		GUI.color = outlineColor;
		Rect tempRect = rect;
		tempRect.x += dist;
		GUI.Label(tempRect, text);
		tempRect.x -= dist * 2;
		GUI.Label(tempRect, text);
		tempRect.y += dist;
		GUI.Label(tempRect, text);
		tempRect.y -= dist * 2;
		GUI.Label(tempRect, text);
		GUI.color = textColor;
		GUI.Label(rect, text);
		GUI.color = lastColor;
	}

	void sendMyMessage()
	{
		if (message == "" || message == "\n")
		{
			message = "";
			return;
		}

		if (message.Contains("\n"))
			message = message.Split('\n')[0];

		bool allSpaces = true;
		for (int i = 0; i < message.Length; i++)
			if (message[i] != ' ')
				allSpaces = false;
		if (allSpaces)
		{
			message = "";
			return;
		}

		if (!message.EndsWith("\n"))
			message += "\n";

		networkView.RPC("sendChatMessage", RPCMode.AllBuffered, Network.player, message);

		message = "";
	}

	public string secondsToString(float time)
	{
		int minutes = Mathf.FloorToInt(time / 60);
		int seconds = (int)time % 60;
		int milliseconds = Mathf.FloorToInt((time - minutes * 60 - seconds) * 100);
		string m = minutes.ToString();
		//if (m.Length < 2)
		//	m = "0" + m;
		string s = seconds.ToString();
		if (s.Length < 2)
			s = "0" + s;
		string ms = milliseconds.ToString();
		if (ms.Length < 2)
			ms = "0" + ms;
		return m + ":" + s + "." + ms;
	}

	#endregion
}
