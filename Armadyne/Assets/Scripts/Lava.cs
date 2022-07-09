using UnityEngine;
using System.Collections;

public class Lava : MonoBehaviour {
	public float offset = 0f;
	public float speed = 0f;
	public Material materialToUpdate = null;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () 
	{
		offset -= Time.deltaTime / speed;
		
		//if (materialToUpdate != null)
		//{
			renderer.material.SetTextureOffset("_MainTex", new Vector2(offset, 0));
			//materialToUpdate.SetTextureOffset(_MainText, new Vector2(offset, 0));
		//}
	}
}