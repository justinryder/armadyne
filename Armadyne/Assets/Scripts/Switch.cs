using UnityEngine;
using System.Collections;

public class Switch : MonoBehaviour {

    public GameObject objectToActivate = null;

	// Use this for initialization
	void Start ()
    {
	
	}
	
	// Update is called once per frame
	void Update ()
    {
	
	}

    void OnTriggerEnter(Collider c)
    {
        objectToActivate.GetComponent<SwitchActivatedObject>().activate();
    }

    void OnTriggerExit(Collider c)
    {
        objectToActivate.GetComponent<SwitchActivatedObject>().deactivate();
    }
}
