<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change PIN</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>

<body class="min-h-screen flex justify-center items-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">

<%
String status = (String) request.getAttribute("status");   // success / error msg
String statusColor = "text-red-400"; // Default to red for errors

// Check if status contains success message to change color to green
if (status != null && (status.contains("successfully") || status.contains("Success"))) {
    statusColor = "text-green-400";
}
%>

<!-- ATM Container -->
<div class="relative w-full max-w-[720px] h-screen bg-cover bg-center shadow-2xl" 
     style="background-image: url('atm1.jpg');">

    <!-- Success / Error Message -->
    <div class="absolute top-[35%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] 
                h-[260px] rounded-lg p-4 flex flex-col text-white
                <%= (status == null ? "hidden" : "") %>">

        <h1 class="text-[15px] font-semibold ml-2 <%= statusColor %>">
            <%= status %>
        </h1>

       <form action="dashboard.jsp" class=" mt-25 flex justify-end">
    <button class="bg-[#D7DAE0] px-8 py-2 rounded font-semibold text-xs 
                   text-black shadow hover:bg-gray-400 active:scale-95">
        OK
    </button>
</form>
    </div>

    <!-- PIN Change Form -->
    <div class="absolute top-[28%] left-[37.5%] -translate-x-1/2 w-[70%] max-w-[310px] 
                h-[260px] rounded-lg p-4 flex flex-col text-white
                <%= (status != null ? "hidden" : "") %>">


    <form action="${pageContext.request.contextPath}/ChangePin" method="POST" class="mt-10">

    <h1 class="text-[13.5px] font-semibold tracking-wide ml-2">New PIN:</h1>
    <input type="password" maxlength="4" name="newpin"
        class="ml-2 w-64 rounded border border-gray-500 bg-[#1f2937] p-2 
               text-white outline-none focus:ring-1 focus:ring-gray-300" />

    <h1 class="text-[13.5px] mt-2 font-semibold tracking-wide ml-2">Re-Enter New PIN:</h1>
    <input type="password" maxlength="4" name="renewpin"
        class="ml-2 w-64 rounded border border-gray-500 bg-[#1f2937] p-2 
               text-white outline-none focus:ring-1 focus:ring-gray-300" />

    <div class="grid grid-cols-2 gap-x-10 text-black mt-9">
        <button class="ml-2 bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow 
                       hover:bg-gray-400 active:scale-95  cursor-pointer"
                name="action" value="change">
            CHANGE
        </button>

        <button class="bg-[#D7DAE0] px-4 py-2 rounded font-semibold text-xs shadow 
                       hover:bg-gray-400 active:scale-95  cursor-pointer"
                name="action" value="back">
            BACK
        </button>
    </div>
</form>


    </div>

</div>

</body>
</html>