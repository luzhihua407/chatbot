package com.aiyo407.chatbot.controller;

import com.aiyo407.chatbot.resp.RemoteResponse;
import com.aiyo407.chatbot.resp.SraixResponse;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.dataformat.xml.JacksonXmlModule;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

@RestController
public class ChatBotController {

    @Autowired
    private  RestTemplate restTemplate;

    @Autowired
    private  ChatbotTool chatbotTool;


    @RequestMapping("/tall")
    public String tall(String msg){
        String send = chatbotTool.send(msg);
        return send;
    }

    @RequestMapping("/pandora/talk-xml")
    public String remote(String botid,String input) throws URISyntaxException, JsonProcessingException {
        RemoteResponse remoteResponse = restTemplate.getForObject(new URI(input), RemoteResponse.class);
        String result="";
        if(remoteResponse.isSuccess()){
            result=   remoteResponse.getData().toString();
        }
        SraixResponse sraixResponse = new SraixResponse(result,"");
        JacksonXmlModule module = new JacksonXmlModule();
        module.setDefaultUseWrapper(true);
        XmlMapper xmlMapper = new XmlMapper(module);
        result = xmlMapper.writeValueAsString(sraixResponse);
        return result;
    }
}
