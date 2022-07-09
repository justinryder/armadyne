using UnityEngine;
using System.Collections;

public class SwitchActivatedWall : SwitchActivatedObject {

    public Vector3
        activatedPositionDifference = new Vector3(0, -51, 0),
        speed = new Vector3(0, 1, 0);

    public float stepIncrement = 0.015f;

    Vector3
        startingPosistion = Vector3.zero,
        activatedPosistion = Vector3.zero;

    float step = 0;

	void Start ()
    {
        startingPosistion = transform.position;
        activatedPosistion = startingPosistion + activatedPositionDifference;
	}
	
	void FixedUpdate ()
    {
        if (isActive)
        {
            step += stepIncrement;
            if (step > 1)
                step = 1;
        }
        else
        {
            step -= stepIncrement;
            if (step < 0)
                step = 0;
        }
        transform.position = Vector3.Lerp(startingPosistion, activatedPosistion, step);
	}
}
