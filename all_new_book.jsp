<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="all_component/allCss.jsp" %>
<style type="text/css">

/* Your CSS styles */

.navbar {

background-color: purple !important;

}

</style>

</head>
<body>
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid">

<div class="row p-3">

<%

BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

List<BookDtls> list = dao.getAllNewBook();

for (BookDtls b : list) {



%>

<div class="col-md-3">

<div class="card crd-ho">

<div class="card-body text-center">

<img alt="" src="book/<%= b.getPhotoName() %>" style="width:100px; height:150px" class="img-thumblin">

<p><%= b.getBookName() %></p>

<p><%= b.getAuthor() %></p>

<p>Categories: <%= b.getBookCategory() %></p>

<div class="row">

<a href="" class="btn btn-danger btn-sm"><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

<a href="" class="btn btn-success btn-sm ml-1">View Details</a>

<a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>

</div>

</div>

</div>

<%
}
%>

</div>

</div>

</body>


</html>