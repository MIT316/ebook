<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.entity.BookDtls" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Ebook:index page</title>

<%@include file="all_component/allCss.jsp" %>

<style type="text/css">

/* Your CSS styles */

.navbar {

background-color: purple !important;

}

</style>

</head>

<body style="background-color:#f7f7f7;">
<%
User u=(User)session.getAttribute("userobj");
%>

<%@include file="all_component/navbar.jsp" %>

<div class="container-fluid back-img">

<h2 class="text-center text-danger">Ebook Management System</h2>

</div>

<!-- start recent book -->

<div class="container">

<h3 class="text-center">Recent Book</h3>

<div class="row">
<%
BookDAOImpl dao2=new BookDAOImpl(DBConnect.getConn());
List<BookDtls> list2=dao2.getRecentBook();
for(BookDtls b:list2)
{%>
	<div class="col-md-3">

<div class="card crd-ho">

<div class="card-body text-center">

<img alt="" src="book/<%= b.getPhotoName() %>"

style="width:150px; height:200px" class="img-thumblin">

<p><%=b.getBookName() %></p>

<p><%=b.getAuthor() %></p>

<p>
<%
if(b.getBookCategory().equals("Old")){
	%>
	Categories:<%=b.getBookCategory() %></p>
	<div class="row">
	<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-5">View Details</a><a
	
	href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
	
	</div>
	<%
}else{
	%>
	Categories:<%=b.getBookCategory() %></p>

<div class="row">

<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-danger btn-sm "><i class="fa-solid fa-cart-shopping"></i>Add Cart</a>

<a href="" class="btn btn-success btn-sm ml-1">View Details</a>

<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>

</div>
<% 
}

%>

</div>

</div>

</div>
<% }
%>

</div>

<div class="text-center mt-1">

<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>

</div>

</div>

<!-- end recent book -->

<hr>



<!-- start New book -->

<div class="container">

<h3 class="text-center">New Book</h3>

<div class="row">

<%

BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());

List<BookDtls> list = dao.getNewBook();

for (BookDtls b : list) {
%>
<div class="col-md-3">

<div class="card crd-ho">

<div class="card-body text-center">

<img alt="" src="book/<%= b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">

<p><%= b.getBookName() %></p>

<p><%= b.getAuthor() %></p>

<p>Categories: <%= b.getBookCategory() %></p>

<div class="row">

<%
if(u==null){
%>
<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>	
<% 
}else{
%>
<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %> %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>	
<% 
}
%>

<a href="view_books.jsp?bid=<%=b.getBookId() %>" 


 class="btn btn-success btn-sm ml-1">View Details</a>

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
<div class="text-center mt-1">

<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>

</div>

<!-- end New book -->



<hr>

<!-- start old book -->
<!-- start old book -->
<div class="container">
    <h3 class="text-center">Old Book</h3>
    <div class="row">
        <% 
        BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list3 = dao3.getOldBook();
        for (BookDtls b : list3) { // Use list3 instead of list2
        %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%= b.getPhotoName() %>" style="width:150px; height:200px" class="img-thumblin">
                    <p><%= b.getBookName() %></p>
                    <p><%= b.getAuthor() %></p>
                    <p><%= b.getBookCategory() %></p>
                    <div class="row">
                        <a href="" class="btn btn-success btn-sm ml-5">View Details</a>
                        <a href="" class="btn btn-danger btn-sm ml-1"><%= b.getPrice() %><i class="fa-solid fa-indian-rupee-sign"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <div class="text-center mt-1">
        <a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
    </div>
</div>
<!-- end old book -->






<!-- end old book -->

<%@include file="all_component/footer.jsp" %>

</body>

</html>