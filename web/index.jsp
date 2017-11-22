<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <title>Online shop</title>
    <script>
        window.onload = function () {
            urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('do') != null) {
                if (!urlParams.get('do').localeCompare('register')) {
                    var $registerForm = $(
                        '<form action="/authorize?method=register" method="post">' +
                        '<table>' +
                        '<tr>' +
                        '<td>Login: </td>' +
                        '<td><input type="text" name="login" /></td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td>Password: </td>' +
                        '<td><input type="password" name="password" /></td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td><input type="submit" value="Register" /></td>' +
                        '</tr>' +
                        '</table>' +
                        '</form>');
                    $('#form').append($registerForm);
                }
                else if(!urlParams.get('do').localeCompare('auth')) {
                    var $authForm = $(
                        '<form action="/authorize?method=authorize" method="post">' +
                        '<table>' +
                        '<tr>' +
                        '<td>Login: </td>' +
                        '<td><input type="text" name="login" /></td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td>Password: </td>' +
                        '<td><input type="password" name="password" /></td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td><input type="submit" value="Login" /></td>' +
                        '</tr>' +
                        '<tr>' +
                        '<td><a href="index.jsp?do=register">Registration</a></td>' +
                        '</tr>' +
                        '</table>' +
                        '</form>');
                    $('#form').append($authForm);
                }
            }
            else {
                var $authForm = $(
                    '<form action="/authorize?method=authorize" method="post">' +
                    '<table>' +
                    '<tr>' +
                    '<td>Login: </td>' +
                    '<td><input type="text" name="login" /></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td>Password: </td>' +
                    '<td><input type="password" name="password" /></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td><input type="submit" value="Login" /></td>' +
                    '</tr>' +
                    '<tr>' +
                    '<td><a href="index.jsp?do=register">Registration</a></td>' +
                    '</tr>' +
                    '</table>' +
                    '</form>');
                $('#form').append($authForm);
            }
            if (urlParams.get('error') != null) {
                var errorMsg;
                if (!urlParams.get('error').localeCompare('bad_data')) {
                    errorMsg = "Enter valid data.";
                }
                else if(!urlParams.get('error').localeCompare('login_fail')) {
                    errorMsg = "Incorrect login or password.";
                }
                else if(!urlParams.get('error').localeCompare('user_exists')) {
                    errorMsg = "User is already exists.";
                }
                $('#errorMsg').append(errorMsg);
            }
        }
    </script>
</head>
<body>
<div id="errorMsg" style="color: red"></div>
<div id="form"></div>
<!--
<form action="/shopmain" method="post">
  <table>
    <tr>
      <td>Login: </td>
      <td><input type="text" name="login" /></td>
    </tr>
    <tr>
      <td>Password: </td>
      <td><input type="password" name="password" /></td>
    </tr>
    <tr>
      <td><input type="submit" value="Login" /></td>
    </tr>
    <tr>
      <td><a href="index.jsp?do=register">Registration</a></td>
    </tr>
  </table>
</form>
-->
</body>
</html>
