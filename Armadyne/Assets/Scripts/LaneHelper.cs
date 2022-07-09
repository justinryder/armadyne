using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class LaneHelper : MonoBehaviour {

    public Color laneColor = Color.cyan;
    List<GameObject> coloredChildren;

	// Use this for initialization
	void Start ()
    {
        coloredChildren = new List<GameObject>();
        if (codeADAM(transform))
            setLaneAccentColor();
	}
	
	// Update is called once per frame
	void Update ()
    {
	
	}

    bool codeADAM(Transform t)
    {
        int numOfChildren = t.childCount;
        if (numOfChildren == 0)
            return false;

        for (int i = 0; i < numOfChildren; i++)
        {
            Transform child = t.GetChild(i);
            if (child.gameObject.tag == "ColorAccent")
            {
                coloredChildren.Add(child.gameObject);
                //Debug.Log("Found child: " + child.gameObject.name);
            }
            else if (child.childCount != 0)
                codeADAM(child);
        }

        return true;
    }

    void setLaneAccentColor()
    {
        foreach (GameObject g in coloredChildren)
            g.renderer.material.color = laneColor;
    }
}
