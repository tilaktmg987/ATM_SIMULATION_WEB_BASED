<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Withdraw Options</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="min-h-screen flex justify-center items-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
<%
String Withdraw = (String) request.getAttribute("Withdraw");
%>
<!-- ATM Container -->
<div class="relative w-full max-w-[720px] h-screen bg-cover bg-center shadow-2xl border border-gray-700" 
     style="background-image: url('atm1.jpg');">
     <div class=" absolute top-[35%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] h-[260px] rounded-lg flex flex-col p-4 gap-20 text-white
<%= (Withdraw == null ? " hidden" : "") %> z-50">

   
   <% 
boolean isError = "Insufficient Balance".equals(Withdraw); 
%>

<h1 class="mt-6 text-[13.5px] font-semibold tracking-wide ml-2">
    <% if(!isError) { %>
        Withdraw was successfull:
        <br>
        <div class="text-xl text-green-600">Rs <%= Withdraw %></div>
    <% } else { %>
        Withdraw was not successfull:
        <br>
        <div class="text-xl text-red-500"><%= Withdraw %></div>
    <% } %>
</h1>

    <div class=" grid grid-cols-2 gap-1 gap-x-8 text-black w-full">
        <div></div>
       
        <form action="dashboard.jsp">
            <button class="ml-5 bg-[#D7DAE0] px-10 py-2 rounded font-semibold text-xs shadow hover:text-white hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer">
                Ok
            </button>
        </form>
    </div>

</div>

  <!-- Screen Overlay Box -->
  <div class="absolute top-[33%] left-[37.5%] -translate-x-1/2 
              w-[72%] max-w-[320px] h-[260px] 
              rounded-lg flex flex-col items-center p-4 pt-6 gap-8 text-white" <%= (Withdraw != null ? " hidden" : "") %>>

      <h1 class="text-[15px] font-semibold tracking-wide mb-2 mt-10 text-center">
          SELECT WITHDRAWL AMOUNT
      </h1>

<form action="${pageContext.request.contextPath}/fastcash" method="POST">



      <!-- Button Grid -->
      <div class="grid grid-cols-2 gap-y-1 gap-x-12 text-black w-full">

        <button name="amount" value="100"
            class="bg-[#D7DAE0]  py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 100
        </button>

        <button name="amount" value="500"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 500
        </button>

        <button name="amount" value="1000"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 1000
        </button>

        <button name="amount" value="2000"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 2000
        </button>

        <button name="amount" value="5000"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 5000
        </button>

        <button name="amount" value="10000"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            Rs. 10000
        </button>

        <!-- Empty left column -->
        <div></div>

        <button name="action" value="back"
            class="bg-[#D7DAE0] w-28 py-1 rounded font-semibold text-xs shadow 
                   hover:text-white hover:bg-gray-400 active:scale-95 transition cursor-pointer">
            BACK
        </button>

      </div>
</form>

  </div>

</div>

</body>
</html>
