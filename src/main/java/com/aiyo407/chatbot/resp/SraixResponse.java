package com.aiyo407.chatbot.resp;

import lombok.Data;

import javax.xml.bind.annotation.XmlType;

/**
 * @author luzh
 * @version 1.0.0
 * @ClassName SraixResponse.java
 * @Description TODO
 * @createTime 2020年07月09日 15:35:00
 */
@Data
public class SraixResponse {

    private String that;

    private String custid;

    public SraixResponse(String that, String custid) {
        this.that = that;
        this.custid = custid;
    }
    public SraixResponse() {

    }
}
