using UnityEngine;
using System.Collections;

public class ConstantSineBounce : MonoBehaviour {
	
	public float offsetModifier = 5;
	Vector3 startingPosition;
	
	void Start ()
	{
		startingPosition = transform.position;
	}
	
	void FixedUpdate ()
	{
		float offset = Mathf.Sin(Time.time) * offsetModifier;
		transform.position = startingPosition + new Vector3(0, offset, 0);
	}
}
