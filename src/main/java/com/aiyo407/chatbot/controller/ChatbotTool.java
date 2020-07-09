package com.aiyo407.chatbot.controller;

import org.alicebot.ab.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChatbotTool {


	@Autowired
	private Chat chat;

	public String send(String question){
		String response = chat.multisentenceRespond(question);
		while (response.contains("&lt;"))
			response = response.replace("&lt;", "<");
		while (response.contains("&gt;"))
			response = response.replace("&gt;", ">");

		return response;
	}



}
