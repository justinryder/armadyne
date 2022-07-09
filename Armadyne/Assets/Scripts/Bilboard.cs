using UnityEngine;
using System.Collections;

public class Bilboard : MonoBehaviour
{

	public GameObject theCamera;
	
	void Update ()
	{
		transform.LookAt(theCamera.transform.position);
	}
}
