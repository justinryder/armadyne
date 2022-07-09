using UnityEngine;
using System.Collections;

public class Bubble : MonoBehaviour {

	GameObject player;
	public GameObject Player
	{
		get { return player; }
	}

	public void setPlayer(GameObject thePlayer)
	{
		player = thePlayer;
	}

	public void popBubble()
	{
		player.GetComponent<MovePlayer>().popBubble();
		Destroy(gameObject);
	}
}
