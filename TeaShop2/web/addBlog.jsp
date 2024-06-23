<%-- 
    Document   : addBlog
    Created on : Jun 20, 2024, 9:42:38 PM
    Author     : ADMIN
--%>
<%-- 
    Document   : AddBlog
    Created on : Mar 27, 2024, 8:52:25 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog Form</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
    }

    form {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"],
    textarea,
    select {
        width: calc(100% - 22px); /* Adjusted width to accommodate padding */
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 15px;
    }

    input[type="submit"],
    input[type="reset"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #0056b3;
    }

    a {
        color: #007bff;
        text-decoration: none;
    }
    
    .center {
        text-align: center;
        margin-top: 20px; /* Adjust as needed */
    }
    document.querySelector('form').addEventListener('submit', function(event) {
    var categoryID = document.getElementById('categoryID').value;
    if (!categoryID) {
        alert('Please select a category.');
        event.preventDefault();
    }
});

</style>

</head>
<body>
 
    <form method="post" action="addblog" enctype="multipart/form-data">
        <label for="category">Category:</label>
        <select id="category" name="categoryID">
            <option  value="1">Product Reviews</option>
            <option value="2">Sale</option>
            <option value="3">Prize</option>
            <option value="4">Other</option>
        </select>

        <label>Image:</label>
        <input type="file" id="image" name="image" size="60" required>
        
        <label>Title:</label>
        <input type="text" id="title" name="title" required>

        <label>Content:</label>
        <textarea id="content" name="content" required></textarea>
        
        <input type="submit" value="Submit">
        <input type="reset" value="Cancel">
    </form>
  
    <div class="center">
        <a href="blog">Back to blog page</a>
    </div>
    
</body>
</html>

