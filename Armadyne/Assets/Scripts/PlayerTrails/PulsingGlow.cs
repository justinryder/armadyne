using UnityEngine;
using System.Collections;

public class PulsingGlow : MonoBehaviour
{

	public GameObject objectWithAudioHelper;

	public float
		glowOnBeat = 1f,
		glowOffBeat = .5f,
		glowStepIncrement = .05f;

	float
		glowStep = 1,
		glowAmount;

	// Use this for initialization
	void Start()
	{
		objectWithAudioHelper = GameObject.Find("Main Camera");
	}

	// Update is called once per frame
	void FixedUpdate()
	{
		// reset the glowStep if on the beat, otherwise increment it
		if (objectWithAudioHelper.GetComponent<AudioHelper>().Beat)
		{
			glowStep = 0;
			//Debug.Log("beat");
		}
		else
		{
			glowStep += glowStepIncrement;
			if (glowStep > 1)
				glowStep = 1;
		}

		// lerp the current glow amount
		glowAmount = Mathf.Lerp(glowOnBeat, glowOffBeat, glowStep);

		applyGlow();
	}

	public void applyGlow()
	{
		// set the alpha to the current glow amount
		Color color = gameObject.renderer.material.color;
		color.a = glowAmount;
		gameObject.renderer.material.color = color;
	}
}
