using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MainSceneCamera : MonoBehaviour
{
	Game game;

	public GameObject
		rootSelected = null;

	GameObject
		previousSelected = null,
		nextSelected = null;

	public float startIncrement = .005f, selectedIncrement = .01f;

	float increment = .01f;

	Vector3
		nextLocation = Vector3.zero,
		previousLocation = Vector3.zero;

	float step = 1.5f;

	void Awake()
	{
		game = GameObject.Find("Game").GetComponent<Game>();
		nextSelected = previousSelected = rootSelected;
		previousLocation = transform.position;

		if (!game.optionsManager.SoundMusic)
			audio.enabled = false;
	}

	void OnGUI()
	{
		if (game.guiManager.MenuState != MenuState.main || Network.peerType == NetworkPeerType.Server || Network.peerType == NetworkPeerType.Client)
			return;

		nextSelected.GetComponent<MainSceneSelection>().gui();

		GUI.Label(new Rect(0, 0, 400, 100), "Select - W, Up Arrow, Enter, Return, Space, Left Click\nDeselect - S, Down Arrow, Backspace, Delete, Escape, Right Click\nNext - D, Right Arrow, Scroll Up\nPrevious - A, Left Arrow, Scroll Down");
	}

	void Update()
	{
		if (game.guiManager.MenuState != MenuState.main || Network.peerType == NetworkPeerType.Server || Network.peerType == NetworkPeerType.Client)
			return;

		if (nextSelected == rootSelected)
		{
			increment = startIncrement;
			if (step >= 1)
			{
				step = 0;
				previousLocation = transform.position;
				float distance = Vector3.Distance(transform.position, rootSelected.transform.position);
				nextLocation = Vector3.down;
				while (Vector3.Dot(nextLocation.normalized, Vector3.down) > .1f ||
					Vector3.Dot(nextLocation.normalized, Vector3.up) > .2f ||
					Vector3.Dot(nextLocation.normalized, transform.position.normalized) < 0 ||
					Vector3.Dot(nextLocation.normalized, transform.position.normalized) > .5f)
					{ nextLocation = Random.insideUnitSphere.normalized * distance; }
				previousSelected = rootSelected;
			}
		}
		else
			increment = selectedIncrement;
		if (Input.GetKeyUp(KeyCode.D) || Input.GetKeyUp(KeyCode.RightArrow) || Input.GetAxis("Mouse ScrollWheel") > 0)
			nextSelection();
		if (Input.GetKeyUp(KeyCode.A) || Input.GetKeyUp(KeyCode.LeftArrow) || Input.GetAxis("Mouse ScrollWheel") < 0)
			previousSelection();
		if (Input.GetKeyUp(KeyCode.W) || Input.GetKeyUp(KeyCode.UpArrow) || Input.GetKeyUp(KeyCode.KeypadEnter) || Input.GetKeyUp(KeyCode.Return) || Input.GetKeyUp(KeyCode.Space) || (Input.GetMouseButtonUp(0) && nextSelected.GetComponent<MainSceneSelection>().menu != MenuItem.initServer))
			select();
		if (Input.GetKeyUp(KeyCode.S) || Input.GetKeyUp(KeyCode.DownArrow) || Input.GetKeyUp(KeyCode.Escape) || Input.GetKeyUp(KeyCode.Backspace) || Input.GetKeyUp(KeyCode.Delete) || Input.GetMouseButtonUp(1))
			deselect();

		animate();
	}

	void animate()
	{
		if (step < 1)
		{
			Vector3 previousVec = previousLocation - nextSelected.GetComponent<MainSceneSelection>().parentPiece.transform.position;
            Vector3 nextVec = nextLocation - nextSelected.GetComponent<MainSceneSelection>().parentPiece.transform.position;

            Vector3 currentVec = Vector3.Slerp(previousVec, nextVec, step);
            currentVec.Normalize();

            transform.position = Vector3.Slerp(previousLocation, nextLocation, step);

			step += increment;
		}

        Vector3 lookAt = previousSelected == nextSelected ?
            nextSelected.GetComponent<MainSceneSelection>().parentPiece.transform.position :
            Vector3.Slerp(previousSelected.GetComponent<MainSceneSelection>().parentPiece.transform.position, nextSelected.GetComponent<MainSceneSelection>().parentPiece.transform.position, step);

        float distance = Mathf.SmoothStep(previousSelected.GetComponent<MainSceneSelection>().Distance, nextSelected.GetComponent<MainSceneSelection>().Distance, step) * 1.5f;

        transform.LookAt(lookAt);
        transform.position = lookAt - transform.forward * distance;
	}

	void select()
	{
		previousSelected = nextSelected;
		nextSelected = nextSelected.GetComponent<MainSceneSelection>().select();

		previousLocation = transform.position;
		nextLocation = nextSelected.GetComponent<MainSceneSelection>().OriginalLocation;

		step = 0;
	}

	void deselect()
	{
		previousSelected = nextSelected;
		nextSelected = nextSelected.GetComponent<MainSceneSelection>().deselect();

		previousLocation = transform.position;
        nextLocation = nextSelected.GetComponent<MainSceneSelection>().OriginalLocation;

		step = 0;
	}

	void nextSelection()
	{
		previousSelected = nextSelected;
		nextSelected = nextSelected.GetComponent<MainSceneSelection>().next();
        if (nextSelected == previousSelected)
            nextSelected = nextSelected.GetComponent<MainSceneSelection>().select();

		previousLocation = transform.position;
        nextLocation = nextSelected.GetComponent<MainSceneSelection>().OriginalLocation;

		step = 0;
	}

	void previousSelection()
	{
		previousSelected = nextSelected;
        nextSelected = nextSelected.GetComponent<MainSceneSelection>().previous();
        if (nextSelected == previousSelected)
            nextSelected = nextSelected.GetComponent<MainSceneSelection>().select();

		previousLocation = transform.position;
        nextLocation = nextSelected.GetComponent<MainSceneSelection>().OriginalLocation;

		step = 0;
	}

}
