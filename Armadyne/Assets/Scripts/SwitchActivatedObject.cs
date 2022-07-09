using UnityEngine;
using System.Collections;

public class SwitchActivatedObject : MonoBehaviour {

    public float stateChangeDelay = 1;
    float lastStateChangeTime = 0;

    protected bool
        isActive = false,
        delayedActive = false;

	// Use this for initialization
	void Start ()
    {
	
	}
	
	// Update is called once per frame
	void Update ()
    {
        if (delayedActive != isActive)
        {
            if (Time.time > lastStateChangeTime + stateChangeDelay)
                isActive = delayedActive;
        }
	}

    public void activate()
    {
        delayedActive = true;
        lastStateChangeTime = Time.time;
    }

    public void deactivate()
    {
        delayedActive = false;
        lastStateChangeTime = Time.time;
    }
}
