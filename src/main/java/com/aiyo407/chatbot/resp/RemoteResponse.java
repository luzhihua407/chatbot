package com.aiyo407.chatbot.resp;

import lombok.Data;

/**
 * @author luzh
 * @version 1.0.0
 * @ClassName RemoteResponse.java
 * @Description TODO
 * @createTime 2020年07月09日 14:32:00
 */
@Data
public class RemoteResponse {

    private boolean success;

    private String code;

    private Object data;
}
