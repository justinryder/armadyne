using UnityEngine;
using System.Collections;

public class FireTrail : MonoBehaviour
{
	public float
		slowEmission = 5,
		fastEmission = 50,
		slowSize = 0f,
		fastSize = 16,
		minSpeedToEmit = 1f,
		maxSpeedToEmit = 3f;

	GameObject trail;
	public GameObject Trail
	{
		get { return trail; }
		set { trail = value; }
	}
		
	Vector3 lastPosition = Vector3.zero;

	float
		emissionRate = 0,
		size = 1;

	void Start ()
	{
		lastPosition = transform.position;
	}
	
	void FixedUpdate ()
	{
		trail.transform.position = transform.position + Vector3.down * 5;

		float speed = Vector3.Distance(lastPosition, transform.position);
		float step = 0;

		if (speed < minSpeedToEmit)
			emissionRate = 0;
		else
		{
			step = (speed - minSpeedToEmit) / (maxSpeedToEmit - minSpeedToEmit);
			if (step > 1)
				step = 1;
			emissionRate = Mathf.Lerp(slowEmission, fastEmission, step);
			size = Mathf.Lerp(slowSize, fastSize, step);
		}

		for (int i = 0; i < trail.transform.childCount; i++)
		{
			ParticleEmitter pe = trail.transform.GetChild(i).GetComponent<ParticleEmitter>();
			pe.minEmission = emissionRate;
			pe.maxEmission = emissionRate;
			pe.minSize = size;
			pe.maxSize = size;
		}

		//Debug.Log("step: " + step + " er " + emissionRate + " size " + size + " speed " + speed + " max speed " + maxSpeedToEmit);

		lastPosition = transform.position;
	}

}
