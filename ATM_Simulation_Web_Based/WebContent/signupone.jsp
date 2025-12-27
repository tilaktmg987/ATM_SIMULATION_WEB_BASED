<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<title>Personal Detail Section</title>
</head>
<body class="flex items-center justify-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
    <div class=" mt-10 mb-10 w-[700px] h-[880px] rounded-2xl border border-[#c9a94d]/20 bg-[#111827]/60 p-8 shadow-xl backdrop-blur-xl">
      <h1 class="mb-2 text-center text-4xl font-extrabold tracking-wide text-[#d4af37]">APPLICATION FORM NO. ${sessionScope.formNumber}
</h1>
      <h2 class="mb-5 text-center text-xl font-extrabold tracking-wide text-[#d4af37]">Page 1: Personal Details</h2>

     <form class="flex flex-col items-center justify-center" action="signupone" method="POST" id="personalForm">
  <table class="border-separate border-spacing-x-6 border-spacing-y-6">
    <!-- Name -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="name">Name:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="name" name="name" />
      </td>
    </tr>

    <!-- Father's Name -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="fname">Father's Name:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="fname" name="fname" />
      </td>
    </tr>

    <!-- Date of Birth -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="dob">Date of Birth:</label>
      </td>
      <td>
        <input required type="date" id="dob" name="dob" 
               class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37] [&::-webkit-calendar-picker-indicator]:invert" />
      </td>
    </tr>

    <!-- Gender -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200">Gender:</label>
      </td>
      <td>
        <div class="space-x-6">
          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="gender" value="male" class="h-5 w-5 accent-[#d4af37]" />
            Male
          </label>

          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="gender" value="female" class="h-5 w-5 accent-[#d4af37]" />
            Female
          </label>

          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="gender" value="other" class="h-5 w-5 accent-[#d4af37]" />
            Other
          </label>
        </div>
      </td>
    </tr>

    <!-- Email -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="email">Email:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="email" id="email" name="email" />
      </td>
    </tr>

    <!-- Marital Status -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200">Marital Status:</label>
      </td>
      <td>
        <div class="space-x-6">
          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="maritalStatus" value="married" class="h-5 w-5 accent-[#d4af37]" />
            Married
          </label>

          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="maritalStatus" value="unmarried" class="h-5 w-5 accent-[#d4af37]" />
            Unmarried
          </label>

          <label class="text-lg font-semibold text-gray-200">
            <input required type="radio" name="maritalStatus" value="other" class="h-5 w-5 accent-[#d4af37]" />
            Other
          </label>
        </div>
      </td>
    </tr>

    <!-- Address -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="address">Address:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="address" name="address" />
      </td>
    </tr>

    <!-- City -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="city">City:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="city" name="city" />
      </td>
    </tr>

    <!-- State -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="state">State:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="state" name="state" />
      </td>
    </tr>

    <!-- PIN Code -->
    <tr>
      <td>
        <label class="text-lg font-semibold text-gray-200" for="pinCode">PIN Code:</label>
      </td>
      <td>
        <input required class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" 
               type="text" id="pinCode" name="pinCode" maxlength="4" pattern="[0-9]{4}" title="Please enter a valid 4-digit PIN code" />
      </td>
    </tr>

    <!-- Buttons -->
   <tr>
  <td colspan="2">
    <div class="flex w-115 items-center justify-between pt-4">
      <!-- Back -->
      <button type="submit" class="cursor-pointer rounded bg-[#d4af37] px-7 py-2 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522]" 
              name="action" value="back" onclick="disableValidation()">Back</button>

      <!-- Next -->
      <button type="submit" class="cursor-pointer rounded bg-[#d4af37] px-7 py-2 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522]" 
              name="action" value="next">Next</button>
    </div>
  </td>
</tr>

  </table>
</form>

    </div>
     <script>
        function disableValidation() {
            // Remove required attributes when going back
            const form = document.getElementById('personalForm');
            const inputs = form.querySelectorAll('[required]');
            inputs.forEach(input => {
                input.removeAttribute('required');
            });
            
            // Also remove pattern validation for PIN code
            const pinCode = document.getElementById('pinCode');
            if (pinCode) {
                pinCode.removeAttribute('pattern');
            }
        }
     </script>
  </body>
</html>