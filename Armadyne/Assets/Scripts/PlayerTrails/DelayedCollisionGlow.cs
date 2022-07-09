using UnityEngine;
using System.Collections;

public class DelayedCollisionGlow : MonoBehaviour
{

	public GameObject
		glowObject,
		objectWithAudioHelper;
	public int glowCount = 10;
	public float
		initialScale = 4,
		scaleFactor = .9f;

	GameObject[] glowObjects;
	Vector3[] previousGlowLocations;
	Vector3 nextGlowLocationToBeAdded;

	Color trailColor = Color.black;

	//float
	//    glowStep = 1,
	//    glowStepIncrement = .0025f,
	//    glowOnBeat = 10,
	//    glowOffBeat = .5f;

	void Start()
	{
		previousGlowLocations = new Vector3[glowCount];
		glowObjects = new GameObject[glowCount];
		float scale = initialScale;
		for (int i = glowCount - 1; i >= 0; i--)
		{
			//set the position
			previousGlowLocations[i] = transform.position;

			//instantiate the glow objects
			glowObjects[i] = (GameObject)Instantiate(glowObject);

			//set the scale
			glowObjects[i].transform.localScale *= scale;

			//set the glow amount
			glowObjects[i].GetComponent<PulsingGlow>().objectWithAudioHelper = objectWithAudioHelper;
			//Color color = glowObjects[i].renderer.material.color;
			//color.a = scale;
			//glowObjects[i].renderer.material.color = color;

			//reduce the scale for the next glow object
			scale *= scaleFactor;
		}
		setColor(trailColor);
	}

	void OnDestroy()
	{
		for (int i = 0; i < glowCount; i++)
			Destroy(glowObjects[i]);
	}

	void FixedUpdate()
	{
		if (shiftPreviousLocations())
		{
			updateGlowObjects();
		}
	}

	void OnCollisionStay(Collision c)
	{
		if (c.gameObject.tag != "Player")
		{
			nextGlowLocationToBeAdded = new Vector3(c.contacts[0].point.x, c.contacts[0].point.y, c.contacts[0].point.z);
		}
	}

	void updateGlowObjects()
	{
		//float scale = initialScale;
		//highestFrequency = backgroundMusicObject.GetComponent<AudioHelper>().HighestFrequency;
		//bool onBeat = backgroundMusicObject.GetComponent<AudioHelper>().Beat;
		for (int i = 0; i < glowCount; i++)
		{
			glowObjects[i].transform.position = previousGlowLocations[i];

			//set the glow amount
			//Color color = glowObjects[i].renderer.material.color;
			//if (onBeat)
			//{
			//    glowStep = 0;
			//}
			//else
			//{
			//    glowStep += glowStepIncrement;
			//    if (glowStep > 1)
			//        glowStep = 1;
			//}
			//float glowAmount = Mathf.Lerp(glowOnBeat, glowOffBeat, glowStep);
			//color.a = scale * glowAmount;
			//glowObjects[i].renderer.material.color = color;

			//reduce the scale for the next glow object
			//scale *= scaleFactor;
		}
	}

	bool shiftPreviousLocations()
	{
		for (int i = 0; i < glowCount - 1; i++)
			previousGlowLocations[i] = previousGlowLocations[i + 1];
		previousGlowLocations[glowCount - 1] = nextGlowLocationToBeAdded;

		return true;
	}

	public void setColor(Color newColor)
	{
		if (glowObjects == null || glowObjects.Length == 0)
			trailColor = newColor;
		else
			foreach (GameObject go in glowObjects)
				go.renderer.material.color = newColor;
	}
}
