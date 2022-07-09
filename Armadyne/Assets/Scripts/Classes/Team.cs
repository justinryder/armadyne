using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public enum TeamColorType
{
	red = 0,
	blue,
	green,
	grey,
	rainbow
}

public class Team
{
	#region Fields and Properties

	public Color Color
	{
		get
		{
			switch (colorType)
			{
				case TeamColorType.red:
					return Color.red;
				case TeamColorType.blue:
					return Color.blue;
				case TeamColorType.green:
					return Color.green;
				case TeamColorType.grey:
					return Color.grey;
			}
			return Color.black;
		}
	}

	TeamColorType colorType = TeamColorType.red;
	public TeamColorType ColorType
	{
		get { return colorType; }
	}

	public bool IsFull
	{
		get { return (memberPlayerManagers.Count == maxMembers); }
	}

	int maxMembers = 4;
	public int MaxMembers
	{
		get { return maxMembers; }
		set { maxMembers = value; }
	}

	List<GameObject> memberGameObjects = new List<GameObject>();
	public List<GameObject> MemberGameObjects
	{
		get { return memberGameObjects; }
	}

	List<PlayerManager> memberPlayerManagers = new List<PlayerManager>();
	public List<PlayerManager> MemberPlayerManagers
	{
		get { return memberPlayerManagers; }
	}

	string name = "";
	public string Name
	{
		get { return name; }
		set { name = value; }
	}

	public int TeamInt
	{
		get { return (int)ColorType; }
	}

	#endregion
	#region Initialization

	public Team() { }

	public Team(TeamColorType _colorType, string _name)
	{
		colorType = _colorType;
		name = _name;
	}

	#endregion
	#region Methods

	public bool addPlayer(PlayerManager playerManager)
	{
		if (memberPlayerManagers.Count == maxMembers || isOnTeam(playerManager.MyNetworkPlayer))
			return false;
		memberPlayerManagers.Add(playerManager);
		return true;
	}

	public void clear()
	{
		memberPlayerManagers.Clear();
		memberGameObjects.Clear();
	}

	public bool isOnTeam(NetworkPlayer networkPlayer)
	{
		foreach (PlayerManager pm in memberPlayerManagers)
			if (pm.MyNetworkPlayer == networkPlayer)
				return true;
		return false;
	}

	public bool removePlayer(PlayerManager playerManager)
	{
		foreach(PlayerManager ps in memberPlayerManagers)
			if (ps.MyNetworkPlayer == playerManager.MyNetworkPlayer)
				return false;
		memberPlayerManagers.Remove(playerManager);
		return true;
	}

	public bool removePlayer(NetworkPlayer networkPlayer)
	{
		if (!isOnTeam(networkPlayer))
			return false;
		foreach (PlayerManager pm in memberPlayerManagers)
		{
			if (pm.MyNetworkPlayer == networkPlayer)
			{
				memberPlayerManagers.Remove(pm);
				break;
			}
		}
		foreach (GameObject go in memberGameObjects)
		{
			if (go.networkView.owner == networkPlayer)
			{
				memberGameObjects.Remove(go);
				break;
			}
		}
		return true;
	}

	public void setPlayerGameObject(NetworkPlayer player, GameObject go)
	{
		PlayerManager playerManager = null;
		foreach (PlayerManager pm in memberPlayerManagers)
		{
			if (pm.MyNetworkPlayer == player)
				playerManager = pm;
		}
		if (playerManager == null)
			return;
		int index = memberPlayerManagers.IndexOf(playerManager);
		if (index >= memberGameObjects.Count)
			memberGameObjects.Add(go);
		else
			memberGameObjects.Insert(index, go);
	}

	#endregion
}
