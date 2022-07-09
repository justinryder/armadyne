using UnityEngine;
using System.Collections;

public class BoostHelper : MonoBehaviour {

	float boostDie;

	void Start ()
	{
		boostDie = Time.time + 3;
	}
	
	void Update ()
	{
		if (Time.time > boostDie)
			Network.Destroy(gameObject);
	}
}
