using UnityEngine;
using System.Collections;

public class OptionsManager
{

	Game game;
	public bool SoundFX { get; set; }
	public bool SoundMusic { get; set; }
	public bool SoundPowerup { get; set; }

	public OptionsManager(Game g)
	{
		game = g;
		SoundFX = true;
		SoundMusic = true;
		SoundPowerup = true;
	}

}
