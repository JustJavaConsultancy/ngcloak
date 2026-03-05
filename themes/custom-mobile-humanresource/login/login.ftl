<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
    <title>Employee Portal - Mobile Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <!-- Tailwind CSS v3 CDN -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Custom Font: Inter (Modern Sans-Serif) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style data-purpose="typography">
        body {
            font-family: "Inter", sans-serif;
        }
    </style>
    <style data-purpose="keycloak-overrides">
        /* Aggressive hiding of default Keycloak elements */
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .login-pf-signup,
        #kc-page-title,
        .kc-page-title,
        .login-pf .container,
        .login-pf-page .login-pf-signup,
        .login-pf-page .login-pf-header,
        .card-pf-title,
        .login-pf-page .card-pf .card-pf-title {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        /* Complete reset of Keycloak structure */
        html, body {
            margin: 0 !important;
            padding: 0 !important;
            font-family: "Inter", sans-serif !important;
            background: #f9fafb !important;
            min-height: 100vh !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        .login-pf-page {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            background: #f9fafb !important;
            min-height: 100vh !important;
            height: 100% !important;
            width: 100% !important;
            position: relative !important;
        }

        .login-pf-page .card-pf {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            max-width: none !important;
            background: none !important;
            box-shadow: none !important;
            border-top: none !important;
            width: 100% !important;
            height: 100% !important;
        }

        #kc-content-wrapper {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            height: 100vh !important;
            background: #f9fafb !important;
            position: relative !important;
        }

        #kc-content {
            padding: 0 !important;
            margin: 0 !important;
            width: 100% !important;
            height: 100% !important;
            background: #f9fafb !important;
        }

        #kc-info {
            margin: 0 !important;
            padding: 0 !important;
        }

        #kc-info-wrapper {
            display: none !important;
        }
    </style>
    <style data-purpose="mobile-optimizations">
        /* Mobile-specific optimizations */
        * {
            -webkit-tap-highlight-color: transparent;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        input, textarea, button {
            -webkit-user-select: text;
            -moz-user-select: text;
            -ms-user-select: text;
            user-select: text;
        }

        /* Prevent zoom on input focus */
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="tel"],
        select,
        textarea {
            font-size: 16px !important;
        }

        /* Mobile-friendly touch targets */
        .mobile-touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        /* Background elements for mobile */
        .bg-employee-watermark {
            position: fixed;
            bottom: -20px;
            left: -10%;
            width: 200px;
            height: 240px;
            color: #e5e7eb;
            opacity: 0.3;
            z-index: -1;
            animation: float 8s ease-in-out infinite;
        }

        .bg-team-watermark {
            position: fixed;
            top: 20px;
            right: -10%;
            width: 180px;
            height: 220px;
            color: #e5e7eb;
            opacity: 0.3;
            z-index: -1;
            animation: float 10s ease-in-out infinite reverse;
        }

        /* Animations optimized for mobile */
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-15px) rotate(2deg); }
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Apply mobile animations */
        .mobile-container {
            animation: fadeInScale 0.5s ease-out;
        }

        .mobile-header {
            animation: slideInUp 0.6s ease-out 0.1s both;
        }

        .mobile-form {
            animation: slideInUp 0.6s ease-out 0.3s both;
        }

        .mobile-footer {
            animation: slideInUp 0.6s ease-out 0.5s both;
        }

        /* Error and message styles */
        .form-input-error {
            border-color: #ef4444 !important;
            background-color: #fef2f2 !important;
        }

        .form-input-error:focus {
            border-color: #ef4444 !important;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1) !important;
        }

        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            padding: 0.5rem;
            background-color: #fef2f2;
            border-radius: 0.375rem;
            border: 1px solid #fecaca;
        }

        .alert {
            padding: 1rem;
            border-radius: 0.75rem;
            margin-bottom: 1.5rem;
            border: 1px solid;
            animation: slideInUp 0.4s ease-out;
        }

        .alert-error {
            background-color: #fef2f2;
            color: #dc2626;
            border-color: #fecaca;
        }

        .alert-success {
            background-color: #f0fdf4;
            color: #16a34a;
            border-color: #bbf7d0;
        }

        .alert-info {
            background-color: #eff6ff;
            color: #2563eb;
            border-color: #bfdbfe;
        }

        /* Mobile form styles */
        .mobile-input {
            transition: all 0.2s ease-in-out;
        }

        .mobile-input:focus {
            transform: translateY(-1px);
            box-shadow: 0 8px 25px -8px rgba(59, 130, 246, 0.3);
        }

        .mobile-button {
            transition: all 0.2s ease-in-out;
            transform: translateZ(0);
        }

        .mobile-button:active {
            transform: scale(0.98);
        }

        .loading-spinner {
            animation: spin 1s linear infinite;
        }

        /* Safe area handling for notched devices */
        .safe-area-top {
            padding-top: env(safe-area-inset-top);
        }

        .safe-area-bottom {
            padding-bottom: env(safe-area-inset-bottom);
        }
    </style>

<#elseif section = "form">

<div class="bg-gray-50 min-h-screen flex flex-col relative overflow-hidden safe-area-top safe-area-bottom">
    <!-- BEGIN: Background Watermarks -->
    <div class="bg-employee-watermark">
        <svg fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
        </svg>
    </div>
    <div class="bg-team-watermark">
        <svg fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M16 4c0-1.11.89-2 2-2s2 .89 2 2-.89 2-2 2-2-.89-2-2zM4 18v-4h3v4h2v-7.5c0-.83.67-1.5 1.5-1.5S12 9.67 12 10.5V11h2.5c.83 0 1.5.67 1.5 1.5V18h2v-6.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5V18h2v-6.5c0-1.93-1.57-3.5-3.5-3.5S16 9.57 16 11.5V12h-2.5c-.83 0-1.5-.67-1.5-1.5V9.5C12 7.57 10.43 6 8.5 6S5 7.57 5 9.5V18H4z"></path>
        </svg>
    </div>
    <!-- END: Background Watermarks -->

    <!-- BEGIN: Mobile Header -->
    <header class="flex-shrink-0 pt-8 pb-6 px-6 text-center mobile-header">
        <!-- Top Employee Icon -->
        <div class="flex justify-center mb-6">
            <div class="w-16 h-16 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                <svg class="h-9 w-9" fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path>
                </svg>
            </div>
        </div>
        <!-- Brand and Subtitle -->
        <div class="flex items-center justify-center space-x-2 mb-2">
            <svg class="w-7 h-7 text-blue-600" fill="currentColor" viewBox="0 0 24 24">
                <path d="M16 4c0-1.11.89-2 2-2s2 .89 2 2-.89 2-2 2-2-.89-2-2zM4 18v-4h3v4h2v-7.5c0-.83.67-1.5 1.5-1.5S12 9.67 12 10.5V11h2.5c.83 0 1.5.67 1.5 1.5V18h2v-6.5c0-.83.67-1.5 1.5-1.5s1.5.67 1.5 1.5V18h2v-6.5c0-1.93-1.57-3.5-3.5-3.5S16 9.57 16 11.5V12h-2.5c-.83 0-1.5-.67-1.5-1.5V9.5C12 7.57 10.43 6 8.5 6S5 7.57 5 9.5V18H4z"></path>
            </svg>
            <h1 class="text-3xl font-bold text-gray-900 tracking-tight">Employee Portal</h1>
        </div>
        <p class="text-xl font-semibold text-gray-800 mb-4">Welcome Back</p>
        <!-- Employee Portal Badge -->
        <div class="inline-flex items-center px-4 py-2 bg-blue-50 text-blue-600 text-sm font-bold rounded-full border border-blue-100 uppercase tracking-wider">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"></path>
            </svg>
            Employee Access
        </div>
        <p class="mt-6 text-base text-gray-500 px-4">
            Access your employee dashboard, benefits, and workplace tools.
        </p>
    </header>
    <!-- END: Mobile Header -->

    <!-- BEGIN: Main Content Area -->
    <main class="flex-1 flex flex-col justify-center px-6 mobile-container">
        <!-- BEGIN: Messages -->
        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="mb-6">
                <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </div>
        </#if>
        <!-- END: Messages -->

        <!-- BEGIN: Login Form -->
        <#if realm.password>
            <form id="kc-form-login" class="mobile-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" novalidate="novalidate">
                <!-- Email Field -->
                <div class="mb-6">
                    <label class="block text-base font-semibold text-gray-700 mb-3" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-6 w-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-12 pr-4 py-4 border-2 border-gray-300 rounded-xl focus:ring-blue-500 focus:border-blue-500 text-gray-900 placeholder-gray-400 text-base mobile-input mobile-touch-target <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                            id="username"
                            name="username"
                            placeholder="e.g. john.doe@company.com"
                            type="email"
                            value="${(login.username!'')}"
                            autofocus
                            autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                            tabindex="1"
                        />
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                    </#if>
                </div>

                <!-- Password Field -->
                <div class="mb-6">
                    <div class="flex justify-between items-center mb-3">
                        <label class="block text-base font-semibold text-gray-700" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a class="text-sm font-semibold text-blue-600 hover:text-blue-500 mobile-touch-target" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                            <svg class="h-6 w-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-12 pr-16 py-4 border-2 border-gray-300 rounded-xl focus:ring-blue-500 focus:border-blue-500 text-gray-900 text-base mobile-input mobile-touch-target <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            tabindex="2"
                        />
                        <div class="absolute inset-y-0 right-0 pr-4 flex items-center cursor-pointer mobile-touch-target" id="passwordToggle">
                            <svg class="h-6 w-6 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                                <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Remember Device -->
                <div class="flex items-center mb-8">
                    <#if realm.rememberMe && !usernameHidden??>
                        <input
                            class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded mobile-touch-target"
                            id="rememberMe"
                            name="rememberMe"
                            type="checkbox"
                            tabindex="3"
                            <#if login.rememberMe??>checked</#if>
                        />
                        <label class="ml-3 block text-base text-gray-700" for="rememberMe">${msg("rememberMe")}</label>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <!-- Submit Button -->
                <button
                    class="w-full flex justify-center items-center py-5 px-6 border border-transparent rounded-xl shadow-lg text-lg font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-4 focus:ring-blue-500 focus:ring-opacity-50 transition-all duration-200 mobile-button mobile-touch-target"
                    type="submit"
                    name="login"
                    id="kc-login"
                    tabindex="4"
                >
                    Sign In
                    <svg class="ml-3 h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                    </svg>
                </button>
            </form>
        </#if>
        <!-- END: Login Form -->
    </main>
    <!-- END: Main Content Area -->

    <!-- BEGIN: Mobile Footer -->
    <footer class="flex-shrink-0 px-6 py-6 mobile-footer">
        <!-- Security Badge -->
        <div class="flex justify-center items-center mb-6">
            <div class="flex items-center text-sm font-medium text-gray-500 bg-white px-4 py-2 rounded-full shadow-sm">
                <svg class="w-5 h-5 text-green-500 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                </svg>
                Your Data Protected
            </div>
        </div>

        <!-- Registration Link -->
        <#if realm.registrationAllowed && !registrationDisabled??>
            <div class="text-center mb-6">
                <p class="text-base text-gray-600 mb-4">New employee?</p>
                <a href="${url.registrationUrl}" class="inline-flex items-center justify-center w-full py-4 px-6 border-2 border-blue-600 rounded-xl text-base font-semibold text-blue-600 bg-white hover:bg-blue-50 focus:outline-none focus:ring-4 focus:ring-blue-500 focus:ring-opacity-50 transition-all duration-200 mobile-button mobile-touch-target">
                    <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                    </svg>
                    Set Up Employee Account
                </a>
            </div>
        </#if>

        <!-- Footer Links -->
        <div class="text-center space-y-3">
            <div class="flex justify-center space-x-6 text-sm font-medium text-gray-400">
                <a class="hover:text-gray-600 transition-colors mobile-touch-target" href="#">Privacy</a>
                <a class="hover:text-gray-600 transition-colors mobile-touch-target" href="#">Terms</a>
                <a class="hover:text-gray-600 transition-colors mobile-touch-target" href="#">Support</a>
            </div>
            <div class="text-xs font-bold text-gray-400 tracking-wider uppercase">
                © 2024 Employee Portal. ALL RIGHTS RESERVED.
            </div>
        </div>
    </footer>
    <!-- END: Mobile Footer -->

    <script>
        // Mobile-optimized JavaScript
        document.addEventListener('DOMContentLoaded', function() {
            // Prevent zoom on input focus for iOS
            const inputs = document.querySelectorAll('input[type="text"], input[type="email"], input[type="password"]');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.fontSize = '16px';
                });
            });

            // Password toggle functionality
            const passwordToggle = document.getElementById('passwordToggle');
            const passwordInput = document.getElementById('password');

            if (passwordToggle && passwordInput) {
                passwordToggle.addEventListener('click', function(e) {
                    e.preventDefault();

                    const isPassword = passwordInput.type === 'password';
                    passwordInput.type = isPassword ? 'text' : 'password';

                    // Update icon with haptic feedback
                    if (navigator.vibrate) {
                        navigator.vibrate(50);
                    }

                    const icon = passwordToggle.querySelector('svg');
                    if (isPassword) {
                        // Show "eye-slash" icon when password is visible
                        icon.innerHTML = `
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 1-4.243-4.243m4.242 4.242L9.88 9.88" stroke-width="1.5" fill="none" stroke="currentColor"/>
                        `;
                    } else {
                        // Show "eye" icon when password is hidden
                        icon.innerHTML = `
                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                            <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                        `;
                    }
                });
            }

            // Enhanced form submission with loading state
            const submitButton = document.getElementById('kc-login');
            const loginForm = document.getElementById('kc-form-login');

            if (submitButton && loginForm) {
                loginForm.addEventListener('submit', function() {
                    // Haptic feedback
                    if (navigator.vibrate) {
                        navigator.vibrate(100);
                    }

                    submitButton.disabled = true;
                    submitButton.style.opacity = '0.7';
                    submitButton.innerHTML = `
                        <svg class="loading-spinner h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24">
                            <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        Signing In...
                    `;
                });
            }

            // Handle orientation changes
            window.addEventListener('orientationchange', function() {
                setTimeout(function() {
                    window.scrollTo(0, 0);
                }, 100);
            });

            // Smooth scroll to top on page load
            window.scrollTo(0, 0);
        });
    </script>
</div>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div style="text-align: center; margin-top: 2rem; padding: 1.5rem; border-top: 1px solid #f3f4f6; background-color: #f9fafb;">
            <p style="color: #6b7280; font-size: 1rem; margin-bottom: 1rem;">
                ${msg("noAccount")}
            </p>
            <a href="${url.registrationUrl}" style="display: inline-flex; align-items: center; justify-content: center; padding: 1rem 2rem; border: 2px solid #3b82f6; border-radius: 0.75rem; font-size: 1rem; font-weight: 600; color: #3b82f6; background-color: white; text-decoration: none; transition: all 0.2s ease-in-out; min-height: 48px;">
                <svg style="width: 1.25rem; height: 1.25rem; margin-right: 0.5rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                </svg>
                ${msg("doRegister")}
            </a>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
