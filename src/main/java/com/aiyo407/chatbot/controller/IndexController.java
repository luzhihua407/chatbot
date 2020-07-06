package com.aiyo407.chatbot.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.ServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Controller
public class IndexController {

    @Value("${server.port}")
    private String port;

    @RequestMapping("/")
    public String index(ServletRequest request, ModelMap map) throws UnknownHostException {
        InetAddress ip = InetAddress.getLocalHost();
        String hostname = ip.getHostAddress();
        String server="http://"+hostname+":"+port;
        map.addAttribute("server",server);
        return "index";
    }

}
