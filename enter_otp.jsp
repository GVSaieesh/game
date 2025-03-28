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
        <style>
       * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

body {
    background-image: url('images/dd.jpg');
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.menu {
    background: rgba(107, 5, 5, 0.47);
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
    text-align: center; /* Centers text and inline elements */
}

.logo {
    text-align: center;
    margin-bottom: 30px;
}

.marvel-logo {
    width: 200px;
    height: 200px;
    object-fit: cover;
    border-radius: 15px;
    transition: transform 0.3s ease;
}

.marvel-logo:hover {
    transform: scale(1.05);
}

h2 {
    color: #000000;
    margin-bottom: 20px;
    text-align: center;
    font-size: 24px;
}

label {
    font-size: 20px;
    font-weight: bold;
    display: block;
    margin: 15px 0;
    text-align: center;
}

input {
    display: block;
    margin: 0 auto; /* Center input */
    padding: 10px;
    height: 40px;
    width: 80%; /* Adjust width */
    border: 2px solid #eee;
    border-radius: 10px;
    font-size: 16px;
    transition: border-color 0.3s ease;
}

input:focus {
    outline: none;
    border-color: #495E57;
}

button {
    width: 80%; /* Matches input width */
    display: block;
    margin: 20px auto; /* Center button */
    padding: 15px;
    background: #495E57;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background: #F4CE14;
    color: #333;
}

@media (max-width: 480px) {
    .menu {
        padding: 20px;
    }

    .marvel-logo {
        width: 150px;
        height: 150px;
    }

    h2 {
        font-size: 20px;
    }

    input,
    button {
        width: 90%;
    }
}

    </style>
</head>
<body>
    <form action="newpass.html" method="post" onsubmit="return check()">
    
    <div class="menu">
    <img class="marvel-logo" src="images/Logo.png" alt="littlelemon" /> <br>
    <label style="font-size:20px;"><b>Enter otp:</label><b> <br>
     <input style="padding:10px; height:50px; width:300px;font-size:30px;" type="text" name="otp1" id="otp1"><br><br>
     <button type="submit">submit</button>

    </div>
     

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