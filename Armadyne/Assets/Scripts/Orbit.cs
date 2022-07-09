using UnityEngine;
using System.Collections;

public class Orbit : MonoBehaviour {

	public Vector3 orbitCenter = Vector3.zero;
	public Vector3 orbitNormal = new Vector3(0, 0, 1);
	public float orbitSpeed = 5;
	
	void Update ()
	{
		Vector3 toCenter = transform.position - orbitCenter;
		toCenter.Normalize();
		orbitNormal.Normalize();
		Vector3 delta = Vector3.Cross(toCenter, orbitNormal);
		transform.Translate(delta * orbitSpeed);
	}
}
