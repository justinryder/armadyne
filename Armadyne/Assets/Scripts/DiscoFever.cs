using UnityEngine;
using System.Collections;

public class DiscoFever : MonoBehaviour
{

	public Vector3 increment = new Vector3(.01f, .03f, .05f);
	Vector3 step = Vector3.zero;

	void Start ()
	{
		
	}
	
	void Update ()
	{
		renderer.material.color = new Color(step.x, step.y, step.z, renderer.material.color.a);

		step += increment;
		if (step.x > 1)
			step.x = 0;
		if (step.y > 1)
			step.y = 0;
		if (step.z > 1)
			step.z = 0;
	}
}
