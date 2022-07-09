using UnityEngine;
using System.Collections;

public class PistonSmashTrigger : MonoBehaviour
{
	#region Public Data

	public int numberOfPlayersToTrigger = 1;

	#endregion
	#region Private Data

	int currentPlayersOnTrigger = 0;

	GameObject pistonToTrigger;
	public GameObject PistonToTrigger
	{
		get { return pistonToTrigger; }
		set { pistonToTrigger = value; }
	}

	#endregion
	#region Inherited from MonoBehaviour

	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			currentPlayersOnTrigger++;
			pistonToTrigger.GetComponent<PistonSmasher>().beginExtending();
		}
	}

	void OnTriggerExit(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			currentPlayersOnTrigger--;
		}
	}

	#endregion
}
