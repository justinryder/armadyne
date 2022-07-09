using UnityEngine;
using System.Collections;

public class ConstantRotation : MonoBehaviour {
	
	public Vector3 rotationAxis = Vector3.zero;
	public float rotationSpeed = 0;
	
	void Start ()
	{
        rotationAxis.Normalize();
	}
	
	void FixedUpdate ()
	{
		transform.Rotate(rotationAxis, rotationSpeed);
	}
}
