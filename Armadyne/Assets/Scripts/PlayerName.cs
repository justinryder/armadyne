using UnityEngine;
using System.Collections;

public class PlayerName : MonoBehaviour {

	string nameText = "Name";
	public string Name
	{
		get { return nameText; }
		set { nameText = value; }
	}

	private Vector3 nameScreenLocation = Vector2.zero;

	private int nameHeight = 20;

	void OnGUI()
	{
		GUI.Label(new Rect(nameScreenLocation.x - 50, nameScreenLocation.y, 100, 20), nameText);
	}
	
	// Update is called once per frame
	void Update ()
	{
		nameScreenLocation = GameObject.FindGameObjectWithTag("MainCamera").GetComponent<Camera>().WorldToScreenPoint(transform.position - new Vector3(0, nameHeight, 0));
	}
}
