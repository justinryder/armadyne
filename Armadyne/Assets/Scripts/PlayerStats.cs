using UnityEngine;
using System.Collections;

public class PlayerStats : MonoBehaviour
{
	#region Data

	Color myColor = Color.black;
	public Color MyColor
	{
		get { return myColor; }
		set { myColor = value; }
	}

	int myLapsCompleted = 0;
	public int MyLapsCompleted
	{
		get { return myLapsCompleted; }
		set { myLapsCompleted = value; }
	}

	public int MyLapsLeft
	{
		get { return (3 - myLapsCompleted); }
	}

	string myName = "";
	public string MyName
	{
		get { return myName; }
		set { myName = value; }
	}

	public NetworkPlayer MyNetworkPlayer
	{
		get { return networkView.owner; }
	}

	int myPlace = 1;
	public int MyPlace
	{
		get { return myPlace; }
		set
		{
			myPlace = value;
			if (Network.player == networkView.owner)
				GameObject.Find("Game").GetComponent<Game>().playerManager.MyPlace = value;
		}
	}

	Team myTeam;
	public Team MyTeam
	{
		get { return myTeam; }
	}

	public int MyTeamInt
	{
		get
		{
			if (myTeam == null)
				return -1;
			else
				return myTeam.TeamInt;
		}
	}

	public float LapStartTime { get; set; }
	public float Lap1Time { get; set; }
	public float Lap2Time { get; set; }
	public float Lap3Time { get; set; }

	public float Lap2Diff { get { return Lap2Time - Lap1Time; } }
	public float Lap3Diff { get { return Lap3Time - Lap2Time; } }

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		LapStartTime = Time.time;
		Lap1Time = 0;
		Lap2Time = 0;
		Lap3Time = 0;
	}

	#endregion
	#region Methods

	public void lapComplete()
	{
		myLapsCompleted++;
		if (myLapsCompleted == 1)
			Lap1Time = Time.time - LapStartTime;
		if (myLapsCompleted == 2)
			Lap2Time = Time.time - LapStartTime;
		if (myLapsCompleted == 3)
		{
			Lap3Time = Time.time - LapStartTime;
			transform.position = GameObject.FindGameObjectWithTag("Teleporter").transform.position;
			transform.Translate(-10 * MyPlace + 200, -1000, 0);
		}
		LapStartTime = Time.time;
		networkView.RPC("SetLaps", RPCMode.AllBuffered, networkView.owner, myLapsCompleted);
	}

	[RPC]
	public void SetLaps(NetworkPlayer player, int laps)
	{
		myLapsCompleted = laps;
	}

	[RPC]
	public void SetPlace(NetworkPlayer player, int place)
	{
		myPlace = place;
	}

	public void setStats(PlayerManager pm)
	{
		myName = pm.MyName;
		myPlace = pm.MyPlace;
		myLapsCompleted = 0;
		myColor = pm.MyColor;
		myTeam = pm.MyTeam;
	}

	public void setStats(string Name, int Place, int Laps, Color Color, Team team)
	{
		myName = Name;
		myPlace = Place;
		myLapsCompleted = Laps;
		myColor = Color;
		myTeam = team;
	}

	public void setStats(string Name, Color Color, Team team)
	{
		myName = Name;
		myColor = Color;
		myTeam = team;
	}

	public PlayerManager toPlayerManager()
	{
		PlayerManager pm = new PlayerManager();
		pm.setStats(this);
		return pm;
	}

	#endregion
}
