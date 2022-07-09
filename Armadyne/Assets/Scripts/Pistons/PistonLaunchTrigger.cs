using UnityEngine;
using System.Collections;

public class PistonLaunchTrigger : MonoBehaviour
{
	#region Public Data

	public int numberOfPlayersToTrigger = 1;

	#endregion
	#region Private Data

	public GameObject pistonToTrigger;

	int currentPlayersOnTrigger = 0;

	#endregion
	#region Inherited from MonoBehaviour

	void Awake()
	{
		
	}

	void OnTriggerEnter(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			currentPlayersOnTrigger++;
			pistonToTrigger.GetComponent<PistonLauncher>().addPlayer(c.gameObject);
		}
	}

	void OnTriggerExit(Collider c)
	{
		if (c.gameObject.tag == "Player")
		{
			currentPlayersOnTrigger--;
			pistonToTrigger.GetComponent<PistonLauncher>().removePlayer(c.gameObject);
			if (currentPlayersOnTrigger < numberOfPlayersToTrigger)
				pistonToTrigger.GetComponent<PistonLauncher>().abortLaunch();
		}
	}

	void OnTriggerStay(Collider c)
	{
		if (c.gameObject.tag == "Player" && currentPlayersOnTrigger >= numberOfPlayersToTrigger)
		{
			pistonToTrigger.GetComponent<PistonLauncher>().launch();
		}
	}

	#endregion
}
