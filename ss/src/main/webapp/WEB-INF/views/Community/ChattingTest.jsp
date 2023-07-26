<%@ page language = "java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>

<!-- 참고 사이트: https://dev-gorany.tistory.com/3 -->
<!-- 참고 사이트: https://gnaseel.tistory.com/11 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset = "UTF-8">
		<title> 채팅 테스트 개발 </title>
		<script src = "http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"> </script>
		<script src = "https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"> </script>
		
		<script>
			function sendMsg()
			{
				sendMessage();
				$('#message').val('');
			}
		
			var sock = new SockJS("http://localhost:8081/chatting");
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			
			// 메시지 전송
			function sendMessage()
			{
				alert("메시지 전송");
				sock.send($("#message").val());
			}
			// 서버로부터 메시지를 받았을 때
			function onMessage(msg)
			{
				alert("메시지 받음");
				var data = msg.data;
				$("#messageArea").append(data + "<br/>");
			}
			// 서버와 연결을 끊었을 때
			function onClose(evt)
			{
				alert("연결 끊김");
				$("#messageArea").append("연결 끊김");
			}
		</script>
	</head>
	
	<body>
		현재 로그인 한 유저: <br> <br>
		 
		<input type = "text" id = "message" />
		<button onclick = "sendMsg()"> 메시지 전송 </button>
		<div id = "messageArea"> </div>
	</body>
</html>