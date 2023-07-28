<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>

<!-- 참고 사이트: https://dev-gorany.tistory.com/3 -->
<!-- 참고 사이트: https://gnaseel.tistory.com/11 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title> 채팅 테스트 개발 </title>	
	</head>
	
	<body>
		<div>
			<!-- 채팅에 필요한 오브젝트 -->
        	<button type = "button" onclick = "openSocket()"> 대화방 참여 </button>
        	<button type = "button" onclick = "closeSocket()"> 대회방 나가기 </button> <br> <br> <br>
	  		메시지 입력 : <input type = "text" id = "sender" value = "${sessionScope.id}" style = "display: none">
	        <input type = "text" id = "messageInput">
	        <button type = "button" onclick = "send()"> 메세지 전송 </button>
	        <button type = "button" onclick = "clearText()"> 대화내용 지우기 </button>
	        
	        <!-- 메시지 표시 공간 -->
	        <div id = "messages">
	        
    		</div>
    	</div>
    	
    	<script>
	        var ws;
	        var messages = document.getElementById("messages");
	        
	        // 웹 소켓 열기
	        function openSocket()
	        {
	        	// 웹 소켓 연결에 오류가 없다면
	            if (ws !== undefined && ws.readyState !== WebSocket.CLOSED )
	            {
	                writeResponse("WebSocket is already opened.");
	                return;
	            }
	        	
	            // 웹 소켓 객체 생성
	            ws = new WebSocket("ws://localhost:8090/<%= request.getContextPath() %>/echo.do");
	            
	            /* 웹 소켓 요청 대기 */
	            // 웹 소켓 열기를 요청 받았을 때
	            ws.onopen = function(event)
	            {
	                if(event.data === undefined)
	                {
	              		return;
	                }
	                writeResponse(event.data);
	            };
	            // 메시지 보내기를 요청 받았을 때
	            ws.onmessage = function(event)
	            {
	                console.log('writeResponse');
	                console.log(event.data)
	                writeResponse(event.data);
	            };
	            // 웹 소켓 닫기를 요청 받았을 때
	            ws.onclose = function(event)
	            {
	                writeResponse("대화 종료");
	            }
	        }
	        
	        // 메시지 전송
	        function send()
	        {
	            var text = document.getElementById("messageInput").value + ", " + document.getElementById("sender").value;
	            ws.send(text);
	            text = "";
	        }
	         
	        // 웹 소켓 닫기
	        function closeSocket()
	        {
	            ws.close();
	        }
	         
	        // 메시지 표시
	        function writeResponse(text)
	        {
	            messages.innerHTML += "<br>" + text;
	        }
	
	        // 메시지 초기화
	        function clearText()
	        {
	            console.log(messages.parentNode);
	            messages.parentNode.removeChild(messages)
	       	}
        </script>
	</body>
</html>