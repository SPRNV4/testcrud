<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Users</title>
    <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script><script type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webjars/extjs/4.2.0/resources/css/ext-all.css" rel="stylesheet"/>
    <script src="${pageContext.request.contextPath}/webjars/extjs/4.2.0/ext-all.js" type="text/javascript"></script>
    <%--<link href="${pageContext.request.contextPath}/webjars/extjs/3.4.0/resources/css/ext-all.css" rel="stylesheet"/>--%>
    <%--<script src="${pageContext.request.contextPath}/webjars/extjs/3.4.0/ext-all.js" type="text/javascript"></script>--%>
    <style>
        #links {
            position:absolute;
            width:100%;
            bottom:0;
            text-align:center;
        }
    </style>
    <script>
      Ext.onReady(function(){
        var store = new Ext.data.ArrayStore({
          autoLoad: true,
          proxy: {
            type: 'rest',
            url: '${pageContext.request.contextPath}/getusers',
            reader: {
              type: 'json'
            }
          },
          fields: ['id', 'name', 'lastName', 'age', 'sex']
        });

        Ext.create('Ext.grid.Panel', {
          store: store,
          frame: true,
          columns: [
            {
              text     : 'id',
              dataIndex: 'id'
            },
            {
              text     : 'Name',
              dataIndex: 'name',
            },
            {
              text     : 'lastname',
              dataIndex: 'lastName'
            },
            {
              text     : 'age',
              dataIndex: 'age'
            },
            {
              text     : 'sex',
              dataIndex: 'sex'
            }
          ],
          height: 350,
          width: 500,
          title: 'Users Table',
          renderTo: 'helloWorldPanel'
        });
      });
    </script>
</head>
<body>
<div class="container" id="helloWorldPanel" style="width:500; margin:0 auto;" >
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
