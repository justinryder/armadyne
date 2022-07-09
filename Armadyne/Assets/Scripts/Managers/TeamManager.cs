using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class TeamManager : MonoBehaviour
{
	#region Managers

	AudioManager audioManager;
	Game game;
	GUIManager guiManager;
	LevelManager levelManager;
	NetworkManager networkManager;
	OptionsManager optionsManager;
	PlayerManager playerManager;

	#endregion
	#region Data

	List<Team> teamList = new List<Team>();
	public List<Team> TeamList
	{
		get { return teamList; }
		set { teamList = value; }
	}

	int teamCount = 4;
	public int TeamCount
	{
		get { return teamCount; }
		set { teamCount = value; }
	}

	int teamSize = 2;
	public int TeamSize
	{
		get { return teamSize; }
		set { teamSize = value; }
	}

	public int
		maxTeamCount = 4,
		minTeamCount = 1,
		maxTeamSize = 5,
		minTeamSize = 1;

	string temp = "";

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		//setup the managers
		audioManager = GetComponent<AudioManager>();
		game = GetComponent<Game>();
		guiManager = GetComponent<GUIManager>();
		levelManager = GetComponent<LevelManager>();
		networkManager = GetComponent<NetworkManager>();
		optionsManager = game.optionsManager;
		playerManager = game.playerManager;
	}

	void OnDisconnectedFromServer(NetworkDisconnection info)
	{
		clear();
	}

	void OnServerInitialized()
	{
		InitTeamList(TeamCount, TeamSize);
	}

	void OnPlayerConnected(NetworkPlayer player)
	{
		resendTeamsTo(player);
		//networkView.RPC("JoinTeam", RPCMode.AllBuffered, player, "Client", -1);

		//networkView.RPC("InitTeamList", player, teamCount, teamSize);
		//for (int i = 0; i < teamList.Count; i++)
		//{
		//    foreach (PlayerManager pm in teamList[i].MemberPlayerManagers)
		//    {
		//        //networkView.RPC("JoinTeam", pm.MyNetworkPlayer, pm.MyName, i);
		//        networkView.RPC("UpdatePlayerColor", player, pm.MyNetworkPlayer, pm.MyColor.r, pm.MyColor.g, pm.MyColor.b);
		//        networkView.RPC("UpdatePlayerName", player, pm.MyNetworkPlayer, pm.MyName);
		//    }
		//}
	}

	void OnPlayerDisconnected(NetworkPlayer player)
	{
		foreach (Team t in teamList)
			if (t.isOnTeam(player))
				t.removePlayer(player);
		networkView.RPC("LeaveTeam", RPCMode.Others, player);
	}

	#endregion
	#region RPCs

	[RPC]
	public void InitTeamList(int _teamCount, int _teamSize)
	{
		teamCount = _teamCount;
		teamSize = _teamSize;
		clear();
		for (int i = 0; i < _teamCount; i++)
		{
			switch (i)
			{
				case 0:
					temp = "Red";
					break;
				case 1:
					temp = "Blue";
					break;
				case 2:
					temp = "Green";
					break;
				case 3:
					temp = "Grey";
					break;
			}
			Team team = new Team((TeamColorType)i, temp);
			team.MaxMembers = _teamSize;
			teamList.Add(team);
			teamList[i].MaxMembers = _teamSize;
		}
	}

	[RPC]
	public IEnumerator JoinTeam(NetworkPlayer player, string playerName, int teamIndex)
	{
		while (teamList.Count == 0)
			yield return null;
		if (teamIndex == -1)
		{
			for (int i = 0; i < teamList.Count; i++)
			{
				if (!teamList[i].IsFull)
				{
					teamIndex = i;
					break;
				}
			}
		}
		Team team = teamList[teamIndex];
		if (team.IsFull || team.isOnTeam(player))
			yield break;

		foreach (Team t in teamList)
		{
			if (t.isOnTeam(player))
			{
				t.removePlayer(player);
			}
		}

		PlayerManager pm = new PlayerManager(game);
		pm.setStats(playerName, team.Color, team);
		pm.MyNetworkPlayer = player;
		team.addPlayer(pm);

		if (Network.player == player)
		{
			playerManager.MyTeam = team;
			playerManager.MyColor = team.Color;
			//networkView.RPC("UpdatePlayerColor", RPCMode.AllBuffered, Network.player, playerManager.MyColor.r, playerManager.MyColor.g, playerManager.MyColor.b);
		}

		if (Network.isServer)
		{
			int i = 0;
			bool sent = false;
			foreach (Team t in teamList)
			{
				if (t.isOnTeam(player))
				{
					networkView.RPC("JoinTeam", RPCMode.Others, player, playerName, i);
					sent = true;
					break;
				}
				i++;
			}
			if (!sent)
				networkView.RPC("JoinTeam", RPCMode.Others, player, playerName, -1);
		}
	}

	[RPC]
	void LeaveTeam(NetworkPlayer player)
	{
		foreach (Team t in teamList)
			if (t.isOnTeam(player))
				t.removePlayer(player);
	}

	[RPC]
	IEnumerator UpdatePlayerColor(NetworkPlayer player, float red, float green, float blue)
	{
		bool done = false;
		while (!done)
		{
			foreach (Team t in teamList)
			{
				foreach (PlayerManager pm in t.MemberPlayerManagers)
				{
					if (pm.MyNetworkPlayer == player)
					{
						pm.MyColor = new Color(red, green, blue);
						done = true;
						yield break;
					}
				}
			}
			yield return null;
		}
	}

	[RPC]
	IEnumerator UpdatePlayerName(NetworkPlayer player, string playerName)
	{
		bool done = false;
		while (!done)
		{
			foreach (Team t in teamList)
			{
				foreach (PlayerManager pm in t.MemberPlayerManagers)
				{
					if (pm.MyNetworkPlayer == player)
					{
						pm.MyName = playerName;
						done = true;
						yield break;
					}
				}
			}
			yield return null;
		}
	}

	[RPC]
	IEnumerator UpdateTeamPlayerInLobby(int teamIndex, int playerIndex, NetworkPlayer netPlayer, string playerName, float red, float green, float blue)
	{
		while (teamList.Count <= teamIndex && teamList[teamIndex].MemberPlayerManagers.Count <= playerIndex) yield return null;
		teamList[teamIndex].MemberPlayerManagers[playerIndex].setStats(playerName, netPlayer, new Color(red, green, blue));
	}

	[RPC]
	IEnumerator UpdateTeamPlayerInGame(int teamIndex, int playerIndex, NetworkPlayer netPlayer, string playerName, float red, float green, float blue)
	{
		teamList[teamIndex].MemberPlayerManagers[playerIndex].setStats(playerName, netPlayer, new Color(red, green, blue));
		bool added = false;
		while (!added)
		{
			foreach (GameObject go in GameObject.FindGameObjectsWithTag("Player"))
			{
				if (go.networkView.owner == netPlayer)
				{
					teamList[teamIndex].setPlayerGameObject(netPlayer, go);
					go.GetComponent<PlayerStats>().setStats(playerName, 1, 0, new Color(red, green, blue), teamList[teamIndex]);
					added = true;
					yield break;
				}
			}
			yield return null;
		}
	}

	#endregion
	#region Methods

	public void clear()
	{
		foreach (Team t in teamList)
			t.clear();
		teamList.Clear();
		teamList = new List<Team>();
	}

	public void checkForDuplicates()
	{
		foreach (Team t in teamList)
		{
			foreach (PlayerManager pm in t.MemberPlayerManagers)
			{
				bool removed = false;
				bool found = false;
				foreach (Team t2 in teamList)
				{
					if (t2.isOnTeam(pm.MyNetworkPlayer))
					{
						if (!found)
						{
							found = true;
						}
						else
						{
							t2.removePlayer(pm.MyNetworkPlayer);
							removed = true;
							break;
						}
					}
				}
				if (removed)
					break;
			}
		}
	}

	public void connectPlayerGameObject(GameObject go)
	{
		foreach (Team t in teamList)
		{
			foreach (PlayerManager pm in t.MemberPlayerManagers)
			{
				if (pm.MyNetworkPlayer == go.networkView.owner)
				{
					pm.MyGameObject = go;
					return;
				}
			}
		}
	}

	public void resendTeamsTo(NetworkPlayer player)
	{
		networkView.RPC("InitTeamList", player, teamCount, teamSize);
		for (int i = 0; i < teamList.Count; i++)
		{
			foreach (PlayerManager pm in teamList[i].MemberPlayerManagers)
			{
				networkView.RPC("JoinTeam", player, pm.MyNetworkPlayer, pm.MyName, i);
				networkView.RPC("UpdatePlayerColor", player, pm.MyNetworkPlayer, pm.MyColor.r, pm.MyColor.g, pm.MyColor.b);
				networkView.RPC("UpdatePlayerName", player, pm.MyNetworkPlayer, pm.MyName);
			}
		}
	}

	public void resendTeams()
	{
		networkView.RPC("InitTeamList", RPCMode.Others, teamCount, teamSize);
		for (int i = 0; i < teamList.Count; i++)
		{
			foreach (PlayerManager pm in teamList[i].MemberPlayerManagers)
			{
				networkView.RPC("JoinTeam", RPCMode.Others, pm.MyNetworkPlayer, pm.MyName, i);
				networkView.RPC("UpdatePlayerColor", RPCMode.Others, pm.MyNetworkPlayer, pm.MyColor.r, pm.MyColor.g, pm.MyColor.b);
				networkView.RPC("UpdatePlayerName", RPCMode.Others, pm.MyNetworkPlayer, pm.MyName);
			}
		}
	}

	//public void syncTeams()
	//{
	//    if (Application.loadedLevel == 0)
	//        syncTeamsInLobby();
	//    else
	//        syncTeamsInGame();
	//}

	//void syncTeamsInLobby()
	//{
	//    for (int i = 0; i < TeamList.Count; i++)
	//    {
	//        for (int j = 0; j < TeamList[i].MemberPlayerManagers.Count; j++)
	//        {
	//            networkView.RPC("UpdateTeamPlayerInLobby", RPCMode.Others, i, j, TeamList[i].MemberPlayerManagers[j].MyNetworkPlayer, TeamList[i].MemberPlayerManagers[j].MyName, TeamList[i].MemberPlayerManagers[j].MyColor.r, TeamList[i].MemberPlayerManagers[j].MyColor.g, TeamList[i].MemberPlayerManagers[j].MyColor.b);
	//        }
	//    }
	//}

	//void syncTeamsInGame()
	//{
	//    for (int i = 0; i < TeamList.Count; i++)
	//    {
	//        for (int j = 0; j < TeamList[i].MemberPlayerManagers.Count; j++)
	//        {
	//            foreach (GameObject go in levelManager.getPlayerGameObjects())
	//                if (go.networkView.owner == TeamList[i].MemberPlayerManagers[j].MyNetworkPlayer)
	//                    TeamList[i].MemberPlayerManagers[j].MyColor = go.GetComponent<MovePlayer>().getColor();
	//            networkView.RPC("UpdateTeamPlayerInGame", RPCMode.Others, i, j, TeamList[i].MemberPlayerManagers[j].MyNetworkPlayer, TeamList[i].MemberPlayerManagers[j].MyName, TeamList[i].MemberPlayerManagers[j].MyColor.r, TeamList[i].MemberPlayerManagers[j].MyColor.g, TeamList[i].MemberPlayerManagers[j].MyColor.b);
	//        }
	//    }
	//}

	#endregion
}
