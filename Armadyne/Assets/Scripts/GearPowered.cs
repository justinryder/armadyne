using UnityEngine;
using System.Collections;

public class GearPowered : MonoBehaviour
{
	#region Public Data

	public float turnSpeed = .5f;

	#endregion
	#region Inherited from MonoBehaviour

	void FixedUpdate()
	{
		transform.Rotate(0, turnSpeed, 0, Space.Self);
	}

	#endregion
}
