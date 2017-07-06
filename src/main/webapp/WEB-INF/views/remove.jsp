<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove User</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
    <style>
        #links {
            position:absolute;
            width:100%;
            bottom:0;
            text-align:center;
        }
    </style>
    <script>
      $( document ).ready(function() {
        $("#remove-bitton").click(function () {
          $.ajax({
            url: "/removeuser",
            data: {
              id: $("#user-id").val()
            },
            dataType: 'json',
            method: "POST"
          });
        });
      });
    </script>
</head>
<body>
<div style="display: table; margin:0 auto;">
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-name">
                Id:
            </label>
        </div>
        <div id="text-name" style="display:table-cell;">
            <textarea id="user-id" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <button id="remove-bitton"> Remove! </button>
        </div>
    </div>
</div>
<div id="links" style="">
    <a href="${pageContext.request.contextPath}/users"> All users</a>
    <a href="${pageContext.request.contextPath}/getuser"> Get user by ID</a>
    <a href="${pageContext.request.contextPath}/create">Add user</a>
    <a href="${pageContext.request.contextPath}/update"> Update user</a>
    <a href="${pageContext.request.contextPath}/delete"> Remove user</a>
</div>
</body>
</html>
