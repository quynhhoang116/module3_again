<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 03/13/2023
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .table {
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            border-collapse: collapse;
            border: 1px solid black;
            width: 100%;
        }

        .table, th {
            border: 1px solid #868585;
        }

        th {
            text-align: center;
            padding: 10px;
        }

        .table tr:nth-child(odd) {
            background-color: #eee;
        }

        .table tr:nth-child(even) {
            background-color: white;
        }

        h1 {
            margin-top: 100px;
            margin-bottom: 50px;
            text-align: center;
            color: #2c2972;
            font-weight: bolder;
            font-family: Bahnschrift;
            font-size: 30px;
        }

        td {
            border: 1px solid;
        }
    </style>
</head>
<body>
<a class="btn btn-primary" href="/books?action=create">Create new book</a>
<h1> Books List</h1>
<table class="table" style="width: 600px">
    <thead>
    <tr style="background: #c49ca6">
        <th>ID</th>
        <th>Title</th>
        <th>Page size</th>
        <th>Author</th>
        <th>Category</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="books" items="${booksList}">
        <tr>
            <td>${books.id}</td>
            <td>${books.title}</td>
            <td>${books.pageSize}</td>
            <td>${books.author}</td>
            <td>${books.category.nameCategory}</td>
            <td>
                <button type="button" onclick="deleteInfo('${books.id}')"
                        class="btn btn-danger"
                        data-toggle="modal" data-target="#exampleModal">
                    <i class="fas fa-trash-alt"></i>
                </button>
                <a href="/books?action=edit&id=${books.id}" class="btn btn-primary"><i
                        class="fas fa-edit"></i></a>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>

<%-- modal xo??a --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="color: red">Delete book</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="/books?action=delete" method="get">
                <div class="modal-body">
                    <input type="hidden" name="action" value="delete">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    Are you sure?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
                    <button type="submit" class="btn btn-danger">Yes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
