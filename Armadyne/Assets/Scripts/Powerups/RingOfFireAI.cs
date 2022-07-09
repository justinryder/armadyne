using UnityEngine;
using System.Collections;

public class RingOfFireAI : MonoBehaviour
{

	float deathTime = float.MaxValue;
	public float duration = 3;
	public GameObject following { get; set; }

	public int TeamIntThatSpawnedThis { get; set; }

	void Awake ()
	{
		following = null;
		deathTime = Time.time + duration;
		foreach (ParticleEmitter pe in gameObject.GetComponentsInChildren<ParticleEmitter>())
		{
			pe.minSize = 5;
			pe.maxSize = 10;

			pe.minEnergy = .2f;
			pe.maxEnergy = .3f;

			pe.minEmission = 25;
			pe.maxEmission = 50;

			pe.useWorldSpace = false;
		}
	}
	
	void Update ()
	{
		if (following != null)
			transform.position = following.transform.position;
		if (Time.time > deathTime)
			Destroy(gameObject);
	}

	[RPC]
	IEnumerator SetFollowingPlayer(NetworkPlayer player)
	{
		while (following == null)
		{
			foreach (GameObject go in GameObject.Find("Game").GetComponent<Game>().levelManager.PlayerGameObjects)
			{
				if (go.networkView.owner == player || go.GetComponent<MovePlayer>().theOwner == player)
				{
					following = go;
					yield break;
				}
			}
			yield return null;
		}
	}
}
