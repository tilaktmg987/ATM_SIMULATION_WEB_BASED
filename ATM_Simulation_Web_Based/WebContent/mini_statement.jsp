<%@ page language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mini Statement - Nepal Bank</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style>
        .transaction-row:hover {
            background-color: rgba(255,255,255,0.05);
        }
        @media print {
            .print-hidden { display:none; }
            body { background:white !important; }
        }
    </style>
</head>
<body class="min-h-screen py-10 bg-gradient-to-br from-[#0a0f1c] to-[#1b2333] text-gray-200">

<%
    String cardDisplay = (String) request.getAttribute("cardDisplay");
    String balance = (String) request.getAttribute("balance");
    String error = (String) request.getAttribute("error");
    List<String[]> transactions = (List<String[]>) request.getAttribute("transactions");
%>

<div class="max-w-4xl mx-auto px-4">
    <div class="text-right mb-4 print-hidden">
        <button onclick="window.print()" class="bg-[#d4af37] hover:bg-[#c09a2e] text-black px-4 py-2 rounded-lg font-semibold transition duration-200">&#128424; Print Statement</button>
    </div>

    <div class="rounded-2xl border border-[#d4af37]/20 bg-[#111827]/60 shadow-xl backdrop-blur-xl overflow-hidden">
        <div class="bg-[#1c2a3e] text-[#d4af37] py-6 px-8 border-b border-[#d4af37]/20">
            <div class="flex justify-between items-center">
                <div>
                    <h1 class="text-3xl font-extrabold">Nepal Bank</h1>
                    <p class="text-sm text-gray-300 mt-1">Trusted Banking Since 1937</p>
                </div>
                <div class="text-right text-gray-300 text-sm">
                    <p>Mini Statement</p>
                    <p><%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %></p>
                </div>
            </div>
        </div>

        <% if (error != null) { %>
            <div class="bg-red-600/20 border-l-4 border-red-500 p-4 mx-8 mt-6 text-red-400">
                &#9888; <%= error %>
            </div>
        <% } %>

        <div class="p-8 border-b border-[#d4af37]/20">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                    <h2 class="text-lg font-semibold text-[#d4af37] mb-2">Account Information</h2>
                    <p class="flex justify-between text-gray-300"><span>Card Number:</span> <span class="font-bold text-white"><%= cardDisplay != null ? cardDisplay : "N/A" %></span></p>
                    <p class="flex justify-between text-gray-300 mt-2"><span>Statement Date:</span> <span><%= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date()) %></span></p>
                </div>
                <div class="bg-[#1f2937]/70 p-4 rounded-lg border border-[#d4af37]/20">
                    <h2 class="text-lg font-semibold text-[#d4af37] mb-2">Current Balance</h2>
                    <p class="text-3xl font-bold text-[#d4af37]">Rs <%= balance != null ? balance : "0" %></p>
                    <p class="text-gray-300 text-sm mt-1">Available Balance</p>
                </div>
            </div>
        </div>

        <div class="p-8">
            <h2 class="text-xl font-semibold text-[#d4af37] mb-6 flex items-center">&#128202; Recent Transactions
                <% if (transactions != null && !transactions.isEmpty()) { %>
                    <span class="ml-2 bg-[#1f2937] text-gray-300 px-2 py-1 rounded-full text-sm border border-[#d4af37]/20"><%= transactions.size() %> transactions</span>
                <% } %>
            </h2>

            <% if (transactions != null && !transactions.isEmpty()) { %>
                <div class="overflow-x-auto">
                    <table class="w-full text-gray-300">
                        <thead>
                            <tr class="bg-[#1c2536] border-b border-[#d4af37]/20">
                                <th class="py-3 px-4 text-left">Date & Time</th>
                                <th class="py-3 px-4 text-left">Type</th>
                                <th class="py-3 px-4 text-right">Amount (Rs)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (String[] row : transactions) {
                                String type = row[1];
                                boolean isDeposit = "deposit".equalsIgnoreCase(type);
                                String amountClass = isDeposit ? "text-green-400" : "text-red-400";
                                String typeClass = isDeposit ? "bg-green-600/30 text-green-300" : "bg-red-600/30 text-red-300";
                            %>
                                <tr class="transaction-row border-b border-[#d4af37]/10">
                                    <td class="py-3 px-4"><%= row[0] %></td>
                                    <td class="py-3 px-4"><span class="px-3 py-1 rounded-full text-xs font-semibold <%= typeClass %>"><%= type.toUpperCase() %></span></td>
                                    <td class="py-3 px-4 text-right font-semibold <%= amountClass %>"><%= row[2] %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            <% } else { %>
                <div class="text-center py-12 text-gray-400">
                    <div class="text-6xl mb-4">&#128179;</div>
                    <h3 class="text-xl font-semibold text-gray-300 mb-2">No Transactions Found</h3>
                    <p>No records available.</p>
                </div>
            <% } %>
        </div>

        <div class="bg-[#111827]/80 py-4 px-8 border-t border-[#d4af37]/20 text-gray-400 text-sm flex justify-between">
            <p>&#128205; Kathmandu, Nepal | &#128222; +977-1-4221234</p>
            <p>support@nepalbank.com.np</p>
        </div>
    </div>

    <div class="flex justify-center gap-4 mt-8 print-hidden">
        <button onclick="window.history.back()" class="bg-[#374151] hover:bg-[#4b5563] text-white px-6 py-3 rounded-lg font-semibold">&#8592; Back</button>
        <button onclick="window.location.href='dashboard.jsp'" class="bg-[#d4af37] hover:bg-[#c09a2e] text-black px-6 py-3 rounded-lg font-semibold">&#127968; Dashboard</button>
    </div>
</div>

</body>
</html>
