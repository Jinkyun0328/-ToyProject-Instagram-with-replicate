<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Westagram</title>
    <link rel="stylesheet" href="assets/style/reset.css" />
    <link rel="stylesheet" href="assets/style/common.css" />
    <link rel="stylesheet" href="assets/style/login.css" />
  </head>
  <body>
    <div class="box-all">
      <h1 class="text-title">Westagram</h1>
      <form class="form-login">
        <input
          id="input-id"
          type="text"
          placeholder="전화번호, 사용자 이름 또는 이메일"
        />
        <input id="input-pw" type="password" placeholder="비밀번호" />
        <button id="btn-login" type="submit" disabled="true">로그인</button>
      </form>
      <p class="message-emailError">*이메일 형식을 다시 확인해주세요.</p>
      <p class="message-pwError">*비밀번호가 5글자 이상인지 확인해주세요.</p>
      <p class="message-forgetPw">비밀번호를 잊으셨나요?</p>
    </div>
    <script src="js/login.js"></script>
  </body>
</html>
