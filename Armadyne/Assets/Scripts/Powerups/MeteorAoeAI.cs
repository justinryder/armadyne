using UnityEngine;
using System.Collections;

public class MeteorAoeAI : MonoBehaviour {

	public Vector3 AOESize = Vector3.zero;
	
	public float stepInc = .08f;

	float step = 0;

	// Use this for initialization
	void Start ()
	{
		transform.localScale = Vector3.zero;
	}
	
	// Update is called once per frame
	void Update () {
		Explode();
	}

	public void Explode()
	{
		transform.localScale = Vector3.Lerp(Vector3.zero, AOESize, step);
		step += stepInc;

		if (step >= 1)
		{
			Network.Destroy(gameObject);
		}
	}
}
