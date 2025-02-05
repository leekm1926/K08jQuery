<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ZipcodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--파일명 : 08GugunOption.jsp --%>
<%@page trimDirectiveWhitespaces="true" %>
<%
//한글처리
request.setCharacterEncoding("UTF-8");

//입력한 sido를 파라미터로 받음
String sido = request.getParameter("sido");
ZipcodeDAO dao = new ZipcodeDAO();
//sido를 DAO로 파라미터 전달
ArrayList<String> gugunList = dao.getGugun(sido);

//DAO에서 반환된 결과를 JSON배열로 만들기 위한 객체생성
JSONArray jsonArr = new JSONArray();
for(String gu : gugunList){
	jsonArr.add(gu);
}

dao.close();
out.println(jsonArr.toString());
%>
