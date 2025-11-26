<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Connect - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&family=Be+Vietnam+Pro:wght@400;500;700;900&family=Noto+Sans:wght@400;500;700;900"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>
        /* Hide default Keycloak elements */
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .login-pf-signup {
            display: none !important;
        }

        .login-pf-page {
            padding-top: 0;
            border: none;
        }

        .login-pf-page .card-pf {
            padding: 0;
            margin-bottom: 0;
            border: none;
            max-width: none;
        }

        #kc-content-wrapper {
            margin-top: 0;
        }

        .comtext {
            color: white !important;
        }

        /* Base animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                transform: translateX(-20px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
            100% { transform: translateY(0px); }
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        /* Animation classes */
        .animate-fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .animate-slide-in {
            animation: slideIn 0.5s ease-out forwards;
        }

        .animate-pulse-slow {
            animation: pulse 3s infinite ease-in-out;
        }

        .animate-float {
            animation: float 4s infinite ease-in-out;
        }

        .animate-gradient {
            background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
        }

        .animate-shake {
            animation: shake 0.3s ease-in-out;
        }

        /* Mobile-specific animations */
        .mobile-fade-in {
            animation: fadeInUp 0.5s ease-out forwards;
        }

        .mobile-slide-down {
            animation: slideDown 0.3s ease-out forwards;
        }

        /* Button transitions */
        .btn-transition {
            transition: all 0.2s ease;
        }

        .btn-transition:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        /* Mobile button active state */
        .mobile-btn-active:active {
            transform: scale(0.98);
        }

        /* Text effects */
        .gradient-text {
            background: linear-gradient(90deg, #2a5dea, #8a3ffc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Glass effects */
        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .mobile-glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        /* Input focus states */
        .input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
        }

        .mobile-input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
            border-color: #2a5dea;
        }

        /* Checkbox styling */
        .checkbox:checked {
            background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3e%3c/svg%3e");
            background-color: #2a5dea;
            border-color: #2a5dea;
        }

        /* Mobile touch targets */
        .mobile-touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        /* Prevent zoom on input focus for mobile */
        @media (max-width: 1023px) {
            input[type="text"],
            input[type="email"],
            input[type="password"] {
                font-size: 16px;
            }
        }

        /* Desktop layout (1024px and up) */
        .desktop-layout {
            display: none;
        }

        .mobile-layout {
            display: block;
        }

        @media (min-width: 1024px) {
            .desktop-layout {
                display: flex !important;
            }

            .mobile-layout {
                display: none !important;
            }

            .desktop-left-panel {
                display: flex !important;
                flex-direction: column;
                justify-content: space-between;
            }

            .responsive-right-panel {
                width: 50% !important;
            }

            /* Desktop-specific background */
            .desktop-background {
                display: block;
            }
            .mobile-background {
                display: none;
            }
        }

        /* Mobile layout (below 1024px) */
        @media (max-width: 1023px) {
            .desktop-layout {
                display: none !important;
            }

            .mobile-layout {
                display: block !important;
            }

            /* Mobile-specific background */
            .desktop-background {
                display: none;
            }
            .mobile-background {
                display: block;
            }

            /* Mobile-specific layout adjustments */
            .mobile-container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .mobile-header {
                flex-shrink: 0;
                padding-top: 3rem;
                padding-bottom: 2rem;
                padding-left: 1.5rem;
                padding-right: 1.5rem;
            }

            .mobile-content {
                flex: 1;
                padding-left: 1.5rem;
                padding-right: 1.5rem;
                padding-bottom: 2rem;
            }

            .mobile-form-container {
                max-width: 20rem;
                margin: 0 auto;
            }

            /* Mobile form styling */
            .mobile-form-card {
                border-radius: 1.5rem;
                padding: 2rem;
            }

            .mobile-input {
                padding: 1rem;
                border-radius: 1rem;
                border-width: 2px;
                font-size: 1.125rem;
            }

            .mobile-input-with-icon {
                padding-left: 3rem;
            }

            .mobile-button {
                padding: 1rem 1.5rem;
                border-radius: 1rem;
                font-size: 1.125rem;
                font-weight: 700;
            }

            .mobile-icon-container {
                padding-left: 1rem;
            }

            .mobile-icon {
                font-size: 1.125rem;
            }
        }

        /* Biometric button styles */
        .biometric-button {
            background: linear-gradient(135deg, #10b981, #059669);
            color: white;
            border: none;
            border-radius: 1rem;
            padding: 1rem;
            font-size: 1rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            transition: all 0.2s ease;
            margin-top: 1rem;
            width: 100%;
        }

        .biometric-button:hover {
            background: linear-gradient(135deg, #059669, #047857);
            transform: translateY(-1px);
        }

        .biometric-button:active {
            transform: scale(0.98);
        }

        .biometric-button:disabled {
            background: #9ca3af;
            cursor: not-allowed;
            transform: none;
        }

        .biometric-status {
            text-align: center;
            margin-top: 0.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }

        .biometric-status.success {
            color: #059669;
        }

        .biometric-status.error {
            color: #dc2626;
        }

        .biometric-status.info {
            color: #2563eb;
        }

        /* Debug panel for login */
        .login-debug-info {
            position: fixed;
            bottom: 10px;
            right: 10px;
            background: rgba(0, 0, 0, 0.9);
            color: white;
            padding: 10px;
            border-radius: 8px;
            font-size: 10px;
            max-width: 300px;
            z-index: 1000;
            font-family: monospace;
            border: 2px solid #10b981;
        }

        .login-debug-title {
            color: #10b981;
            font-weight: bold;
            margin-bottom: 5px;
            text-align: center;
        }
    </style>
<#elseif section = "form">

<body class="bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen"
      style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif">

<!-- Debug panel for login -->
<div id="loginDebugInfo" class="login-debug-info" style="display: none;">
    <div class="login-debug-title">🔐 LOGIN DEBUG</div>
    <div>WebView: <span id="loginWebviewDetected" style="color: #10b981;">No</span></div>
    <div>Token Status: <span id="loginTokenStatus" style="color: #f59e0b;">Checking...</span></div>
    <div>Auth State: <span id="loginAuthState" style="color: #ef4444;">Idle</span></div>
    <div>Last Message: <span id="loginLastMessage" style="color: #3b82f6;">None</span></div>
    <div>Stored Token: <span id="loginStoredToken" style="color: #8b5cf6;">None</span></div>
    <div>Token Requests: <span id="tokenRequests" style="color: #06b6d4;">0</span></div>
    <div>WebViewString: <span id="currentWebViewString" style="color: #f97316;">None</span></div>
    <div>Detection Method: <span id="detectionMethod" style="color: #8b5cf6;">None</span></div>
    <div style="margin-top: 5px; padding-top: 5px; border-top: 1px solid #374151;">
        <button id="manualTokenRequest" style="background: #f59e0b; color: white; border: none; padding: 3px 6px; border-radius: 3px; font-size: 9px; width: 100%; margin-bottom: 3px;">
            🔄 REQUEST TOKEN
        </button>
        <button id="clearTokenBtn" style="background: #dc2626; color: white; border: none; padding: 3px 6px; border-radius: 3px; font-size: 9px; width: 100%;">
            🗑️ CLEAR TOKEN
        </button>
    </div>
</div>

<!-- Desktop background -->
<div class="desktop-background fixed top-0 left-0 w-full h-full overflow-hidden z-0">
    <div class="absolute -top-20 -left-20 w-72 h-72 bg-blue-200 rounded-full opacity-20 animate-float" style="animation-delay: 0s"></div>
    <div class="absolute top-1/4 -right-20 w-64 h-64 bg-purple-200 rounded-full opacity-20 animate-float" style="animation-delay: 1s"></div>
    <div class="absolute bottom-20 left-1/4 w-56 h-56 bg-indigo-200 rounded-full opacity-20 animate-float" style="animation-delay: 2s"></div>
    <div class="absolute bottom-0 right-1/4 w-48 h-48 bg-blue-300 rounded-full opacity-20 animate-float" style="animation-delay: 3s"></div>
</div>

<!-- Mobile background -->
<div class="mobile-background fixed inset-0 overflow-hidden z-0">
    <div class="absolute -top-10 -left-10 w-40 h-40 bg-blue-200 rounded-full opacity-20"></div>
    <div class="absolute top-1/4 -right-10 w-32 h-32 bg-purple-200 rounded-full opacity-20"></div>
    <div class="absolute bottom-20 left-1/4 w-28 h-28 bg-indigo-200 rounded-full opacity-20"></div>
</div>

<!-- Desktop layout -->
<div class="desktop-layout min-h-screen relative z-10">
    <!-- Left branding panel (desktop only) -->
    <div class="desktop-left-panel w-1/2 p-12 bg-gradient-to-br from-blue-600 to-purple-600 text-white">
        <div class="flex items-center gap-3 mb-12 animate-fade-in">
            <div class="size-10 animate-pulse-slow">
                <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/>
                </svg>
            </div>
            <h1 class="text-2xl font-bold">Connect</h1>
        </div>
        <div class="max-w-md animate-fade-in" style="animation-delay: 0.3s">
            <h2 class="text-4xl font-bold mb-6">Join our community of professionals</h2>
            <p class="text-lg opacity-90 mb-8 comtext">Connect with coaches, expand your network, and accelerate your career growth with our platform.</p>
            <div class="space-y-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-users text-white"></i>
                    </div>
                    <p class="text-lg comtext">Connect with industry experts</p>
                </div>
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-graduation-cap text-white"></i>
                    </div>
                    <p class="text-lg comtext">Personalized coaching sessions</p>
                </div>
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-briefcase text-white"></i>
                    </div>
                    <p class="text-lg comtext">Career advancement opportunities</p>
                </div>
            </div>
        </div>
        <div class="animate-fade-in" style="animation-delay: 0.6s">
            <div class="flex items-center space-x-2 mb-4">
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
            </div>
            <p class="text-sm opacity-80 comtext">
                Join thousands of professionals who are already growing their careers with Connect
            </p>
        </div>
    </div>

    <!-- Desktop login form -->
    <div class="responsive-right-panel w-1/2 flex items-center justify-center p-8">
        <div class="w-full max-w-md">
            <div class="glass-effect rounded-2xl shadow-xl p-8 animate-fade-in" style="animation-delay: 0.2s">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Welcome back</h2>
                <p class="text-gray-600 mb-6 text-sm">Sign in to your account to continue</p>

                <form id="kc-form-login-desktop" class="space-y-5" action="${url.loginAction}" method="post">
                    <!-- Username/Email -->
                    <div>
                        <label for="username-desktop" class="block text-sm font-medium text-gray-700 mb-1">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input type="text" id="username-desktop" name="username"
                                   value="${(login.username!'')}"
                                   class="input-focus pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                   autocomplete="username"
                                   placeholder="you@example.com"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                            <p class="text-red-600 text-sm mt-1">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                        </#if>
                    </div>

                    <!-- Password -->
                    <div>
                        <div class="flex justify-between items-center mb-1">
                            <label for="password-desktop" class="block text-sm font-medium text-gray-700">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 hover:text-blue-800 transition-colors">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400"></i>
                            </div>
                            <input type="password" id="password-desktop" name="password"
                                   class="input-focus pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                   placeholder="••••••••"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePasswordDesktop" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <i class="fas fa-eye text-gray-400 hover:text-gray-600"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <#if realm.rememberMe>
                        <div class="flex items-center">
                            <input type="checkbox" id="rememberMe-desktop" name="rememberMe"
                                   class="checkbox h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe-desktop" class="ml-2 block text-sm text-gray-700">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <!-- Submit -->
                    <div>
                        <input type="hidden" name="credentialId" id="id-hidden-input-desktop"
                               <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login-desktop"
                                class="animate-gradient w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
            </div>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <p class="text-center text-sm text-gray-600 mt-4">
                    Don't have an account?
                    <a href="${url.registrationUrl}" class="text-blue-600 hover:underline">Create one</a>
                </p>
            </#if>
        </div>
    </div>
</div>

<!-- Mobile layout -->
<div class="mobile-layout mobile-container relative z-10">
    <!-- Mobile header -->
    <div class="mobile-header">
        <div class="text-center mobile-fade-in">
            <div class="inline-flex items-center justify-center mb-4">
                <div class="w-16 h-16">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                    </svg>
                </div>
            </div>
            <h1 class="text-4xl font-bold gradient-text mb-2">Connect</h1>
            <p class="text-gray-600 text-lg">Welcome back</p>
        </div>
    </div>

    <!-- Mobile content -->
    <div class="mobile-content">
        <div class="mobile-form-container">
            <div class="mobile-glass-effect mobile-form-card mobile-fade-in" style="animation-delay: 0.2s">
                <!-- Biometric Login Button (Mobile Only) -->
                <div id="biometric-section" style="display: none;">
                    <button type="button" id="biometric-login-btn" class="biometric-button">
                        <i class="fas fa-fingerprint"></i>
                        <span>Login with Fingerprint</span>
                    </button>
                    <div id="biometric-status" class="biometric-status"></div>
                    <div class="text-center my-4">
                        <span class="text-gray-500 text-sm">or</span>
                    </div>
                </div>

                <form id="kc-form-login-mobile" action="${url.loginAction}" method="post" class="space-y-6">
                    <!-- Username/Email -->
                    <div class="mobile-slide-down" style="animation-delay: 0.3s">
                        <label for="username-mobile" class="block text-sm font-semibold text-gray-700 mb-3">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 mobile-icon-container flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400 mobile-icon"></i>
                            </div>
                            <input type="text" id="username-mobile" name="username"
                                   value="${(login.username!'')}"
                                   class="mobile-input-focus mobile-touch-target mobile-input mobile-input-with-icon border-gray-200 focus:outline-none w-full transition-all duration-200"
                                   autocomplete="username"
                                   placeholder="Enter your email"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                            <p class="text-red-600 text-sm mt-2 font-medium">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                        </#if>
                    </div>

                    <!-- Password -->
                    <div class="mobile-slide-down" style="animation-delay: 0.4s">
                        <div class="flex justify-between items-center mb-3">
                            <label for="password-mobile" class="block text-sm font-semibold text-gray-700">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 font-medium">Forgot?</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 mobile-icon-container flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400 mobile-icon"></i>
                            </div>
                            <input type="password" id="password-mobile" name="password"
                                   class="mobile-input-focus mobile-touch-target mobile-input mobile-input-with-icon pr-14 border-gray-200 focus:outline-none w-full transition-all duration-200"
                                   placeholder="Enter your password"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePasswordMobile" class="absolute inset-y-0 right-0 pr-4 flex items-center mobile-touch-target">
                                <i class="fas fa-eye text-gray-400 mobile-icon"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <#if realm.rememberMe>
                        <div class="flex items-center mobile-slide-down" style="animation-delay: 0.5s">
                            <input type="checkbox" id="rememberMe-mobile" name="rememberMe"
                                   class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe-mobile" class="ml-3 block text-sm text-gray-700 font-medium">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <!-- Submit Button -->
                    <div class="mobile-slide-down" style="animation-delay: 0.6s">
                        <input type="hidden" name="credentialId" id="id-hidden-input-mobile"
                               <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login-mobile"
                                class="animate-gradient mobile-btn-active mobile-touch-target mobile-button w-full text-white focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
            </div>

            <!-- Sign up link -->
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center mt-8 mobile-slide-down" style="animation-delay: 0.7s">
                    <p class="text-gray-600">
                        Don't have an account?
                        <a href="${url.registrationUrl}" class="text-blue-600 font-semibold">Sign up</a>
                    </p>
                </div>
            </#if>

            <!-- Trust indicators -->
            <div class="mt-8 text-center mobile-slide-down" style="animation-delay: 0.8s">
                <div class="flex justify-center items-center space-x-4 mb-4">
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-shield-alt text-green-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Secure</span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-lock text-blue-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Encrypted</span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-users text-purple-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Trusted</span>
                    </div>
                </div>
                <p class="text-xs text-gray-500">
                    Join thousands of professionals growing their careers
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    // Password toggle functionality for desktop
    document.getElementById("togglePasswordDesktop").addEventListener("click", function () {
        const pwd = document.getElementById("password-desktop");
        const icon = this.querySelector("i");

        if (pwd.type === "password") {
            pwd.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            pwd.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });

    // Password toggle functionality for mobile
    document.getElementById("togglePasswordMobile").addEventListener("click", function () {
        const pwd = document.getElementById("password-mobile");
        const icon = this.querySelector("i");

        if (pwd.type === "password") {
            pwd.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            pwd.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });

    // Enhanced form validation for both desktop and mobile
    function setupFormValidation(formId, submitBtnId) {
        const form = document.getElementById(formId);
        const submitBtn = document.getElementById(submitBtnId);

        if (form && submitBtn) {
            form.addEventListener("submit", function(e) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Signing in...';
            });
        }
    }

    setupFormValidation("kc-form-login-desktop", "kc-login-desktop");
    setupFormValidation("kc-form-login-mobile", "kc-login-mobile");

    // Auto-focus first input on load
    window.addEventListener("load", function() {
        const isDesktop = window.innerWidth >= 1024;
        const usernameInput = document.getElementById(isDesktop ? "username-desktop" : "username-mobile");
        if (usernameInput) {
            usernameInput.focus();
        }
    });

    // COMPLETELY REWRITTEN Biometric Authentication for Login - ENHANCED TOKEN RETRIEVAL
    (function(){
        let isWebView = false;
        let biometricAuthInProgress = false;
        let storedBiometricToken = '';
        let tokenRetrievalAttempts = 0;
        let maxTokenRetrievalAttempts = 60; // Increased to 60 seconds
        let tokenRequestCount = 0;
        let lastDebugUpdate = 0;
        let debugUpdateThrottle = 2000; // Update every 2 seconds

        // Interval management
        let allIntervals = new Set();
        let allTimeouts = new Set();

        // SAFE interval creation with tracking
        function createSafeInterval(callback, delay) {
            const intervalId = setInterval(callback, delay);
            allIntervals.add(intervalId);
            return intervalId;
        }

        // SAFE timeout creation with tracking
        function createSafeTimeout(callback, delay) {
            const timeoutId = setTimeout(() => {
                allTimeouts.delete(timeoutId);
                callback();
            }, delay);
            allTimeouts.add(timeoutId);
            return timeoutId;
        }

        // Complete cleanup function
        function completeCleanup() {
            console.log('🧹 LOGIN: Complete cleanup initiated');

            // Clear all tracked intervals
            allIntervals.forEach(intervalId => {
                try {
                    clearInterval(intervalId);
                } catch (e) {
                    // Ignore errors
                }
            });
            allIntervals.clear();

            // Clear all tracked timeouts
            allTimeouts.forEach(timeoutId => {
                try {
                    clearTimeout(timeoutId);
                } catch (e) {
                    // Ignore errors
                }
            });
            allTimeouts.clear();

            console.log('✅ LOGIN: Complete cleanup finished');
        }

        function log(message) {
            console.log('[LoginBiometric-Enhanced]', message);
            // Throttle debug updates
            const now = Date.now();
            if (now - lastDebugUpdate > debugUpdateThrottle) {
                updateLoginDebug();
                lastDebugUpdate = now;
            }
        }

        function updateLoginDebug() {
            try {
                const elements = {
                    webviewDetected: document.getElementById('loginWebviewDetected'),
                    tokenStatus: document.getElementById('loginTokenStatus'),
                    storedToken: document.getElementById('loginStoredToken'),
                    tokenRequests: document.getElementById('tokenRequests'),
                    currentWebViewString: document.getElementById('currentWebViewString')
                };

                if (elements.webviewDetected) elements.webviewDetected.textContent = isWebView ? 'YES' : 'NO';
                if (elements.tokenStatus) elements.tokenStatus.textContent = storedBiometricToken ? 'Found' : 'None';
                if (elements.storedToken) elements.storedToken.textContent = storedBiometricToken ?
                    storedBiometricToken.substring(0, 10) + '...' : 'None';
                if (elements.tokenRequests) elements.tokenRequests.textContent = tokenRequestCount;
                if (elements.currentWebViewString) elements.currentWebViewString.textContent = window.webViewString || 'None';
            } catch (error) {
                console.log('Debug update error:', error);
            }
        }

        function setLoginAuthState(state) {
            try {
                const authStateEl = document.getElementById('loginAuthState');
                if (authStateEl) authStateEl.textContent = state;
            } catch (error) {
                console.log('Auth state update error:', error);
            }
        }

        function setLoginLastMessage(message) {
            try {
                const lastMessageEl = document.getElementById('loginLastMessage');
                if (lastMessageEl) lastMessageEl.textContent = message;
            } catch (error) {
                console.log('Last message update error:', error);
            }
        }

        function setBiometricStatus(message, type = 'info') {
            try {
                const statusEl = document.getElementById('biometric-status');
                if (statusEl) {
                    statusEl.textContent = message;
                    statusEl.className = 'biometric-status ' + type;
                }
                setLoginLastMessage(message);
            } catch (error) {
                console.log('Biometric status update error:', error);
            }
        }

        function setDetectionMethod(method) {
            try {
                const detectionEl = document.getElementById('detectionMethod');
                if (detectionEl) detectionEl.textContent = method;
            } catch (error) {
                console.log('Detection method update error:', error);
            }
        }

        // ENHANCED TOKEN RETRIEVAL - Multiple aggressive methods
        function requestTokenFromKodular() {
            tokenRequestCount++;
            log('🔍 ENHANCED TOKEN REQUEST #' + tokenRequestCount);

            try {
                // Method 1: Direct webViewString
                window.webViewString = 'GET_TOKEN';

                // Method 2: AppInventor interface
                if (window.AppInventor && window.AppInventor.setWebViewString) {
                    window.AppInventor.setWebViewString('GET_TOKEN');
                }

                // Method 3: Android interface
                if (window.Android && window.Android.requestToken) {
                    window.Android.requestToken();
                }

                // Method 4: URL hash method
                window.location.hash = '#GET_TOKEN_' + Date.now();

                // Method 5: Document title method
                document.title = 'GET_TOKEN_' + Date.now();

                // Method 6: Multiple variations
                createSafeTimeout(() => {
                    window.webViewString = 'REQUEST_TOKEN';
                }, 500);

                createSafeTimeout(() => {
                    window.webViewString = 'BIOMETRIC_TOKEN_REQUEST';
                }, 1000);

                createSafeTimeout(() => {
                    window.webViewString = 'TOKEN_NEEDED';
                }, 1500);

                log('✅ ENHANCED TOKEN REQUEST SENT - Multiple methods');

            } catch (error) {
                log('❌ Error in enhanced token request: ' + error.message);
            }
        }

        // ENHANCED TOKEN MONITORING - Multiple detection methods
        function monitorForToken() {
            try {
                tokenRetrievalAttempts++;

                // Method 1: Check webViewString for token
                const currentWebViewString = window.webViewString;
                if (currentWebViewString && currentWebViewString.startsWith('TOKEN:')) {
                    const token = currentWebViewString.substring(6);
                    if (token && token !== storedBiometricToken && token.length > 10) {
                        log('🔑 TOKEN FOUND IN WEBVIEWSTRING: ' + token.substring(0, 10) + '...');
                        storedBiometricToken = token;
                        setDetectionMethod('WebViewString');
                        return true;
                    }
                }

                // Method 2: Check URL hash for token
                const hash = window.location.hash;
                if (hash.startsWith('#TOKEN:')) {
                    const token = hash.substring(7);
                    if (token && token !== storedBiometricToken && token.length > 10) {
                        log('🔑 TOKEN FOUND IN URL HASH: ' + token.substring(0, 10) + '...');
                        storedBiometricToken = token;
                        window.location.hash = ''; // Clear hash
                        setDetectionMethod('URL Hash');
                        return true;
                    }
                }

                // Method 3: Check for global variable
                if (window.biometricToken && window.biometricToken !== storedBiometricToken && window.biometricToken.length > 10) {
                    log('🔑 TOKEN FOUND IN GLOBAL VARIABLE: ' + window.biometricToken.substring(0, 10) + '...');
                    storedBiometricToken = window.biometricToken;
                    setDetectionMethod('Global Variable');
                    return true;
                }

                // Method 4: Check document title
                if (document.title.startsWith('TOKEN:')) {
                    const token = document.title.substring(6);
                    if (token && token !== storedBiometricToken && token.length > 10) {
                        log('🔑 TOKEN FOUND IN DOCUMENT TITLE: ' + token.substring(0, 10) + '...');
                        storedBiometricToken = token;
                        document.title = 'Connect - Login'; // Reset title
                        setDetectionMethod('Document Title');
                        return true;
                    }
                }

                // Method 5: Check localStorage
                try {
                    const localToken = localStorage.getItem('biometricToken');
                    if (localToken && localToken !== storedBiometricToken && localToken.length > 10) {
                        log('🔑 TOKEN FOUND IN LOCALSTORAGE: ' + localToken.substring(0, 10) + '...');
                        storedBiometricToken = localToken;
                        setDetectionMethod('LocalStorage');
                        return true;
                    }
                } catch (e) {
                    // LocalStorage might not be available
                }

                // Method 6: Check sessionStorage
                try {
                    const sessionToken = sessionStorage.getItem('biometricToken');
                    if (sessionToken && sessionToken !== storedBiometricToken && sessionToken.length > 10) {
                        log('🔑 TOKEN FOUND IN SESSIONSTORAGE: ' + sessionToken.substring(0, 10) + '...');
                        storedBiometricToken = sessionToken;
                        setDetectionMethod('SessionStorage');
                        return true;
                    }
                } catch (e) {
                    // SessionStorage might not be available
                }

                return false;
            } catch (error) {
                log('❌ Error in enhanced token monitoring: ' + error.message);
                return false;
            }
        }

        // Function to authenticate with biometric token
        function authenticateWithBiometricToken(token) {
            log('🔐 AUTHENTICATING WITH BIOMETRIC TOKEN');

            if (!token || token.trim() === '') {
                log('❌ No token available for authentication');
                setBiometricStatus('No biometric token found', 'error');
                const btn = document.getElementById('biometric-login-btn');
                if (btn) btn.disabled = false;
                biometricAuthInProgress = false;
                return;
            }

            setBiometricStatus('Authenticating with server...', 'info');
            setLoginAuthState('AUTHENTICATING');

            fetch('/mobile/biometric-login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'HX-Request': 'true'
                },
                body: JSON.stringify({ token: token })
            })
            .then(response => {
                log('📡 Server response status: ' + response.status);

                // Check for redirect header
                const redirectUrl = response.headers.get('HX-Redirect');
                if (redirectUrl) {
                    log('🔄 Redirecting to: ' + redirectUrl);
                    setBiometricStatus('Login successful! Redirecting...', 'success');
                    setLoginAuthState('SUCCESS');
                    completeCleanup();
                    window.location.href = redirectUrl;
                    return;
                }

                // Handle other responses
                if (response.ok) {
                    setBiometricStatus('Login successful!', 'success');
                    setLoginAuthState('SUCCESS');
                    completeCleanup();
                    // Fallback redirect if no HX-Redirect header
                    createSafeTimeout(() => {
                        window.location.href = '/mobile/settings';
                    }, 1000);
                } else {
                    response.text().then(errorText => {
                        log('❌ Server error: ' + errorText);
                        setBiometricStatus('Authentication failed: ' + errorText, 'error');
                        setLoginAuthState('FAILED');
                    });
                }
            })
            .catch(error => {
                log('❌ Network error: ' + error.message);
                setBiometricStatus('Network error during authentication', 'error');
                setLoginAuthState('ERROR');
            })
            .finally(() => {
                biometricAuthInProgress = false;
                const btn = document.getElementById('biometric-login-btn');
                if (btn) btn.disabled = false;
            });
        }

        // ENHANCED MESSAGE SENDING - Multiple methods
        function sendBiometricMessage() {
            try {
                // Method 1: Try direct function call
                if (window.AppInventor && window.AppInventor.setWebViewString) {
                    window.AppInventor.setWebViewString('BIOMETRIC');
                }

                // Method 2: Try Android interface
                if (window.Android && window.Android.triggerBiometric) {
                    window.Android.triggerBiometric();
                }

                // Method 3: Traditional webViewString (fallback)
                window.webViewString = 'BIOMETRIC';

                // Method 4: Force multiple triggers
                createSafeTimeout(function() {
                    window.webViewString = '';
                    createSafeTimeout(function() {
                        window.webViewString = 'BIOMETRIC';
                    }, 100);
                }, 200);

                // Method 5: Try URL change (Kodular can detect this)
                window.location.hash = '#BIOMETRIC_' + Date.now();

                // Method 6: Document title method
                document.title = 'BIOMETRIC_' + Date.now();

                log('📤 ENHANCED BIOMETRIC MESSAGE SENT - Multiple methods');

            } catch (error) {
                console.log('Error in sendBiometricMessage:', error);
            }
        }

        // Detect WebView - Enhanced detection
        function detectWebView() {
            const userAgent = navigator.userAgent.toLowerCase();
            const checks = [
                userAgent.includes('wv'),
                userAgent.includes('android'),
                userAgent.includes('kodular'),
                userAgent.includes('appinventor'),
                !window.chrome || (window.chrome && window.chrome.webstore === undefined),
                window.Android !== undefined,
                window.AppInventor !== undefined,
                window.webkit && window.webkit.messageHandlers,
                navigator.standalone === false
            ];

            isWebView = checks.some(check => check);

            log(isWebView ? '✅ LOGIN WEBVIEW DETECTED' : 'ℹ️ LOGIN BROWSER DETECTED');

            if (isWebView && window.innerWidth < 1024) {
                document.getElementById('biometric-section').style.display = 'block';
                document.getElementById('loginDebugInfo').style.display = 'block';
                setBiometricStatus('Biometric login available', 'success');

                // Immediately request token from Kodular - ENHANCED
                createSafeTimeout(requestTokenFromKodular, 1000);
                createSafeTimeout(requestTokenFromKodular, 3000); // Second attempt
                createSafeTimeout(requestTokenFromKodular, 5000); // Third attempt
            }

            return isWebView;
        }

        // Global callback functions - ENHANCED to prevent issues
        window.onSettingsBiometricSuccess = function() {
            log('✅ LOGIN BIOMETRIC SUCCESS RECEIVED');
            setLoginAuthState('FINGERPRINT_SUCCESS');

            setBiometricStatus('Fingerprint verified! Getting token...', 'success');

            // Clear any existing intervals first
            completeCleanup();

            // Start ENHANCED token monitoring - more aggressive but controlled
            tokenRetrievalAttempts = 0;
            const tokenCheckInterval = createSafeInterval(() => {
                if (monitorForToken()) {
                    clearInterval(tokenCheckInterval);
                    allIntervals.delete(tokenCheckInterval);

                    log('🔑 TOKEN RETRIEVED SUCCESSFULLY');
                    authenticateWithBiometricToken(storedBiometricToken);
                } else if (tokenRetrievalAttempts >= maxTokenRetrievalAttempts) {
                    clearInterval(tokenCheckInterval);
                    allIntervals.delete(tokenCheckInterval);

                    log('⏰ Token retrieval timeout after ' + tokenRetrievalAttempts + ' attempts');
                    setBiometricStatus('Could not retrieve authentication token', 'error');
                    setLoginAuthState('TOKEN_TIMEOUT');
                    biometricAuthInProgress = false;
                    const btn = document.getElementById('biometric-login-btn');
                    if (btn) btn.disabled = false;
                } else {
                    // Send additional token requests every 3 attempts
                    if (tokenRetrievalAttempts % 3 === 0) {
                        requestTokenFromKodular();
                    }
                }
            }, 1000); // Check every second
        };

        window.onSettingsBiometricFailure = function() {
            log('❌ LOGIN BIOMETRIC FAILURE RECEIVED');
            biometricAuthInProgress = false;
            setBiometricStatus('Fingerprint authentication failed', 'error');
            setLoginAuthState('FINGERPRINT_FAILED');

            const btn = document.getElementById('biometric-login-btn');
            if (btn) btn.disabled = false;
        };

        window.onSettingsBiometricError = function(error) {
            log('⚠️ LOGIN BIOMETRIC ERROR RECEIVED: ' + error);
            biometricAuthInProgress = false;
            setBiometricStatus('Biometric error: ' + error, 'error');
            setLoginAuthState('FINGERPRINT_ERROR');

            const btn = document.getElementById('biometric-login-btn');
            if (btn) btn.disabled = false;
        };

        // ENHANCED Biometric login button handler
        function handleBiometricLogin() {
            if (!isWebView) {
                setBiometricStatus('Biometric login only available in mobile app', 'error');
                return;
            }

            if (biometricAuthInProgress) {
                log('⏳ Biometric authentication already in progress');
                return;
            }

            log('🔐 BIOMETRIC LOGIN BUTTON CLICKED');

            // Clear any existing intervals first
            completeCleanup();

            biometricAuthInProgress = true;
            tokenRetrievalAttempts = 0;

            const btn = document.getElementById('biometric-login-btn');
            if (btn) btn.disabled = true;

            setBiometricStatus('Waiting for fingerprint...', 'info');
            setLoginAuthState('STARTING');

            // Check if we already have a token
            if (storedBiometricToken && storedBiometricToken.length > 10) {
                log('🔑 Using existing stored token');
                authenticateWithBiometricToken(storedBiometricToken);
                return;
            }

            // Request fresh token and start biometric process - ENHANCED
            requestTokenFromKodular();

            // Add multiple delays to ensure UI updates and give Kodular time
            createSafeTimeout(function() {
                requestTokenFromKodular(); // Second request
            }, 2000);

            createSafeTimeout(function() {
                sendBiometricMessage();
            }, 3000);

            // Set timeout with cleanup
            createSafeTimeout(() => {
                if (biometricAuthInProgress) {
                    completeCleanup();
                    biometricAuthInProgress = false;
                    setBiometricStatus('Biometric login timed out', 'error');
                    setLoginAuthState('TIMEOUT');
                    if (btn) btn.disabled = false;
                }
            }, 45000); // Increased timeout to 45 seconds
        }

        // Manual token request function
        function handleManualTokenRequest() {
            log('🔄 MANUAL TOKEN REQUEST');
            requestTokenFromKodular();
            setBiometricStatus('Token requested manually', 'info');
        }

        // Clear token function
        function handleClearToken() {
            log('🗑️ CLEARING STORED TOKEN');
            storedBiometricToken = '';
            window.webViewString = '';
            window.biometricToken = '';
            try {
                localStorage.removeItem('biometricToken');
                sessionStorage.removeItem('biometricToken');
            } catch (e) {
                // Ignore errors
            }
            setBiometricStatus('Token cleared', 'info');
            updateLoginDebug();
        }

        // ENHANCED Initialize function
        function initialize() {
            log('🚀 INITIALIZING ENHANCED LOGIN BIOMETRIC SYSTEM');

            detectWebView();

            const biometricBtn = document.getElementById('biometric-login-btn');
            const manualTokenBtn = document.getElementById('manualTokenRequest');
            const clearTokenBtn = document.getElementById('clearTokenBtn');

            if (biometricBtn) {
                biometricBtn.addEventListener('click', handleBiometricLogin);
            }

            if (manualTokenBtn) {
                manualTokenBtn.addEventListener('click', handleManualTokenRequest);
            }

            if (clearTokenBtn) {
                clearTokenBtn.addEventListener('click', handleClearToken);
            }

            // ENHANCED monitoring - only when needed
            if (isWebView) {
                // Continuous token monitoring - less aggressive but persistent
                const basicMonitoringInterval = createSafeInterval(() => {
                    // Check for token in various places
                    if (monitorForToken()) {
                        log('🔑 TOKEN DETECTED IN CONTINUOUS MONITORING');
                        updateLoginDebug();
                    }
                }, 3000); // Every 3 seconds

                // Periodic token requests - in case the app missed our initial requests
                const periodicRequestInterval = createSafeInterval(() => {
                    if (!storedBiometricToken && !biometricAuthInProgress) {
                        log('🔄 PERIODIC TOKEN REQUEST');
                        requestTokenFromKodular();
                    }
                }, 10000); // Every 10 seconds
            }

            log('✅ ENHANCED LOGIN BIOMETRIC INITIALIZATION COMPLETE');
            updateLoginDebug();
        }

        // Cleanup function for page unload
        window.addEventListener('beforeunload', function() {
            completeCleanup();
        });

        // Start when page loads
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initialize);
        } else {
            initialize();
        }

    })();
</script>

</#if>
</@layout.registrationLayout>
