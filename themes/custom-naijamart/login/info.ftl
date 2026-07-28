<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
<#if section = "header">
    <title>Pinepetosan Marketplace</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <#if pageRedirectUri?has_content>
        <meta http-equiv="refresh" content="1;url=${pageRedirectUri}">
    <#elseif actionUri?has_content>
        <meta http-equiv="refresh" content="1;url=${actionUri}">
    <#elseif (client.baseUrl)?has_content>
        <meta http-equiv="refresh" content="2;url=${client.baseUrl}">
    </#if>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"/>
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .login-pf-signup { display: none !important; }
        .login-pf-page { padding-top: 0; border: none; }
        .login-pf-page .card-pf { padding: 0; margin-bottom: 0; border: none; max-width: none; }
        #kc-content-wrapper { margin-top: 0; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }

        @keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
        @keyframes float { 0% { transform: translateY(0px); } 50% { transform: translateY(-5px); } 100% { transform: translateY(0px); } }
        @keyframes gradientShift { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
        @keyframes pop { 0% { transform: scale(0.6); opacity: 0; } 60% { transform: scale(1.15); opacity: 1; } 100% { transform: scale(1); opacity: 1; } }
        @keyframes checkmark { 0% { stroke-dashoffset: 48; } 100% { stroke-dashoffset: 0; } }

        .animate-fade-in { animation: fadeIn 0.6s ease-out forwards; }
        .animate-float { animation: float 4s infinite ease-in-out; }
        .animate-pop { animation: pop 0.5s cubic-bezier(.34,1.56,.64,1) forwards; }
        .animate-gradient {
            background: linear-gradient(-45deg, #630ed4, #7c3aed, #630ed4);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
        }
        .check-path {
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            animation: checkmark 0.5s ease-out 0.3s forwards;
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        .gradient-text {
            background: linear-gradient(90deg, #630ed4, #7c3aed);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        .btn-transition { transition: all 0.2s ease; }
        .btn-transition:hover { transform: translateY(-2px); box-shadow: 0 4px 6px -1px rgba(0,0,0,.1), 0 2px 4px -1px rgba(0,0,0,.06); }

        .progress-track { height: 3px; background: rgba(99, 14, 212, 0.15); border-radius: 9999px; overflow: hidden; }
        .progress-fill { height: 100%; width: 0%; background: linear-gradient(90deg, #630ed4, #7c3aed); border-radius: 9999px; animation: fillBar 1.8s ease-out forwards; }
        @keyframes fillBar { from { width: 0%; } to { width: 100%; } }
    </style>
<#elseif section = "form">
<body class="bg-gradient-to-br from-purple-50 to-indigo-50 min-h-screen flex items-center justify-center p-6"
      style="font-family: 'Plus Jakarta Sans', sans-serif">

<div class="fixed inset-0 overflow-hidden z-0 pointer-events-none">
    <div class="absolute -top-20 -left-20 w-72 h-72 bg-purple-200 rounded-full opacity-20 animate-float"></div>
    <div class="absolute top-1/4 -right-20 w-64 h-64 bg-indigo-200 rounded-full opacity-20 animate-float" style="animation-delay: 1s"></div>
    <div class="absolute bottom-20 left-1/4 w-56 h-56 bg-violet-200 rounded-full opacity-20 animate-float" style="animation-delay: 2s"></div>
</div>

<div class="relative z-10 w-full max-w-md">
    <div class="glass-effect rounded-2xl shadow-xl p-8 text-center animate-fade-in">
        <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-gradient-to-br from-purple-100 to-indigo-100 mb-6 animate-pop">
            <svg xmlns="http://www.w3.org/2000/svg" width="44" height="44" viewBox="0 0 24 24" fill="none"
                 stroke="#7c3aed" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                <path class="check-path" d="M4 12.5l5 5L20 6"/>
            </svg>
        </div>

        <h1 class="text-2xl font-bold text-gray-800 mb-2">
            <#if messageHeader??>
                ${messageHeader}
            <#else>
                ${message.summary?no_esc}
            </#if>
        </h1>

        <#if messageHeader?? && message?? && message.summary??>
            <p class="text-gray-600 mb-6 text-sm">${message.summary?no_esc}</p>
        <#elseif !messageHeader?? && message?has_content>
            <p class="sr-only">${message.summary?no_esc}</p>
        </#if>

        <#if requiredActions??>
            <p class="text-gray-600 mb-6 text-sm">
                <#list requiredActions>Next: <#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></#list>
            </p>
        </#if>

        <#if pageRedirectUri?has_content>
            <p class="text-gray-500 text-sm mb-4">Signing you in and redirecting to your account…</p>
            <div class="progress-track mb-6"><div class="progress-fill"></div></div>
            <a href="${pageRedirectUri}" id="continue-link"
               class="animate-gradient inline-flex items-center justify-center gap-2 w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                <span class="material-symbols-outlined">arrow_forward</span>
                Continue now
            </a>
        <#elseif skipLink??>
            <#-- No auto-redirect (linked-to page unknown) — keep message visible. -->
        <#elseif actionUri?has_content>
            <p class="text-gray-500 text-sm mb-4">Taking you to the next step…</p>
            <div class="progress-track mb-6"><div class="progress-fill"></div></div>
            <a href="${actionUri}" id="continue-link"
               class="animate-gradient inline-flex items-center justify-center gap-2 w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                <span class="material-symbols-outlined">arrow_forward</span>
                Continue
            </a>
        <#elseif (client.baseUrl)?has_content>
            <p class="text-gray-500 text-sm mb-4">Redirecting you to Pinepetosan Marketplace…</p>
            <div class="progress-track mb-6"><div class="progress-fill"></div></div>
            <a href="${client.baseUrl}" id="continue-link"
               class="animate-gradient inline-flex items-center justify-center gap-2 w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500">
                <span class="material-symbols-outlined">storefront</span>
                Continue to marketplace
            </a>
        </#if>

        <div class="flex items-center justify-center gap-2 mt-8 text-xs text-gray-500">
            <span class="material-symbols-outlined text-sm">shield_lock</span>
            <span>Pinepetosan Marketplace &middot; Secure authentication</span>
        </div>
    </div>
</div>

<script>
    (function () {
        var link = document.getElementById("continue-link");
        if (!link) return;
        setTimeout(function () {
            window.location.href = link.getAttribute("href");
        }, 1200);
    })();
</script>

</#if>
</@layout.registrationLayout>
