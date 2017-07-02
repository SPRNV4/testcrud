<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Get User By Id</title>
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
        $(document).ready(function(){
          $("#get-user-button").click(function(){
            var records = [];
            var store = new Ext.data.ArrayStore({
              data: records,
              fields: ['id', 'name', 'lastName', 'age', 'sex']
            });

            var data = Ext.Ajax.request({
              method: 'POST',
              url: '${pageContext.request.contextPath}/getbyid',
              params: {
                id: $('#user-id').val()
              },
              success: function(response) {
                var res = Ext.decode(response.responseText, true);
                records.push({
                   id: res.id,
                   name: res.name,
                   lastName: res.lastName,
                   age: res.age,
                   sex: res.sex
                 });
                 store.loadData(records);
                }
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
                  editable: true
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

            $("#get-form").hide();
          });
        });
    </script>
</head>
<div class="container" id="helloWorldPanel" style="width:500; margin:0 auto;" >
    <div id="get-form" style="display: table; margin:0 auto;">
        <div style="display: table-row">
            <div style="display:table-cell;">
                <label for="text-id">
                    Id:
                </label>
            </div>
            <div id="text-id" style="display:table-cell;">
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
