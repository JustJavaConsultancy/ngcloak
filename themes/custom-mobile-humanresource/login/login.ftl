<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
    <title>JUST HR - Employee Portal Login</title>
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
        .login-pf-page .card-pf .card-pf-title,
        .login-pf-page .login-pf-brand,
        .login-pf-brand,
        .login-pf-page .login-pf-page-header,
        body.login-pf .login-pf-page .login-pf-header,
        body.login-pf .login-pf-page .login-pf-signup,
        body.login-pf .login-pf-page .card-pf .card-pf-title,
        body.login-pf .login-pf-page .card-pf .card-pf-body .form-group:last-of-type,
        body.login-pf .login-pf-page .card-pf .card-pf-body .form-actions {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
            opacity: 0 !important;
            position: absolute !important;
            left: -9999px !important;
        }

        /* Complete reset of Keycloak structure with higher specificity */
        html,
        html body,
        body.login-pf,
        body.login-pf html {
            margin: 0 !important;
            padding: 0 !important;
            font-family: "Inter", sans-serif !important;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            min-height: 100vh !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        body.login-pf .login-pf-page,
        .login-pf-page,
        body.login-pf .login-pf-page .login-pf-page-header {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            background: transparent !important;
            min-height: 100vh !important;
            height: 100% !important;
            width: 100% !important;
            position: relative !important;
        }

        body.login-pf .login-pf-page .card-pf,
        .login-pf-page .card-pf,
        body.login-pf .login-pf-page .card-pf .card-pf-body {
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

        body.login-pf #kc-content-wrapper,
        #kc-content-wrapper {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            height: 100vh !important;
            background: transparent !important;
            position: relative !important;
        }

        body.login-pf #kc-content,
        #kc-content {
            padding: 0 !important;
            margin: 0 !important;
            width: 100% !important;
            height: 100% !important;
            background: transparent !important;
        }

        body.login-pf #kc-info,
        #kc-info {
            margin: 0 !important;
            padding: 0 !important;
        }

        body.login-pf #kc-info-wrapper,
        #kc-info-wrapper {
            display: none !important;
            visibility: hidden !important;
            opacity: 0 !important;
            position: absolute !important;
            left: -9999px !important;
        }

        /* Override any remaining Keycloak styles */
        body.login-pf .login-pf-page .card-pf .card-pf-body .form-group,
        body.login-pf .login-pf-page .card-pf .card-pf-body .form-group .form-control,
        body.login-pf .login-pf-page .card-pf .card-pf-body .btn {
            all: unset !important;
        }

        /* Force our container to be visible + scrollable */
.mobile-container {
  position: fixed !important;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  z-index: 9999 !important;

  /* NEW: allow vertical scroll when content exceeds viewport */
  overflow-y: auto !important;
  -webkit-overflow-scrolling: touch !important;
}
    </style>
    <style data-purpose="mobile-optimizations">
        /* Mobile-first design optimizations */
        .mobile-container {
            min-height: 100vh;
            padding: 1rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            position: relative;
            overflow-x: hidden;
            overflow-y: auto;
           -webkit-overflow-scrolling: touch;
        }

        .mobile-card {
            width: 100%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }

        .floating-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .floating-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-circle:nth-child(1) {
            width: 80px;
            height: 80px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-circle:nth-child(2) {
            width: 120px;
            height: 120px;
            top: 20%;
            right: 15%;
            animation-delay: 2s;
        }

        .floating-circle:nth-child(3) {
            width: 60px;
            height: 60px;
            bottom: 30%;
            left: 20%;
            animation-delay: 4s;
        }

        .floating-circle:nth-child(4) {
            width: 100px;
            height: 100px;
            bottom: 10%;
            right: 10%;
            animation-delay: 1s;
        }

        /* Touch-optimized form elements */
        .mobile-input {
            height: 56px !important;
            font-size: 16px !important; /* Prevents zoom on iOS */
            border-radius: 16px !important;
            padding-left: 56px !important;
            padding-right: 16px !important;
            border: 2px solid #e5e7eb !important;
            background: #ffffff !important;
            transition: all 0.3s ease !important;
        }

        .mobile-input:focus {
            border-color: #667eea !important;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1) !important;
            transform: translateY(-2px) !important;
        }

        .mobile-input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            color: #9ca3af;
        }

        .mobile-button {
            height: 56px !important;
            border-radius: 16px !important;
            font-size: 16px !important;
            font-weight: 600 !important;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            border: none !important;
            color: white !important;
            transition: all 0.3s ease !important;
            touch-action: manipulation;
        }

        .mobile-button:hover, .mobile-button:active {
            transform: translateY(-2px) !important;
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.3) !important;
        }

        .mobile-button:disabled {
            opacity: 0.6 !important;
            transform: none !important;
            box-shadow: none !important;
        }

        /* Animations */
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
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

        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .fade-in-up {
            animation: fadeInUp 0.6s ease-out forwards;
        }

        .fade-in-up-delay-1 {
            animation: fadeInUp 0.6s ease-out 0.2s forwards;
            opacity: 0;
        }

        .fade-in-up-delay-2 {
            animation: fadeInUp 0.6s ease-out 0.4s forwards;
            opacity: 0;
        }

        /* Error styles */
        .mobile-input-error {
            border-color: #ef4444 !important;
            background-color: #fef2f2 !important;
        }

        .mobile-input-error:focus {
            border-color: #ef4444 !important;
            box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1) !important;
        }

        .error-message {
            color: #ef4444;
            font-size: 14px;
            margin-top: 8px;
            padding-left: 16px;
        }

        /* Message styles */
        .mobile-alert {
            padding: 16px;
            border-radius: 16px;
            margin-bottom: 20px;
            border: 1px solid;
            animation: fadeInUp 0.5s ease-out;
        }

        .mobile-alert-error {
            background-color: #fef2f2;
            color: #dc2626;
            border-color: #fecaca;
        }

        .mobile-alert-success {
            background-color: #f0fdf4;
            color: #16a34a;
            border-color: #bbf7d0;
        }

        .mobile-alert-info {
            background-color: #eff6ff;
            color: #2563eb;
            border-color: #bfdbfe;
        }

        .loading-spinner {
            animation: spin 1s linear infinite;
        }

        /* Safe area handling for notched devices */
        @supports (padding: max(0px)) {
            .mobile-container {
                padding-top: max(1rem, env(safe-area-inset-top));
                padding-bottom: max(1rem, env(safe-area-inset-bottom));
                padding-left: max(1rem, env(safe-area-inset-left));
                padding-right: max(1rem, env(safe-area-inset-right));
            }
        }
    </style>

<#elseif section = "form">

<div class="mobile-container">
    <!-- BEGIN: Floating Background Elements -->
    <div class="floating-elements">
        <div class="floating-circle"></div>
        <div class="floating-circle"></div>
        <div class="floating-circle"></div>
        <div class="floating-circle"></div>
    </div>
    <!-- END: Floating Background Elements -->

    <!-- BEGIN: Main Login Card -->
    <main class="mobile-card z-10">
        <!-- BEGIN: Card Header -->
        <section class="pt-8 pb-6 px-6 text-center fade-in-up">
            <!-- Employee Icon -->
            <div class="flex justify-center mb-6">
                <div class="w-16 h-16 bg-gradient-to-br from-blue-500 to-purple-600 rounded-full flex items-center justify-center text-white shadow-lg">
                    <svg class="h-8 w-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"></path>
                    </svg>
                </div>
            </div>

            <!-- Brand and Title -->
            <div class="mb-2">
                <h1 class="text-2xl font-bold text-gray-900 mb-1">JUST HR</h1>
                <p class="text-lg font-semibold text-gray-700">Employee Portal</p>
            </div>

            <!-- Welcome Message -->
            <div class="inline-flex items-center px-4 py-2 bg-blue-50 text-blue-700 text-sm font-medium rounded-full border border-blue-100 mb-4">
                <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                </svg>
                Welcome Back
            </div>

            <p class="text-sm text-gray-600">
                Access your employee dashboard, schedules, and more.
            </p>
        </section>
        <!-- END: Card Header -->

        <!-- BEGIN: Messages -->
        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="px-6 fade-in-up-delay-1">
                <div class="mobile-alert mobile-alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </div>
        </#if>
        <!-- END: Messages -->

        <!-- BEGIN: Login Form -->
        <#if realm.password>
            <form id="kc-form-login" class="px-6 pb-8 fade-in-up-delay-2" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" novalidate="novalidate">
                <!-- Email Field -->
                <div class="mb-6">
                    <label class="block text-sm font-semibold text-gray-700 mb-3" for="username">
                        <#if !realm.loginWithEmailAllowed>Employee ID<#elseif !realm.registrationEmailAsUsername>Employee ID or Email<#else>Work Email</#if>
                    </label>
                    <div class="relative">
                        <div class="mobile-input-icon">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="mobile-input w-full <#if messagesPerField.existsError('username','password')>mobile-input-error</#if>"
                            id="username"
                            name="username"
                            placeholder="Enter your employee credentials"
                            type="text"
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
                        <label class="block text-sm font-semibold text-gray-700" for="password">Password</label>
                        <#if realm.resetPasswordAllowed>
                            <a class="text-sm font-medium text-blue-600 hover:text-blue-500" href="${url.loginResetCredentialsUrl}">Forgot?</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <div class="mobile-input-icon">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="mobile-input w-full pr-14 <#if messagesPerField.existsError('username','password')>mobile-input-error</#if>"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            tabindex="2"
                        />
                        <div class="absolute inset-y-0 right-0 pr-4 flex items-center cursor-pointer" id="passwordToggle">
                            <svg class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                                <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                    </div>
                </div>

                <!-- Remember Me -->
                <#if realm.rememberMe && !usernameHidden??>
                    <div class="flex items-center mb-8">
                        <input
                            class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                            id="rememberMe"
                            name="rememberMe"
                            type="checkbox"
                            tabindex="3"
                            <#if login.rememberMe??>checked</#if>
                        />
                        <label class="ml-3 block text-sm text-gray-700" for="rememberMe">Keep me signed in</label>
                    </div>
                </#if>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <!-- Submit Button -->
                <button
                    class="mobile-button w-full flex justify-center items-center"
                    type="submit"
                    name="login"
                    id="kc-login"
                    tabindex="4"
                >
                    <span id="login-text">Sign In to Portal</span>
                    <svg id="login-icon" class="ml-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                    </svg>
                </button>
            </form>
        </#if>
        <!-- END: Login Form -->

        <!-- BEGIN: Card Footer -->
        <footer class="bg-gray-50 px-6 py-4 border-t border-gray-100">
            <div class="flex justify-between items-center text-xs text-gray-500 mb-4">
                <div class="flex items-center">
                    <svg class="w-3 h-3 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                    </svg>
                    Secure Connection
                </div>
                <a class="font-medium text-blue-600 hover:text-blue-500" href="#">Need Help?</a>
            </div>

            <#if realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center pt-4 border-t border-gray-200">
                    <p class="text-sm text-gray-600 mb-3">New employee?</p>
                    <a href="${url.registrationUrl}" class="inline-flex items-center justify-center w-full py-3 px-4 border-2 border-blue-600 rounded-2xl text-sm font-semibold text-blue-600 bg-white hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-all duration-200">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                        Create Employee Account
                    </a>
                </div>
            </#if>
        </footer>
        <!-- END: Card Footer -->
    </main>
    <!-- END: Main Login Card -->

    <!-- BEGIN: Bottom Links -->
    <footer class="mt-8 text-center">
        <div class="flex justify-center space-x-6 text-xs text-white opacity-80">
            <a class="hover:opacity-100 transition-opacity" href="#">Privacy</a>
            <a class="hover:opacity-100 transition-opacity" href="#">Support</a>
            <a class="hover:opacity-100 transition-opacity" href="#">Terms</a>
        </div>
        <div class="mt-2 text-xs text-white opacity-60">© 2024 JUST HR</div>
    </footer>
    <!-- END: Bottom Links -->

    <script>
        // Password toggle functionality
        document.addEventListener('DOMContentLoaded', function() {
            const passwordToggle = document.getElementById('passwordToggle');
            const passwordInput = document.getElementById('password');

            if (passwordToggle && passwordInput) {
                passwordToggle.addEventListener('click', function(e) {
                    e.preventDefault();

                    const isPassword = passwordInput.type === 'password';
                    passwordInput.type = isPassword ? 'text' : 'password';

                    // Update icon
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

            // Add loading state to submit button
            const submitButton = document.getElementById('kc-login');
            const loginForm = document.getElementById('kc-form-login');
            const loginText = document.getElementById('login-text');
            const loginIcon = document.getElementById('login-icon');

            if (submitButton && loginForm) {
                loginForm.addEventListener('submit', function() {
                    submitButton.disabled = true;
                    submitButton.style.opacity = '0.7';
                    loginText.textContent = 'Signing In...';
                    loginIcon.innerHTML = `
                        <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
                        <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    `;
                    loginIcon.classList.add('loading-spinner');
                });
            }

            // Prevent zoom on input focus (iOS)
            const inputs = document.querySelectorAll('input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.fontSize = '16px';
                });
            });
        });
    </script>
</div>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div class="text-center mt-6 p-4 bg-white bg-opacity-90 rounded-2xl mx-4">
            <p class="text-gray-600 text-sm mb-3">
                New to the team?
            </p>
            <a href="${url.registrationUrl}" class="inline-flex items-center justify-center w-full py-3 px-4 border-2 border-blue-600 rounded-2xl text-sm font-semibold text-blue-600 bg-white hover:bg-blue-50 transition-all duration-200">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                </svg>
                Create Employee Account
            </a>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
