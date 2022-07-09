using UnityEngine;
using System.Collections;

public class ChatMessage
{

	string message = "";
	public string Message
	{
		get { return message; }
		set { message = value; }
	}

	PlayerManager playerSender;
	public PlayerManager PlayerSender
	{
		get { return playerSender; }
		set { playerSender = value; }
	}

	public Color SenderColor
	{
		get { return playerSender.MyColor; }
	}

	public string SenderName
	{
		get { return playerSender.MyName; }
	}

	public ChatMessage(PlayerManager sender, string sentMessage)
	{
		playerSender = sender;
		message = sentMessage;
	}
	
}
