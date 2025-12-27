<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ATM</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

</head>
<body class="flex h-screen items-center justify-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
   
    <div class="w-[440px] rounded-2xl border border-[#c9a94d]/20 bg-[#111827]/60 p-8 shadow-xl backdrop-blur-xl">
      <h1 class="mb-8 text-center text-4xl font-extrabold tracking-wide text-[#d4af37]">ATM LOGIN</h1>

      <form class="flex flex-col items-center" action="login" method="POST">
        <table class="border-separate border-spacing-x-3 border-spacing-y-6">
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="CardNo">Card No:</label>
            </td>
            <td>
              <input class="w-66 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" type="text" id="CardNo" name="CardNo"   />
            </td>
          </tr>

          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="PIN">PIN:</label>
            </td>
            <td>
              <input class="w-66 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" type="password" name="PIN" id="PIN" />
            </td>
          </tr>

          <tr>
            <td></td>
            <td class="flex space-x-4">
              <button class="cursor-pointer rounded bg-[#d4af37] px-7.5 py-2 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522]" name="action" onclick="setRequired(true)" value="signin">SIGN IN</button>
              <button class="cursor-pointer rounded bg-[#374151] px-10 py-2 font-semibold text-white transition hover:bg-[#4b5563]"  name="action" onclick="setRequired(false)"  value="clear">CLEAR</button>
            </td>
          </tr>

          <tr>
            <td></td>
            <td>
              <button class="w-full cursor-pointer rounded border border-[#d4af37] bg-transparent py-2 font-semibold text-[#d4af37] transition hover:bg-[#d4af37] hover:text-black"  name="action" onclick="setRequired(false)"  value="signup">SIGN UP</button>
            </td>
          </tr>
        </table>
      </form>
    </div>

   <% 
   // Check for message in request (from forward)
   String message = (String) request.getAttribute("message");
   String messageType = (String) request.getAttribute("messageType");
   String redirectUrl = (String) request.getAttribute("redirect");

   if (message != null) {
   %>
   <div id="messageBox" 
        style="position: absolute;
               bottom: 20px;
               right: 20px;
               background: <%= "success".equals(messageType) ? "#4CAF50" : "#ff4d4d" %>;
               color: white;
               padding: 10px 20px;
               border-radius: 8px;
               box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
               font-weight: bold;
               opacity: 1;
               transition: opacity 1s ease;">
       <%= message %>
   </div>

   <script>
       setTimeout(() => {
           const messageBox = document.getElementById("messageBox");
           if (messageBox) {
               messageBox.style.opacity = "0";
               
               // If it's a success message with redirect, redirect after fade out
               <% if (redirectUrl != null) { %>
                   setTimeout(() => {
                       window.location.href = "<%= redirectUrl %>";
                   }, 1000); // Redirect 1 second after fade out starts
               <% } %>
           }
       }, 2000); // Show message for 2 seconds
   </script>
   <% } %>
     
    <script>
        function setRequired(state) {
            document.getElementById("CardNo").required = state;
            document.getElementById("PIN").required = state;
        }
        
        // Prevent form resubmission on page reload
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</body>
</html>