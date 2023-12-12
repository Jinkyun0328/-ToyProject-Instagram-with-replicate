<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/login.css" />
<script src="assets/js/jquery-3.7.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<div class="wrapper">
		<div class="container">
			<!--회원가입-->
			<div class="sign-up-container">
				<form id="join-form" method="POST" action=Join.do>
					<h1>Create Account</h1>
					<!--api버튼-->
					<div class="social-links">
						<div>
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
					<span>or use your email for registration</span>
					<!--input-->
					<input type="text" id="mem_id" name="mem_id" placeholder="ID">
					<input type="text" id="mem_name" name="mem_name" placeholder="Name">
					<input type="email" id="mem_email" name="mem_email"
						placeholder="Email"> <input type="password" id="mem_pw"
						name="mem_pw" placeholder="Password"> <input type="text"
						id="mem_pwCheck" name="mem_pwCheck" placeholder="Password Check">
					<input type="text" id="mem_phone" name="mem_phone"
						placeholder="Phone Number"> <input type="text"
						id="mem_addr1" name="mem_addr1" placeholder="Address"> <input
						type="text" id="mem_addr2" name="mem_addr2"
						placeholder="Detailed Address">
					<div id=err_message>빈칸이 존재합니다.</div>
					<button disabled " type="submit" id="mem_submit" class="form_btn">Sign Up</button>
				</form>
			</div>
			<!--로그인-->
			<div class="sign-in-container">
			
			
				<form id="send_email" method="POST" action="Login.do" style="display:None">
					<h1>Send Email</h1>
					<span>or use your account</span>
					<!--input-->
					<input id="input_email" type="text" name="mem_email" placeholder="input your email"> 
					<button id="sendEmailbtn" type="button" class="form_btn">Send Email</button>
					<a href="#" id="chage1">로그인하기</a>
				</form>

				<form id="signin-form" method="POST" action="Login.do">
					<h1>Sign In</h1>
					<!--api버튼-->
					<div class="social-links">
						<div>
							<a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						</div>
						<div>
							<a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
						</div>
					</div>
					<span>or use your account</span>
					<!--input-->
					<input type="id" name="mem_id" placeholder="ID"> <input
						type="password" name="mem_pw" placeholder="Password">
					<button type="submit" class="form_btn">Sign In</button>
					<a href="#" id="chage2">아이디/비밀번호 찾기</a>
				</form>
				
				
			</div>

			<div class="overlay-container">
				<!--로그인 위한 레이아웃-->
				<div class="overlay-left">
					<h1>Welcome Back</h1>
					<p>To keep connected with us please login with your personal
						info</p>
					<button id="signIn" class="overlay_btn">Sign In</button>
				</div>
				<!--회원가입 위한 레이아웃-->
				<div class="overlay-right">
					<h1>Hello, Friend</h1>
					<p>Enter your personal details and start journey with us</p>
					<button id="signUp" class="overlay_btn">Sign Up</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		const form_signin = document.getElementById("signin-form");
		const send_email =  document.getElementById("send_email");
	
		$("#chage2").on('click', () => {
			$('#signin-form').css('display', 'none');
			$('#send_email').css('display', '');
		})
	
		$("#chage1").on('click', () => {
			$('#signin-form').css('display', '');
			$('#send_email').css('display', 'none');
		})
		
		$("#sendEmailbtn").on('click', () => {
			// ajax를 사용하여 데이터베이스에서 이메일을 사용한 mem_info 조회
			console.log($("#input_email").val());
			
			$.ajax({
                type: "get",
                url: 'EmailCheck.do',
                data: {data: $("#input_email").val()},
                dataType : "json",
                success: (res) => {
                	console.log(res)
                	$.ajax({
                        type: "get",
                        url: 'http://127.0.0.1:9003//sendEmailService',
                        data: {to_email: $("#input_email").val(), mem_id: res.mem_id, mem_pw: res.mem_pw},
                        success: (res) => {
                        	console.log(res)
                        	if(res == "success"){
                        		alert("이메일 전송을 성공했습니다.");
                        	}else{
                        		alert("이메일 전송을 실패했습니다.");
                        	}
                        },
                        error : function(){
                        	console.log("error");
                        }	
                    });
                },
                error : function(){
                	console.log("error");
                	alert("이메일을 확인해주세요");
                }	
            });
			
		})
		
		

	
		const signUpBtn = document.getElementById("signUp");
		const signInBtn = document.getElementById("signIn");
		const container = document.querySelector(".container");

		signUpBtn.addEventListener("click", () => {
			container.classList.add("right-panel-active");
		});
		signInBtn.addEventListener("click", () => {
			container.classList.remove("right-panel-active");
		});
		
		let id_check = true;
		let pw_check = true;
		let sign_check = false;
		
		
		
		// 빈칸이 하나라도 있으면 sign_check에 false
		// 모두 채워져 있으면 true를 반환
		function blankCheck(){
			if($("#mem_pw").val().length == 0){
				sign_check = false;
			}else if($("#mem_name").val().length == 0){
				sign_check = false;
			}else if($("#mem_email").val().length == 0){
				sign_check = false;
			}else if($("#mem_pw").val().length == 0){
				sign_check = false;
			}else if($("#mem_pwCheck").val().length == 0){
				sign_check = false;
			}else if($("#mem_phone").val().length == 0){
				sign_check = false;
			}else if($("#mem_addr1").val().length == 0){
				sign_check = false;
			}else if($("#mem_addr2").val().length == 0){
				sign_check = false;
			}else{
				sign_check = true;
			}
		}
		
		// err_message 출력
		function printErrMessage(){
			$("#err_message").empty();
			if(id_check == false){
				$("#err_message").text("이미 사용중인 아이디입니다.");
				$("#mem_submit").attr("disabled",true); 
			}else if(pw_check == false){
				$("#err_message").text("비밀번호가 일치하지 않습니다.");
				$("#mem_submit").attr("disabled",true); 
			}else if(sign_check == false){
				$("#err_message").text("빈칸이 존재합니다.");
				$("#mem_submit").attr("disabled",true); 
			}else{
				$("#err_message").text("회원가입이 가능합니다.");
				$("#mem_submit").attr("disabled",false); 
			}
		}
		
		// ajax를 사용하여 아이디 중복을 검색
        $("#mem_id").on('keyup', () => {
        	console.log($("#mem_id").val().length)
            $.ajax({
                url: "idduple",
                data: { id: $("#mem_id").val()},

                success : function (res) {
                    console.log("요청성공");
                    console.log("응답받은 데이터 >>" , res);
                    if(res == "false"){
                    	id_check = false;
                    }else{
                    	id_check = true;
                    }
                    
                    blankCheck();
                	printErrMessage();
                },
                error : function(){
                    console.log("error");
                }
            })
        })
        
        $("#mem_name").on('keyup', () => {
        	blankCheck();
        	printErrMessage();
        })
        
        $("#mem_email").on('keyup', () => {
        	blankCheck();
        	printErrMessage();
        })
        
        // pw와 pwCheck가 일치하는지 확인
        $("#mem_pw").on('keyup', () => {
        	if($("#mem_pw").val() == $("#mem_pwCheck").val()){
        		pw_check = true;
        	}else{
        		pw_check = false;
        	}
        	
        	blankCheck();
        	printErrMessage();
        })
        
        $("#mem_pwCheck").on('keyup', () => {
        	if($("#mem_pw").val() == $("#mem_pwCheck").val()){
        		pw_check = true;
        	}else{
        		pw_check = false;
        	}
        	
        	blankCheck();
        	printErrMessage();
        })
        
        $("#mem_phone").on('keyup', () => {
        	blankCheck();
        	printErrMessage();
        })
        
        $("#mem_addr1").on('keyup', () => {
        	blankCheck();
        	printErrMessage();
        })
        
		$("#mem_addr2").on('keyup', () => {
			blankCheck();
        	printErrMessage();
        })


	</script>
</body>
</html>