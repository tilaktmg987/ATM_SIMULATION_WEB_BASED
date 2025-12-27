<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="min-h-screen flex justify-center items-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">

<!-- ATM Container -->
<div class="relative w-full max-w-[720px] h-screen bg-cover bg-center shadow-2xl border border-gray-700" style="background-image: url('atm1.jpg');">

  <!-- Screen Overlay Box -->
  <div class="absolute top-[33%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] h-[260px] rounded-lg flex flex-col items-center p-4 gap-11 text-white">
   
      <h1 class="text-base font-semibold tracking-wide  mt-4 text-center">Please select your Transaction</h1>
<form action="${pageContext.request.contextPath}/dashboard" method="POST">
      <div class="grid grid-cols-2 gap-1 gap-x-8 text-black w-full">
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer" name="action" value="deposit">Deposit</button>
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow  hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer" name="action" value="withdraw">Cash Withdraw</button>
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer" name="action" value="fastcash">Fash Cash</button>
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer"  name="action" value="miniStatement">Mini Statement</button>
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer" name="action" value="pinchange">Pin Change</button>
        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer " name="action" value="balanceenquiry">Balance Enquiry</button>
        <div></div>
        <button class=" bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white  hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer"  name="action" value="exit">Exit</button>
      </div>
      </form>
  </div>
  </div>
</div>
   <% 
      String message = (String) request.getAttribute("message");
      String messageType = (String) request.getAttribute("messageType");
      String redirectUrl = (String) request.getAttribute("redirect");

      if (message != null) {
   %>

   <div id="messageBox" 
        class="absolute bottom-5 right-5 px-4 py-2 rounded-lg shadow-lg font-semibold"
        style="z-index:9999;  background: <%= "success".equals(messageType) ? "#4CAF50" : "#ff4d4d" %>;
               color: white;">
       <%= message %>
   </div>

   <script>
       setTimeout(() => {
           let msg = document.getElementById("messageBox");
           if (msg) {
               msg.style.opacity = "0";
           }

           <% if (redirectUrl != null) { %>
           setTimeout(() => {
               window.location.href = "<%= redirectUrl %>";
           }, 1200);
           <% } %>

       }, 2000);
   </script>

   <% } %>

     
     
    

    
     
</body>
</html>