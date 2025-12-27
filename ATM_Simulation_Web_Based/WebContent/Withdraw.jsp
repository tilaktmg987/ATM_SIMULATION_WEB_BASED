<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Withdraw Amount</title>
 <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="min-h-screen flex justify-center items-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
<%
String Withdraw = (String) request.getAttribute("Withdraw");
%>

<!-- ATM Container -->
<div class="relative w-full max-w-[720px] h-screen bg-cover bg-center shadow-2xl border border-gray-700" style="background-image: url('atm1.jpg');">

<div 
class=" absolute top-[35%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] h-[260px] rounded-lg flex flex-col p-4 gap-20 text-white
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
  <div class="absolute top-[35%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] h-[260px] rounded-lg flex flex-col p-4 gap-2 text-white
<%= (Withdraw != null ? " hidden" : "") %>">
   
    <h1 class="text-[13.5px] font-semibold tracking-wide ml-2">Withdraw:</h1>

  <form action="Withdraw" method="POST">

    
        <input type="number" name="amount" min="1" step="1" placeholder="Enter amount"
        class="mb-17 ml-2 w-66 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-1 focus:ring-gray-400" />

        <div class="grid grid-cols-2 gap-1 gap-x-8 text-black w-full">
            <div></div>
            <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer"
                name="action" value="withdraw">Withdraw</button>

            <div></div>
            <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow hover:text-white hover:bg-gray-400 active:bg-gray-400 active:scale-95 transition cursor-pointer"
                name="action" value="back">Back</button>
        </div>
    </form>
</div>

  </div>
</div>

</body>
</html>