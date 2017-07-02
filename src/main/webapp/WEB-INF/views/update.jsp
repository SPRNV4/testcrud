<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update User</title>
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
        $("#get-user-button").click(function () {
          $.ajax({
            url: "/getbyid",
            data: {
              id: $("#user-id").val()
            },
            dataType: 'json',
            method: "POST",
            success: function(data){
              $("#update-form").show();
              $("#get-form").hide();
              $("#name").val(data["name"]);
              $("#lastname").val(data["lastName"]);
              $("#age").val(data["age"]);
              $("#sex").val(data["sex"]);
            },
            error: function(){
              alert("Wrong id!")
            }
          });
        });
        $("#update-button").click(function () {
          $.ajax({
            url: "/updateuser",
            data: {
              id: $("#user-id").val(),
              name:  $("#name").val(),
              lastName:  $("#lastname").val(),
              age: $("#age").val(),
              sex: $("#sex").val()
            },
            dataType: 'json',
            method: "POST"
          });
        });
      });
    </script>
</head>
<body>
<div id="get-form" style="display: table; margin:0 auto;">
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-id">
                Id:
            </label>
        </div>
        <div id="text-id"style="display:table-cell;">
            <textarea id="user-id" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <button id="get-user-button"> Get User! </button>
        </div>
    </div>
</div>
<div id="update-form" style="display: table; margin:0 auto; display: none;" >
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-name">
                Name:
            </label>
        </div>
        <div id="text-name" style="display:table-cell;">
            <textarea id="name" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-lastname">
                Lastname:
            </label>
        </div>
        <div id="text-lastname" style="display:table-cell;">
            <textarea id="lastname" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-age">
                Age:
            </label>
        </div>
        <div id="text-age" style="display:table-cell;">
            <textarea id="age" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <label for="text-sex">
                Sex:
            </label>
        </div>
        <div id="text-sex" style="display:table-cell;">
            <textarea id="sex" style="resize: none" rows="1" cols="20" >

            </textarea>
        </div>
    </div>
    <div style="display: table-row">
        <div style="display:table-cell;">
            <button id="update-button" >Update User!</button>
        </div>
    </div>
</div>
<div id="links">
    <a href="${pageContext.request.contextPath}/users"> All users</a>
    <a href="${pageContext.request.contextPath}/getuser"> Get user by ID</a>
    <a href="${pageContext.request.contextPath}/create">Add user</a>
    <a href="${pageContext.request.contextPath}/update"> Update user</a>
    <a href="${pageContext.request.contextPath}/delete"> Remove user</a>
</div>
</body>
</html>
