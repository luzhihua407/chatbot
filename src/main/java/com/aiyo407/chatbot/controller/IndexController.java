package com.aiyo407.chatbot.controller;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.seg.common.Term;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class IndexController {

    @RequestMapping("/")
    public String index(){
        return "index";
    }

    public static void main(String[] args) {
        List<Term> list = HanLP.segment("你叫什么名字？");
        for(Term term:list){
            System.err.println(term.word);
        }
        System.out.println(HanLP.segment("你叫什么名字？"));
    }
}
