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
    <div class="mt-10 mb-10 h-[805px] w-[680px] rounded-2xl border border-[#c9a94d]/20 bg-[#111827]/60 p-8 shadow-xl backdrop-blur-xl">
      <h2 class="mt-5 mb-5 text-center text-xl font-extrabold tracking-wide text-[#d4af37]">Page 2: Additional Details</h2>

      <form class="flex flex-col items-center justify-center" action="signuptwo" method="POST">
        <table class="border-separate border-spacing-x-6 border-spacing-y-6">
          <!-- Religion -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Religion">Religion:</label>
            </td>
            <td>
              <select required name="Religion" id="Religion" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]">
                <option value="Hindu">Hindu</option>
                <option value="Muslim">Muslim</option>
                <option value="Christian">Christian</option>
                <option value="Buddhist">Buddhist</option>
                <option value="Other">Other</option>
              </select>
            </td>
          </tr>

          <!-- Category -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Category">Category:</label>
            </td>
            <td>
              <select required name="Category" id="Category" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]">
                <option value="General">General</option>
                <option value="OBC">OBC</option>
                <option value="ST">ST</option>
                <option value="SC">SC</option>
                <option value="Other">Other</option>
              </select>
            </td>
          </tr>

          <!-- Income -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Income">Income:</label>
            </td>
            <td>
              <select required name="Income" id="Income" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]">
                <option value="Null">Null</option>
                <option value="1,50,000">&lt;1,50,000</option>
                <option value="2,50,000">&lt;2,50,000</option>
                <option value="5,00,000">&lt;5,00,000</option>
                <option value="10,00,000">Upto 10,00,000</option>
              </select>
            </td>
          </tr>

          <!-- Educational Qualification -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Educational"
                >Educational <br />
                Qualification:</label
              >
            </td>
            <td>
              <select required name="Educational" id="Educational" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]">
                <option value="Non_Graduation">Non-Graduation</option>
                <option value="Graduate">Graduate</option>
                <option value="Post_Graduation">Post Graduation</option>
                <option value="Doctrate">Doctrate</option>
                <option value="Others">Others</option>
              </select>
            </td>
          </tr>

          <!-- Occupation -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Occupation">Occupation:</label>
            </td>
            <td>
              <select required name="Occupation" id="Occupation" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]">
                <option value="Salaried">Salaried</option>
                <option value="Self_Employed">Self-Employed</option>
                <option value="Business">Business</option>
                <option value="Student">Student</option>
                <option value="Retired">Retired</option>
                <option value="Others">Others</option>
              </select>
            </td>
          </tr>

          <!-- PAN Number -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="PAN">PAN Number:</label>
            </td>
            <td>
              <input required name="PAN" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" type="text" id="PAN" pattern="[0-9]{9}" title="PAN number must be 9 digits" />
            </td>
          </tr>

          <!-- Citizenship No -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="Citizenship">Citizenship No :</label>
            </td>
            <td>
              <input required name="Citizenship" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" type="text" id="Citizenship" pattern="[0-9]{6,12}" title="Citizenship number must be between 6 to 12 digits" />
            </td>
          </tr>

          <!-- National ID -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200" for="National">National ID:</label>
            </td>
            <td>
              <input required name="National" class="w-80 rounded border border-[#d4af37]/30 bg-[#1f2937] p-2 text-white placeholder-gray-400 outline-none focus:ring-2 focus:ring-[#d4af37]" type="text" id="National" pattern="[0-9]{13,17}" title="National ID must be between 13 to 17 digits" />
            </td>
          </tr>

          <!-- Existing Account -->
          <tr>
            <td>
              <label class="text-lg font-semibold text-gray-200">Existing Account:</label>
            </td>
            <td>
              <div class="space-x-6">
                <label class="text-lg font-semibold text-gray-200">
                  <input required type="radio" name="Existing_acc" value="id" id="yes" class="h-5 w-5 accent-[#d4af37]" />
                  Yes
                </label>

                <label class="text-lg font-semibold text-gray-200">
                  <input required type="radio" name="Existing_acc" value="id" id="no" class="h-5 w-5 accent-[#d4af37]" />
                  No
                </label>
              </div>
            </td>
          </tr>

          <!-- Buttons -->
          <tr>
            <td colspan="2">
              <div class="flex w-120">
                <!-- Next -->
                <button type="submit" class="ml-auto cursor-pointer rounded bg-[#d4af37] px-7 py-2 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522]">Next</button>
              </div>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>