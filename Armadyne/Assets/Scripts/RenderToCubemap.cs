using UnityEngine;
using System.Collections;

public class RenderToCubemap : MonoBehaviour {
	
	public Cubemap RenderTo = null; 
	
	// Use this for initialization
	void Start () {
	
		
	camera.RenderToCubemap(RenderTo);	
		
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
