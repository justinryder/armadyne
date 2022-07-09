using UnityEngine;
using System.Collections;

public class PlayerManager
{
	#region Data

	Game game;

	Color myColor = Color.black;
	public Color MyColor
	{
		get { return myColor; }
		set { myColor = value; }
	}

	GameObject myGameObject;
	public GameObject MyGameObject
	{
		get { return myGameObject; }
		set { myGameObject = value; }
	}

	string myName = "";
	public string MyName
	{
		get { return myName; }
		set { myName = value; }
	}

	NetworkPlayer myNetworkPlayer;
	public NetworkPlayer MyNetworkPlayer
	{
		get { return myNetworkPlayer; }
		set { myNetworkPlayer = value; }
	}

	int myPlace = 1;
	public int MyPlace
	{
		get { return myPlace; }
		set { myPlace = value; }
	}

	Team myTeam = new Team(TeamColorType.rainbow, "");
	public Team MyTeam
	{
		get { return myTeam; }
		set { myTeam = value; }
	}

	#endregion
	#region Initialization

	public PlayerManager(Game g = null)
	{
		game = g;
	}

	#endregion
	#region Methods

	public void setStats(PlayerStats ps)
	{
		myName = ps.MyName;
		myPlace = ps.MyPlace;
		myColor = ps.MyColor;
		myTeam = ps.MyTeam;
		myNetworkPlayer = ps.MyNetworkPlayer;
	}

	public void setStats(string Name, int Place, Color Color, Team team)
	{
		myName = Name;
		myPlace = Place;
		myColor = Color;
		myTeam = team;
	}

	public void setStats(string Name, NetworkPlayer networkPlayer, Color Color)
	{
		myName = Name;
		myNetworkPlayer = networkPlayer;
		myColor = Color;
	}

	public void setStats(string Name, Color Color, Team team)
	{
		myName = Name;
		myColor = Color;
		myTeam = team;
	}

	#endregion
}
