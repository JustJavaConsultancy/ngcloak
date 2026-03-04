<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
    <title>JUST HR - Workforce Manager Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style data-purpose="background-elements">
        /* Custom styles for the watermark icons to match the design's positioning and opacity */
        .bg-shield-watermark {
            position: fixed;
            bottom: -40px;
            left: 5%;
            width: 300px;
            height: 350px;
            color: #e5e7eb; /* tailwind gray-200 */
            opacity: 0.5;
            z-index: -1;
            animation: float 6s ease-in-out infinite;
        }
        .bg-building-watermark {
            position: fixed;
            top: 50px;
            right: 5%;
            width: 250px;
            height: 300px;
            color: #e5e7eb; /* tailwind gray-200 */
            opacity: 0.5;
            z-index: -1;
            animation: float 8s ease-in-out infinite reverse;
        }

        /* Animations */
        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        @keyframes slideInFromLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
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

        /* Apply animations */
        .login-container {
            animation: fadeInScale 0.6s ease-out;
        }

        .card-header {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .login-form {
            animation: slideInFromLeft 0.8s ease-out 0.4s both;
        }

        .card-footer {
            animation: fadeInUp 0.8s ease-out 0.6s both;
        }

        .page-footer {
            animation: fadeInUp 1s ease-out 0.8s both;
        }

        /* Error styles */
        .form-input-error {
            border-color: #ef4444 !important;
        }

        .form-input-error:focus {
            border-color: #ef4444 !important;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1) !important;
        }

        .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        /* Message styles */
        .alert {
            padding: 1rem;
            border-radius: 0.5rem;
            margin-bottom: 1rem;
            border: 1px solid;
            animation: fadeInUp 0.5s ease-out;
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

        /* Hover animations */
        .form-input:focus {
            transform: translateY(-1px);
            transition: all 0.2s ease-in-out;
        }

        .form-input:not(:focus) {
            transform: translateY(0);
            transition: all 0.2s ease-in-out;
        }

        .loading-spinner {
            animation: spin 1s linear infinite;
        }
    </style>

<#elseif section = "form">

<div class="bg-gray-50 min-h-screen flex flex-col items-center justify-center p-4 relative overflow-hidden">
    <!-- BEGIN: Background Watermarks -->
    <div class="bg-shield-watermark">
        <svg fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4z"></path>
        </svg>
    </div>
    <div class="bg-building-watermark">
        <svg fill="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path d="M15 11V5l-3-3-3 3v2H3v14h18V11h-6zm-8 8H5v-2h2v2zm0-4H5v-2h2v2zm0-4H5V9h2v2zm6 8h-2v-2h2v2zm0-4h-2v-2h2v2zm0-4h-2V9h2v2zm0-4h-2V5h2v2zm6 12h-2v-2h2v2zm0-4h-2v-2h2v2z"></path>
        </svg>
    </div>
    <!-- END: Background Watermarks -->

    <!-- BEGIN: Main Login Card -->
    <main class="w-full max-w-[480px] bg-white rounded-2xl shadow-2xl overflow-hidden z-10 login-container">
        <!-- BEGIN: Card Header -->
        <section class="pt-10 pb-6 px-8 text-center card-header">
            <!-- Top Shield Icon -->
            <div class="flex justify-center mb-6">
                <div class="w-14 h-14 bg-blue-100 rounded-full flex items-center justify-center text-blue-600">
                    <svg class="h-8 w-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                    </svg>
                </div>
            </div>
            <!-- Brand and Subtitle -->
            <div class="flex items-center justify-center space-x-2 mb-1">
                <svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 6a3 3 0 013-3h10a1 1 0 01.8 1.6L14.25 8l2.55 3.4a1 1 0 01-.8 1.6H6a3 3 0 01-3-3V6z"></path>
                </svg>
                <h1 class="text-2xl font-bold text-gray-900 tracking-tight">JUST HR</h1>
            </div>
            <p class="text-xl font-semibold text-gray-800 mb-3">Workforce Manager</p>
            <!-- Secure Portal Badge -->
            <div class="inline-flex items-center px-3 py-1 bg-green-50 text-green-600 text-xs font-bold rounded-full border border-green-100 uppercase tracking-wider">
                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                </svg>
                Secure Portal
            </div>
            <p class="mt-6 text-sm text-gray-500">
                Authorized access only. Please enter your credentials below.
            </p>
        </section>
        <!-- END: Card Header -->

        <!-- BEGIN: Messages -->
        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="px-10">
                <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </div>
        </#if>
        <!-- END: Messages -->

        <!-- BEGIN: Login Form -->
        <#if realm.password>
            <form id="kc-form-login" class="px-10 pb-10 login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" novalidate="novalidate">
                <!-- Email Field -->
                <div class="mb-5">
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 placeholder-gray-400 sm:text-sm form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                            id="username"
                            name="username"
                            placeholder="e.g. john.doe@company.com"
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
                <div class="mb-5">
                    <div class="flex justify-between items-center mb-2">
                        <label class="block text-sm font-semibold text-gray-700" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a class="text-xs font-semibold text-blue-600 hover:text-blue-500" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 sm:text-sm form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            tabindex="2"
                        />
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer" id="passwordToggle">
                            <svg class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
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
                            class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                            id="rememberMe"
                            name="rememberMe"
                            type="checkbox"
                            tabindex="3"
                            <#if login.rememberMe??>checked</#if>
                        />
                        <label class="ml-2 block text-sm text-gray-700" for="rememberMe">${msg("rememberMe")}</label>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <!-- Submit Button -->
                <button
                    class="w-full flex justify-center items-center py-4 px-4 border border-transparent rounded-lg shadow-lg text-base font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200"
                    type="submit"
                    name="login"
                    id="kc-login"
                    tabindex="4"
                >
                    Sign In
                    <svg class="ml-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                    </svg>
                </button>
            </form>
        </#if>
        <!-- END: Login Form -->

        <!-- BEGIN: Card Footer -->
        <footer class="bg-gray-50 px-10 py-5 border-t border-gray-100 card-footer">
            <div class="flex justify-between items-center mb-4">
                <div class="flex items-center text-xs font-medium text-gray-500">
                    <svg class="w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                    </svg>
                    256-bit Encryption
                </div>
                <a class="text-xs font-semibold text-blue-600 hover:text-blue-500" href="#">Contact Support</a>
            </div>

            <#if realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center pt-4 border-t border-gray-200">
                    <p class="text-sm text-gray-600 mb-3">Don't have an account?</p>
                    <a href="${url.registrationUrl}" class="inline-flex items-center justify-center w-full py-3 px-4 border-2 border-blue-600 rounded-lg text-sm font-semibold text-blue-600 bg-white hover:bg-blue-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200">
                        <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                        </svg>
                        Create New Account
                    </a>
                </div>
            </#if>
        </footer>
        <!-- END: Card Footer -->
    </main>
    <!-- END: Main Login Card -->

    <!-- BEGIN: Page Footer -->
    <footer class="w-full max-w-4xl mt-12 px-4 flex flex-col md:flex-row justify-between items-center text-[10px] md:text-xs font-bold text-gray-400 tracking-widest uppercase space-y-4 md:space-y-0 page-footer">
        <div class="flex space-x-6">
            <a class="hover:text-gray-600 transition-colors" href="#">Privacy Policy</a>
            <a class="hover:text-gray-600 transition-colors" href="#">Terms of Use</a>
            <a class="hover:text-gray-600 transition-colors" href="#">System Status</a>
        </div>
        <div>© 2024 JUST HR. ALL RIGHTS RESERVED.</div>
    </footer>
    <!-- END: Page Footer -->

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

            if (submitButton && loginForm) {
                loginForm.addEventListener('submit', function() {
                    submitButton.disabled = true;
                    submitButton.style.opacity = '0.7';
                    submitButton.innerHTML = `
                        <svg class="loading-spinner h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24">
                            <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                            <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                        </svg>
                        Signing In...
                    `;
                });
            }
        });
    </script>
</div>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div style="text-align: center; margin-top: 1.5rem; padding: 1rem 2.5rem; border-top: 1px solid #f3f4f6; background-color: #f9fafb;">
            <p style="color: #6b7280; font-size: 0.875rem; margin-bottom: 0.5rem;">
                ${msg("noAccount")}
            </p>
            <a href="${url.registrationUrl}" style="display: inline-flex; align-items: center; justify-content: center; padding: 0.75rem 1.5rem; border: 2px solid #3b82f6; border-radius: 0.5rem; font-size: 0.875rem; font-weight: 600; color: #3b82f6; background-color: white; text-decoration: none; transition: all 0.2s ease-in-out;">
                <svg style="width: 1rem; height: 1rem; margin-right: 0.5rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                </svg>
                ${msg("doRegister")}
            </a>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
