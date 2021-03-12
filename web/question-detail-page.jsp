<%-- 
    Document   : question-detail-page
    Created on : Mar 1, 2021, 9:28:55 PM
    Author     : LongNH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <script src="https://kit.fontawesome.com/ff02cdde28.js" crossorigin="anonymous"></script>
        <title>Question Detail Page</title>
    </head>
    <body>
        <c:set var="userinfor" value="${sessionScope.USER_INFOR}" />
        <c:set var="allanswer" value="${requestScope.QUESTION_ANSWER}" />
        <c:set var="subjects" value="${requestScope.SUBJECT}" />
        <c:set var="answercorrect" value="${requestScope.CORRECT_ANS}" />
        <c:set var="question" value="${requestScope.QUESTION}" />
        <div class="headinformation">
            <h1>Online Quiz</h1>
            <div class="welcome-and-login">
                <a href="Logout"><i class="fa fa-sign-out"> Welcome, ${userinfor.name} </i></a>
            </div>
        </div>
        <div class="container" >
            <form action="HandlingQuestionUpdate" method="POST">
                <h3> Question ID : ${question.questionID} </h3>
                <input type="hidden" name="questionID" value="${question.questionID}" />
                <h3> Subject <select name="subjectList">
                        <option>Subject:</option>
                        <c:forEach var="subject" items="${subjects}" >
                            <option value="${subject.subjectID}" <c:if test="${question.subjectID == subject.subjectID}">selected</c:if> >${subject.subjectName}</option>
                        </c:forEach>
                    </select> </h3>
                <h3> Question : <input class="question-textbox" type="text" name="question" value="${question.question}" required/> </h3>

                <c:set var="count" value="${1}" />

                <c:forEach var="answer" items="${allanswer}" >
                    <div>  <input type="radio" name="correct" value="${answer.choice}" 
                                  <c:if test="${answer == answercorrect}" > checked="checked" </c:if> /><p><input type="text" name="newanswer${count}" value="${answer.choice}" required/></p></div>
                            <c:set var="count" value="${count + 1}" />
                        </c:forEach>
                <h3>
                    Status <select name="status">
                        <option <c:if test="${question.status}"> selected </c:if> >Avaliable</option>
                        <option <c:if test="${not question.status}"> selected </c:if> >Deleted</option>
                    </select>
                </h3>
                <input type="submit" value="Submit" />
            </form>
            <h3><a href="LoadAdminPage" class="Back-home"><i class="far fa-hand-point-left"></i> Back to Home</a></h3>
        </div>
    </body>
    <style>
        .headinformation {
            background-color: #008CBA;
            position: sticky;
            top: 0;
        }
        .headinformation h1 {
            margin-left: 15px;
            color: white;
            display: inline-block;
        }
        .welcome-and-login {
            display: inline-block;
            position: absolute;
            bottom: 27px;
            right: 15px;
            font-size: 20px;
        }
        .welcome-and-login i {
            color: white;
        }
        .welcome-and-login i:hover {
            color: #a6a6aa;
        }
        .container {
            font-size: 120%;
            color: black;
            border-style: double;
            border-color: #008CBA;
            margin: auto;
        }
        .container div {
            margin: 20px
        }
        .container div p {
            word-break: break-all;
            width: 95%;
            margin-left: 5px;
            display: inline-block
        }
        .container div input[type=radio] {
            vertical-align: top;
            margin-top: 29px;
            width: 2em;
            height: 2em
        }
        .container div input[type=text] {
            width: 95%;
            height: 2em;
            font-size: 20px;
            border-color: #008CBA;
        }
        .container h3 {
            margin-left: 15px;
            text-align: left;
            color: tomato;
        }
        .question-textbox {
            width: 84%;
            height: 2em;
            font-size: 20px;
            border-color: #008CBA;
            display: inline-block;
            margin: 14px;
        }
        .container select {
            border: 2px solid #008CBA;
            font-size: 25px;
            margin-left: 15px;
            text-align: left;
        }
        .container input[type=submit] {
            border: none;
            border-radius: 12px;
            display: inline-block;
            background-color: #008CBA;
            width: 50%;
            height: 50px;
            color: white;
            margin-top: 20px;
            margin-bottom: 20px;
            margin-left: 25%;
            margin-right: 25%;
            transition-duration: 0.4s;
            font-size: 20px;
            bottom: 20px;
            right: 20px;
        }
        .container input[type=submit]:hover {
            cursor: pointer;
            border: 2px solid #008CBA;
            background-color: white;
            color: black
        }
        .Back-home {
            margin-left: 15px;
            text-align: left;
            color: tomato;
            text-decoration: none;
        }
    </style>
</html>
