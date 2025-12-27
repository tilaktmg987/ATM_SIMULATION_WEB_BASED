<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>


</head>
<body class="flex items-center justify-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
    <div class="mt-10 mb-10 h-[720px] w-[660px] rounded-2xl border border-[#c9a94d]/20 bg-[#111827]/60 p-8 shadow-xl backdrop-blur-xl">
      <h2 class="mt-5 mb-5 text-center text-xl font-extrabold tracking-wide text-[#d4af37]">Page 3: Account Details</h2>

      <form class="flex flex-col items-center justify-center" action="signupthree" method="POST">
        <table class="border-separate border-spacing-x-10 border-spacing-y-5">
          <!-- ACCOUNT TYPE -->
          <tr>
            <td colspan="2">
              <label class="text-2xl font-semibold text-gray-200">Account Type:</label>
            </td>
          </tr>

          <tr class="space-x-6">
            <td class="flex flex-col space-y-2">
              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input required type="radio" name="AccountType" value="savingaccount" class="h-3 w-3 accent-[#d4af37]" />
                Saving Account
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input required type="radio" name="AccountType" value="currentaccount" class="h-3 w-3 accent-[#d4af37]" />
                Current Account
              </label>
            </td>

            <td class="space-y-2">
              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input required type="radio" name="AccountType" value="fixeddepositaccount" class="h-3 w-3 accent-[#d4af37]" />
                Fixed Deposit Account
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input required type="radio" name="AccountType" value="recurringdepositaccount" class="h-3 w-3 accent-[#d4af37]" />
                Recurring Deposit Account
              </label>
            </td>
          </tr>

          <!-- CARD NUMBER -->
          <tr>
            <td>
              <label class="text-2xl font-semibold text-gray-200">
                Card Number <br />
                <div class="text-sm">Your 16 Digit Card Number</div>
              </label>
            </td>
            <td>
              <div class="text-2xl font-semibold text-gray-200">XXXX-XXXX-XXXX-4184</div>
            </td>
          </tr>

          <!-- PIN -->
          <tr>
            <td>
              <label class="text-2xl font-semibold text-gray-200">
                PIN <br />
                <div class="text-sm">Your 4 Digit Password</div>
              </label>
            </td>
            <td>
              <div class="text-2xl font-semibold text-gray-200">XXXX</div>
            </td>
          </tr>

          <!-- SERVICE REQUIRED -->
          <tr>
            <td colspan="2">
              <label class="text-2xl font-semibold text-gray-200">Service Required:</label>
            </td>
          </tr>

          <tr class="space-x-6">
            <td class="flex flex-col space-y-2">
              <!-- Only 1st checkbox of group must have required -->
              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input required type="checkbox" name="ServiceRequired" value="atmcard" class="h-3 w-3 accent-[#d4af37]" />
                ATM Card
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input type="checkbox" name="ServiceRequired" value="mobilebanking" class="h-3 w-3 accent-[#d4af37]" />
                Mobile Banking
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input type="checkbox" name="ServiceRequired" value="chequebook" class="h-3 w-3 accent-[#d4af37]" />
                Cheque Book
              </label>
            </td>

            <td class="space-y-2">
              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input type="checkbox" name="ServiceRequired" value="internetbanking" class="h-3 w-3 accent-[#d4af37]" />
                Internet Banking
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input type="checkbox" name="ServiceRequired" value="emailsms" class="h-3 w-3 accent-[#d4af37]" />
                EMAIL & SMS Alerts
              </label>

              <label class="flex items-center gap-3 text-sm font-semibold text-gray-200">
                <input type="checkbox" name="ServiceRequired" value="estatement" class="h-3 w-3 accent-[#d4af37]" />
                E-Statement
              </label>
            </td>
          </tr>

          <!-- DECLARATION -->
          <tr>
            <td colspan="2" class="pt-6">
              <label class="flex items-center gap-3 text-[11.5px] font-semibold text-gray-200">
                <input required type="checkbox" class="h-4 w-4 accent-[#d4af37]" />
                I hereby declare that above entered details are correct to the best of my knowledge
              </label>
            </td>
          </tr>

          <!-- BUTTONS -->
          <tr>
            <td colspan="2">
              <div class="flex items-center justify-between pt-4">
                <button type="submit" class="cursor-pointer rounded bg-[#d4af37] px-7 py-2 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522]">Submit</button>

                <button 
  type="button"
  onclick="openCancelPopup()"
  class="cursor-pointer rounded bg-[#374151] px-10 py-2 font-semibold text-white transition hover:bg-[#4b5563]">
  Cancel
</button>

              </div>
            </td>
          </tr>
        </table>
      </form>
      <!-- CANCEL CONFIRM POPUP -->
<div id="cancelPopup"
     class="hidden fixed inset-0 flex items-center justify-center bg-black/50">
  
  <div class="bg-[#1f2937] px-8 py-6 rounded-xl shadow-xl border border-[#d4af37]/30">

    <h2 class="text-lg font-bold text-gray-200 mb-4">
      Are you sure you want to cancel?
    </h2>

    <div class="flex justify-between space-x-4">
      <button 
        onclick="confirmCancel()"
        class="bg-[#d4af37] text-black font-semibold px-6 py-2 rounded hover:bg-[#c09a2e]">
        Confirm Cancel
      </button>

      <button 
        onclick="closeCancelPopup()"
        class="bg-gray-600 text-white font-semibold px-6 py-2 rounded hover:bg-gray-700">
        Close
      </button>
    </div>

  </div>
</div>
      
      
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
  function openCancelPopup() {
    document.getElementById("cancelPopup").classList.remove("hidden");
  }

  function closeCancelPopup() {
    document.getElementById("cancelPopup").classList.add("hidden");
  }

  function confirmCancel() {
    window.location.href = "login.jsp";  // cancel garda pathaune page
  }
</script>
    
    
  </body>
</html>