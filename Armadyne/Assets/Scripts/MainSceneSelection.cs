using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public enum MenuItem
{
    title,
	lobby,
	initServer,
	clientConnect,
	options,
	controls,
	sound,
    credits,
    creditsLucas,
    creditsJustin,
    creditsMason,
    creditsErikson,
    creditsEric,
	creditsMusic,
	quit,
	count,
	none
}

public class MainSceneSelection : MonoBehaviour
{
	Game game;

	public GameObject parentPiece;
	public MenuItem menu = MenuItem.none;

	List<GameObject> childrenPieces = new List<GameObject>();
	public List<GameObject> ChildrenPieces
	{
		get { return childrenPieces; }
		set { childrenPieces = value; }
	}

	float step = 0, distance;
	public float increment = .01f, offsetFactor = 5f;

    public float Distance
    {
        get { return distance; }
    }

	Vector3 originalLocation = Vector3.zero;
	public Vector3 OriginalLocation
	{
		get { return originalLocation; }
	}

	void Awake()
	{
		game = GameObject.Find("Game").GetComponent<Game>();

		originalLocation = transform.position;

        StartCoroutine(OrganizeChildren());

        if (parentPiece == null)
        {
            parentPiece = gameObject;
            distance = 200;
            return;
        }

		distance = Vector3.Distance(transform.position, parentPiece.transform.position);
		parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces.Add(gameObject);
	}

    IEnumerator OrganizeChildren()
    {
        yield return new WaitForEndOfFrame();
        bool sorted = false;
        while (!sorted)
        {
            sorted = true;
            for (int i = 0; i < childrenPieces.Count - 1; i++)
            {
                if (childrenPieces[i].GetComponent<MainSceneSelection>().menu > childrenPieces[i + 1].GetComponent<MainSceneSelection>().menu)
                {
                    GameObject temp = childrenPieces[i];
                    childrenPieces[i] = childrenPieces[i + 1];
                    childrenPieces[i + 1] = temp;
                    sorted = false;
                }
            }
        }
    }

	void Update()
	{
		if (game.guiManager.MenuState != MenuState.main || Network.peerType == NetworkPeerType.Server || Network.peerType == NetworkPeerType.Client)
			return;

		if (parentPiece == null)
			return;

		transform.LookAt(parentPiece.transform.position);

		Vector3 offset = -transform.up * Mathf.Cos(step) - transform.right * Mathf.Sin(step);

		transform.position = originalLocation + offset * offsetFactor;

		step += increment;
		if (step > 2 * Mathf.PI)
			step = 0;
	}

	public void gui()
	{
		GUI.skin = game.guiManager.armadyneSkin;
		switch (menu)
		{
			case MenuItem.clientConnect:
				if (GUI.Button(new Rect(Screen.width / 2 - 100, Screen.height - 100, 200, 50), "Client Connect"))
					game.networkManager.connect();
				game.networkManager.connectionIP = GUI.TextArea(new Rect(Screen.width / 2 - 100, Screen.height - 50, 180, 30), game.networkManager.connectionIP, game.guiManager.numberTextStyle);
				if (game.networkManager.connectionIP.Contains("\n"))
				{
					game.networkManager.connectionIP = game.networkManager.connectionIP.Split('\n')[0];
					game.networkManager.connect();
				}
				break;
			case MenuItem.controls:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Controls", game.guiManager.centeredStyle, Color.black, Color.white);
				break;
			case MenuItem.initServer:
				if (GUI.Button(new Rect(Screen.width / 2 - 100, Screen.height - 200, 200, 50), "Initialize Server"))
					game.networkManager.initializeServer();

				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 125, Screen.height - 150, 250, 40), "Team Count: " + game.teamManager.TeamCount, game.guiManager.centeredStyle, Color.black, Color.white);
				game.teamManager.TeamCount = (int)GUI.HorizontalSlider(new Rect(Screen.width / 2 - 100, Screen.height - 110, 200, 20), game.teamManager.TeamCount, game.teamManager.minTeamCount, game.teamManager.maxTeamCount);

				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 125, Screen.height - 90, 250, 40), "Team Size: " + game.teamManager.TeamSize, game.guiManager.centeredStyle, Color.black, Color.white);
				game.teamManager.TeamSize = (int)GUI.HorizontalSlider(new Rect(Screen.width / 2 - 100, Screen.height - 50, 200, 20), game.teamManager.TeamSize, game.teamManager.minTeamSize, game.teamManager.maxTeamSize);

				game.networkManager.maxConnections = game.teamManager.TeamCount * game.teamManager.TeamSize;
				break;
			case MenuItem.lobby:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Lobby", game.guiManager.centeredStyle, Color.black, Color.white);
				break;
			case MenuItem.options:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Options", game.guiManager.centeredStyle, Color.black, Color.white);
				break;
            case MenuItem.credits:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Credits", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
            case MenuItem.creditsEric:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 300, Screen.height - 200, 600, 200), "Eric Kilbride\nAudio Design\nLevel02 Scenery", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
            case MenuItem.creditsErikson:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 300, Screen.height - 200, 600, 200), "Erikson Paschke\nVisual Art", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
            case MenuItem.creditsJustin:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 300, Screen.height - 200, 600, 200), "Justin Ryder\nNetwork Programmer\nGameplay Programmer\nGUI Programmer\nwww.justin-ryder.com", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
            case MenuItem.creditsLucas:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 300, Screen.height - 200, 600, 200), "Lucas Bilodeau\nProducer\nLead Designer\nLevel Designer\nlucasbilodeau.squarespace.com", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
            case MenuItem.creditsMason:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 300, Screen.height - 200, 600, 200), "Mason Fiore\nGameplay Programmer\nAudio Programmer", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
			case MenuItem.creditsMusic:
				game.guiManager.drawOutlinedText(new Rect(0, Screen.height - 200, Screen.width, 200), "Lvl1-Hold Your Colour by Pendulum\nLvl2-Never Forget Anquilla Project Remix by Oceania\nLvl3-Dark Rap Instrumental Industrial Horrorscene by Jacekdupa", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
			case MenuItem.quit:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Quit", game.guiManager.centeredStyle, Color.black, Color.white);
				break;
            case MenuItem.title:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 100, 400, 50), "Armadyne", game.guiManager.centeredStyle, Color.black, Color.white);
                break;
			case MenuItem.sound:
				game.guiManager.drawOutlinedText(new Rect(Screen.width / 2 - 200, Screen.height - 200, 400, 50), "Sound", game.guiManager.centeredStyle, Color.black, Color.white);
				if (GUI.Button(new Rect(Screen.width / 2 - 100, Screen.height - 150, 200, 50), "Music: " + (game.optionsManager.SoundMusic ? "On" : "Off")))
				{
					game.optionsManager.SoundMusic = !game.optionsManager.SoundMusic;
					if (game.optionsManager.SoundMusic)
					{
						GameObject.Find("Main Camera").audio.enabled = true;
						GameObject.Find("Main Camera").audio.Play();
					}
					else
						GameObject.Find("Main Camera").audio.enabled = false;
				}
				if (GUI.Button(new Rect(Screen.width / 2 - 100, Screen.height - 100, 200, 50), "Effects: " + (game.optionsManager.SoundFX ? "On" : "Off")))
					game.optionsManager.SoundFX = !game.optionsManager.SoundFX;
				if (GUI.Button(new Rect(Screen.width / 2 - 100, Screen.height - 50, 200, 50), "Powerups: " + (game.optionsManager.SoundPowerup ? "On" : "Off")))
					game.optionsManager.SoundPowerup = !game.optionsManager.SoundPowerup;
				break;
		}
	}

	public GameObject deselect()
	{
        if (parentPiece == gameObject)
			return gameObject;
		return parentPiece;
	}

	public GameObject next()
	{
        if (parentPiece == gameObject)
			return gameObject;
		int index = parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces.IndexOf(gameObject);
		index++;
		if (index >= parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces.Count)
			index = 0;
		return parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces[index];
	}

	public GameObject previous()
	{
        if (parentPiece == gameObject)
			return gameObject;
		int index = parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces.IndexOf(gameObject);
		index--;
		if (index < 0)
			index = parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces.Count - 1;
		return parentPiece.GetComponent<MainSceneSelection>().ChildrenPieces[index];
	}

	public GameObject select()
	{
		if (ChildrenPieces.Count == 0)
		{
			switch (menu)
			{
				case MenuItem.clientConnect:
					game.networkManager.connect();
					break;
				case MenuItem.initServer:
					game.networkManager.initializeServer();
					break;
				case MenuItem.quit:
					Application.Quit();
					break;
			}
			return gameObject;
		}
		return ChildrenPieces[0];
	}

}
