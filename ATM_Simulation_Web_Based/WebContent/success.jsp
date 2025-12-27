<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Account Created Successfully</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="flex h-screen items-center justify-center bg-gradient-to-br from-[#0a0f1c] to-[#1b2333]">
   
    <!-- Success Modal -->
    <div class="fixed inset-0 bg-black/60 flex items-center justify-center z-50 backdrop-blur-sm">
        <div class="w-[440px] rounded-2xl border border-[#c9a94d]/20 bg-[#111827]/90 p-8 shadow-xl backdrop-blur-xl">
            <!-- Success Icon -->
            <div class="flex justify-center mb-6">
                <div class="w-20 h-20 rounded-full bg-gradient-to-br from-[#d4af37] to-[#f7ef8a] flex items-center justify-center shadow-lg">
                    <svg class="w-10 h-10 text-[#0a0f1c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7"></path>
                    </svg>
                </div>
            </div>

            <!-- Title -->
            <h1 class="mb-6 text-center text-3xl font-extrabold tracking-wide text-[#d4af37]">
                Account Created!
            </h1>

            <!-- Card Number -->
            <div class="mb-4">
                <label class="text-lg font-semibold text-gray-200 block mb-2">Card Number:</label>
                <div class="w-full rounded border border-[#d4af37]/30 bg-[#1f2937] p-3 text-white font-mono text-center tracking-wider text-lg">
                    <%= request.getAttribute("cardNumber") %>
                </div>
            </div>

            <!-- PIN -->
            <div class="mb-6">
                <label class="text-lg font-semibold text-gray-200 block mb-2">PIN:</label>
                <div class="w-full rounded border border-[#d4af37]/30 bg-[#1f2937] p-3 text-white font-mono text-center tracking-wider text-lg">
                    <%= request.getAttribute("pinNumber") %>
                </div>
            </div>

            <!-- Important Note -->
            <div class="mb-6 p-3 border border-[#e74c3c]/30 bg-[#2d1b1b]/50 rounded-lg">
                <p class="text-sm text-[#e74c3c] font-semibold text-center">
                    &#9888 Save this information securely! Do not share with anyone.
                </p>
            </div>

            <!-- Continue Button -->
            <div class="flex justify-center">
                <button onclick="redirectToLogin()" 
                        class="cursor-pointer rounded bg-[#d4af37] px-12 py-3 font-bold text-black transition hover:bg-[#c09a2e] active:bg-[#a88522] text-lg">
                    Continue to Login
                </button>
            </div>
        </div>
    </div>

    <script>
        function redirectToLogin() {
            window.location.href = 'login.jsp';
        }
        
        // Close modal when clicking outside
        document.addEventListener('click', function(event) {
            if (event.target.classList.contains('bg-black/60')) {
                redirectToLogin();
            }
        });
        
        // Optional: Close with Escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                redirectToLogin();
            }
        });
        
        // Prevent form resubmission on page reload
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
    </script>
</body>
</html>