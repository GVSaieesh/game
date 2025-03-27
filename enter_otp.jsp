<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%
   String storedOTP = (String) session.getAttribute("otp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="newpass.html" method="post" onsubmit="return check()">
     <label>Enter otp:</label>
     <input type="text" name="otp1" id="otp1"><br><br>
     <button type="submit">submit</button>


    </form>
    <script>
        function check()
        {
            n1=document.getElementById("otp1").value;
            storedotp="<%=storedOTP%>";
            if (userOTP === storedOTP) {
                return true;  
            } else {
                alert("Invalid OTP. Please try again.");
                return false; 
            }
        }
    </script>
</body>
</html>