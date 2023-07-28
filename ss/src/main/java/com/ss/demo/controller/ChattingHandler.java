package com.ss.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint (value = "/echo.do")
public class ChattingHandler
{
    // 세션 리스트
    private static final List<Session> sessionList = new ArrayList<Session>();
    // 로그
    private static final Logger logger = LoggerFactory.getLogger(ChattingHandler.class);
    
    // 생성자
    public ChattingHandler()
    {
        System.out.println("웹 소켓 객체 생성");
    }
    
    // 웹 소켓 열기
    @OnOpen
    public void onOpen(Session session)
    {
        logger.info("Open session id:" + session.getId());
        try
        {
            final Basic basic = session.getBasicRemote();
            basic.sendText("채팅방에 연결 되었습니다.");
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    
    /*
     * 모든 유저에게 메시지를 전송
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message)
    { 	
        try
        {
            for (Session session : ChattingHandler.sessionList)
            {
                if(!self.getId().equals(session.getId()))
                {
                    session.getBasicRemote().sendText(sender + ": " + message);
                }
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message, Session session)
    {	
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From " + sender + ": " + message);
        try
        {
            final Basic basic = session.getBasicRemote();
            basic.sendText("<나>: " + message);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e, Session session)
    {
        
    }
    
    // 웹 소켓 닫기
    @OnClose
    public void onClose(Session session)
    {
        logger.info("Session " + session.getId() + " has ended");
        sessionList.remove(session);
    }
}