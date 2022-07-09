using UnityEngine;
using System.Collections;

public class TubeBooster : MonoBehaviour {
	public float boostCap = .5f;
	public float boostIncrement = 150f;
	public float boostIncrementor = .0f;
	public GameObject player = null;
	
	// Use this for initialization
	void Start () 
	{
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		
	
	}
	
	void OnTriggerStay(Collider c)
	{
        if (c.gameObject.tag == "BoostTube")
        {
			if(boostCap > boostIncrementor)
			{
				transform.rigidbody.AddForce(-boostIncrement, 0, 0);
				//boostIncrementor += .1f;
			}
        }
	}
}
