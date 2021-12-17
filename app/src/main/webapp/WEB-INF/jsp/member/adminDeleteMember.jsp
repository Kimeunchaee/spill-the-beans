<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true" %>
<h2 class="major">회원 탈퇴</h2>

<p> 정말 [${member.nickname}] 님을 탈퇴 시키겠습니까?</p>

<a href='adminDeleteMember?memberNo=${member.no}#adminDeleteMember' class ="button" style="font-size: 16px; width: 49%;">네</a>
<a href='list' class ="button" style="font-size: 16px; width: 49%;">아니요</a>
