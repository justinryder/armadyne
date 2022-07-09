using UnityEngine;
using System.Collections.Generic;
using System.Collections;

public class AudioManager : MonoBehaviour
{
	#region Managers

	Game game;
	GUIManager guiManager;
	LevelManager levelManager;
	NetworkManager networkManager;
	OptionsManager optionsManager;
	PlayerManager playerManager;
	TeamManager teamManager;

	#endregion
	#region publicVariables

	public GameObject boostSound,
				collectSound,
				deathSound,
				rollSound,
				hitSound,
				jumpSound,
				fusRoDahSound,
				sumoQuakeSound,
				selfDestructSound,
				teleportSound,
				meteorSound,
				l3DeathSound,
				bubbleSound,
				brickwallSound,
				fireshieldSound;

	public float inWaterPitch = .5f;

	#endregion
	#region privateVariables

	private bool playerInWater = false;

	private float outWaterPitch = 1f;

	#endregion
	#region monoBehaviorInherits

	void Awake()
	{
		//setup the managers
		game = GetComponent<Game>();
		guiManager = GetComponent<GUIManager>();
		levelManager = GetComponent<LevelManager>();
		networkManager = GetComponent<NetworkManager>();
		optionsManager = game.optionsManager;
		playerManager = game.playerManager;
		teamManager = GetComponent<TeamManager>();
	}

	void Update()
	{

		if (playerInWater)
		{
			boostSound.audio.pitch = inWaterPitch;
			collectSound.audio.pitch = inWaterPitch;
			deathSound.audio.pitch = inWaterPitch;
			//rollSound.audio.pitch = inWaterPitch;
			hitSound.audio.pitch = inWaterPitch;
			jumpSound.audio.pitch = inWaterPitch;
		}
		else
		{
			boostSound.audio.pitch = outWaterPitch;
			collectSound.audio.pitch = outWaterPitch;
			deathSound.audio.pitch = outWaterPitch;
			//rollSound.audio.pitch = outWaterPitch;
			hitSound.audio.pitch = outWaterPitch;
			jumpSound.audio.pitch = outWaterPitch;
		}
	}
	#endregion
	#region soundMethods
	public void playBoostSound()
	{
		if (!optionsManager.SoundPowerup || !optionsManager.SoundFX)
			return;
		boostSound.audio.enabled = true;
		boostSound.audio.Play();
	}
	
	public void playCollectSound()
	{
		collectSound.audio.enabled = true;
		if (optionsManager.SoundFX)
			collectSound.audio.Play();
	}
	
	public void playDeathSound()
	{
		deathSound.audio.enabled = true;
		if (optionsManager.SoundFX)
			deathSound.audio.Play();
	}

	public void playDeathSizzle()
	{
		l3DeathSound.audio.enabled = true;
		if (optionsManager.SoundFX)
			l3DeathSound.audio.Play();
	}
	
	public void playRollSound()
	{
		//rollSound.audio.enabled = true;
		//if (optionsManager.SoundFX)
			//rollSound.audio.Play();
	}

	public void playFusRoDahSound()
	{
		fusRoDahSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			fusRoDahSound.audio.Play();
	}

	public void playHitSound()
	{
		hitSound.audio.enabled = true;
		if (optionsManager.SoundFX)
			hitSound.audio.Play();
	}

	public void playJumpSound()
	{
		jumpSound.audio.enabled = true;
		if (optionsManager.SoundFX)
			jumpSound.audio.Play();
	}

	public void playSumoQuakeSound()
	{
		sumoQuakeSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			sumoQuakeSound.audio.Play();
	}

	public void playSelfDestructSound()
	{
		selfDestructSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			selfDestructSound.audio.Play();
	}

	public void playTeleportSound()
	{
		teleportSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			teleportSound.audio.Play();
	}

	public void playMeteorSound()
	{
		meteorSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			meteorSound.audio.Play();
	}

	public void playBubbleSound()
	{
		bubbleSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			bubbleSound.audio.Play();
	}

	public void playBrickwallSound()
	{
		brickwallSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			brickwallSound.audio.Play();
	}

	public void playFireShieldSound()
	{
		fireshieldSound.audio.enabled = true;
		if (optionsManager.SoundPowerup)
			fireshieldSound.audio.Play();
	}
	#endregion
	#region setMethods
	public void setInWater(bool b)
	{
		playerInWater = b;
	}
	#endregion
}
