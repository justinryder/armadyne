using UnityEngine;
using System.Collections;

public class AudioHelper : MonoBehaviour {

	float
		averageFrequency = 0,
		highestFrequency = 0,
		peak = 0,
		peakFallRate = .01f,
		peakSensitivity = .00025f,
		beatDelay = .0001f,
		lastBeatTime = 0,
		beatLength = .01f;

	static int frequencyRange = 256;

	bool onBeat = false;
	public bool Beat
	{
		get { return onBeat; }
	}

	float[] frequencyData = new float[frequencyRange];


	// Use this for initialization
	void Start ()
	{
	}

	// Update is called once per frame
	void FixedUpdate()
	{
		averageFrequency = 0;
		highestFrequency = 0;
		audio.GetSpectrumData(frequencyData, 0, FFTWindow.Rectangular);

		for (int i = 0; i < frequencyRange; i++)
		{
			averageFrequency += frequencyData[i];
			if (i > frequencyRange / 8)
				continue;

			if (frequencyData[i] > highestFrequency)
				highestFrequency = frequencyData[i];
		}
		averageFrequency /= frequencyRange;

		if (Time.time > lastBeatTime + beatDelay && highestFrequency > peak + peakSensitivity)
		{
			lastBeatTime = Time.time;
			peak = highestFrequency;
			onBeat = true;
		}
		else if (Time.time > lastBeatTime + beatLength)
		{
			onBeat = false;
		}

		//Debug.Log((onBeat ? "BEAT" : "nope") + " P: " + peak + " H: " + highestFrequency + " A: " + averageFrequency);

		peak -= peakFallRate;
	}
}
