package com.aiyo407.chatbot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class ChatBotController {

    @RequestMapping("/tall")
    public String tall(String msg){
        String send = ChatbotTool.send(msg);
        return send;
    }
}
