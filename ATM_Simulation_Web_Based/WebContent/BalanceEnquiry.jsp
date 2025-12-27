<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Balance</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="min-h-screen flex justify-center items-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
<%
String balance = (String) request.getAttribute("balance");
%>
<div class="relative w-full max-w-[720px] h-screen bg-cover bg-center shadow-2xl border border-gray-700" style="background-image: url('atm1.jpg');">
    <div class="absolute top-[35%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] h-[260px] rounded-lg flex flex-col p-4 gap-20 text-white">
        <h1 class="mt-6 text-[13.5px] font-semibold tracking-wide ml-2">
            Your Current Account Balance is: 
            <div class="text-xl text-green-600">
                Rs <%= balance %>
            </div>
        </h1>
        <form action="dashboard.jsp" class="mt-25 flex justify-end" method="post">
            <button class="bg-[#D7DAE0] px-8 py-2 rounded font-semibold text-xs 
                       text-black shadow hover:bg-gray-400 active:scale-95 transition duration-200">
                OK
            </button>
        </form>
    </div>
</div>
</body>
</html>