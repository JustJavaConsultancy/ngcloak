<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>

<#if section = "header">
    <title>JUST HR - Workforce Manager Registration</title>
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
        .login-pf-page .card-pf .card-pf-title,
        #kc-info-wrapper {
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
        .register-container {
            animation: fadeInScale 0.6s ease-out;
        }

        .card-header {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .register-form {
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
            display: none;
        }

        .error-message.show {
            display: block;
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

        /* Form row for side-by-side fields */
        .form-row {
            display: flex;
            gap: 1rem;
        }

        .form-row .form-group {
            flex: 1;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 0;
            }
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

    <!-- BEGIN: Main Registration Card -->
    <main class="w-full max-w-[520px] bg-white rounded-2xl shadow-2xl overflow-hidden z-10 register-container">
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
            <!-- Registration Badge -->
            <div class="inline-flex items-center px-3 py-1 bg-green-50 text-green-600 text-xs font-bold rounded-full border border-green-100 uppercase tracking-wider">
                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1a1 1 0 102 0V7zM12 7a1 1 0 112 0v1a1 1 0 11-2 0V7zM16 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM12 3a1 1 0 112 0v1a1 1 0 11-2 0V3z"></path>
                </svg>
                New Account
            </div>
            <p class="mt-6 text-sm text-gray-500">
                Create your account to access the workforce management system.
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

        <!-- BEGIN: Registration Form -->
        <form id="kc-register-form" class="px-10 pb-10 register-form" action="${url.registrationAction}" method="post" novalidate="novalidate">
            <!-- Name Fields Row -->
            <div class="form-row mb-5">
                <div class="form-group">
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="firstName">
                        ${msg("firstName")}
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 placeholder-gray-400 sm:text-sm form-input <#if messagesPerField.existsError('firstName')>form-input-error</#if>"
                            id="firstName"
                            name="firstName"
                            placeholder="First name"
                            type="text"
                            value="${(register.formData.firstName!'')}"
                            autofocus
                            autocomplete="given-name"
                            tabindex="1"
                            required
                        />
                    </div>
                    <div class="error-message" id="firstNameError">Please enter your first name.</div>
                    <#if messagesPerField.existsError('firstName')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div class="form-group">
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="lastName">
                        ${msg("lastName")}
                    </label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 placeholder-gray-400 sm:text-sm form-input <#if messagesPerField.existsError('lastName')>form-input-error</#if>"
                            id="lastName"
                            name="lastName"
                            placeholder="Last name"
                            type="text"
                            value="${(register.formData.lastName!'')}"
                            autocomplete="family-name"
                            tabindex="2"
                            required
                        />
                    </div>
                    <div class="error-message" id="lastNameError">Please enter your last name.</div>
                    <#if messagesPerField.existsError('lastName')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </div>
                    </#if>
                </div>
            </div>

            <!-- Email Field -->
            <div class="mb-5">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="email">
                    ${msg("email")}
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
                        </svg>
                    </div>
                    <input
                        class="block w-full pl-10 pr-3 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 placeholder-gray-400 sm:text-sm form-input <#if messagesPerField.existsError('email')>form-input-error</#if>"
                        id="email"
                        name="email"
                        placeholder="e.g. john.doe@company.com"
                        type="email"
                        value="${(register.formData.email!'')}"
                        autocomplete="email"
                        tabindex="3"
                        required
                    />
                </div>
                <div class="error-message" id="emailError">Please enter a valid email address.</div>
                <#if messagesPerField.existsError('email')>
                    <div class="error-message show">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Password Field -->
            <div class="mb-5">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="password">
                    ${msg("password")}
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                    <input
                        class="block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 sm:text-sm form-input <#if messagesPerField.existsError('password')>form-input-error</#if>"
                        id="password"
                        name="password"
                        type="password"
                        placeholder="Create a strong password"
                        autocomplete="new-password"
                        tabindex="4"
                        required
                    />
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer" id="passwordToggle">
                        <svg class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                            <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>
                <div class="error-message" id="passwordLengthError">Password must be at least 8 characters long.</div>
                <div class="error-message" id="passwordUppercaseError">Password must contain at least one uppercase letter.</div>
                <div class="error-message" id="passwordLowercaseError">Password must contain at least one lowercase letter.</div>
                <div class="error-message" id="passwordSpecialError">Password must contain at least one special character.</div>
                <#if messagesPerField.existsError('password')>
                    <div class="error-message show">
                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Confirm Password Field -->
            <div class="mb-8">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="password-confirm">
                    ${msg("passwordConfirm")}
                </label>
                <div class="relative">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <svg class="h-5 w-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                    <input
                        class="block w-full pl-10 pr-10 py-3 border border-gray-300 rounded-lg focus:ring-blue-500 focus:border-blue-500 text-gray-900 sm:text-sm form-input <#if messagesPerField.existsError('password-confirm')>form-input-error</#if>"
                        id="password-confirm"
                        name="password-confirm"
                        type="password"
                        placeholder="Confirm your password"
                        autocomplete="new-password"
                        tabindex="5"
                        required
                    />
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer" id="passwordConfirmToggle">
                        <svg class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                            <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>
                <div class="error-message" id="passwordConfirmError">Passwords do not match.</div>
                <#if messagesPerField.existsError('password-confirm')>
                    <div class="error-message show">
                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Submit Button -->
            <button
                class="w-full flex justify-center items-center py-4 px-4 border border-transparent rounded-lg shadow-lg text-base font-bold text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200 disabled:opacity-50 disabled:cursor-not-allowed"
                type="submit"
                name="register"
                id="kc-register"
                tabindex="6"
                disabled
            >
                Create Account
                <svg class="ml-2 h-5 w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                </svg>
            </button>
        </form>
        <!-- END: Registration Form -->

        <!-- BEGIN: Card Footer -->
        <footer class="bg-gray-50 px-10 py-5 border-t border-gray-100 flex justify-between items-center card-footer">
            <div class="flex items-center text-xs font-medium text-gray-500">
                <svg class="w-4 h-4 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                </svg>
                256-bit Encryption
            </div>
            <div class="text-xs font-medium text-gray-500">
                Already have an account?
                <a class="font-semibold text-blue-600 hover:text-blue-500 ml-1" href="${url.loginUrl}">Sign In</a>
            </div>
        </footer>
        <!-- END: Card Footer -->
    </main>
    <!-- END: Main Registration Card -->

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
            const passwordConfirmToggle = document.getElementById('passwordConfirmToggle');
            const passwordConfirmInput = document.getElementById('password-confirm');

            function togglePasswordVisibility(input, toggle) {
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';

                const icon = toggle.querySelector('svg');
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
            }

            if (passwordToggle && passwordInput) {
                passwordToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    togglePasswordVisibility(passwordInput, passwordToggle);
                });
            }

            if (passwordConfirmToggle && passwordConfirmInput) {
                passwordConfirmToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    togglePasswordVisibility(passwordConfirmInput, passwordConfirmToggle);
                });
            }

            // Validation functions
            function validateFirstName() {
                const input = document.getElementById('firstName');
                const error = document.getElementById('firstNameError');
                const isValid = input.value.trim().length > 0;

                if (input.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    input.classList.add('form-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('form-input-error');
                }

                return isValid;
            }

            function validateLastName() {
                const input = document.getElementById('lastName');
                const error = document.getElementById('lastNameError');
                const isValid = input.value.trim().length > 0;

                if (input.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    input.classList.add('form-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('form-input-error');
                }

                return isValid;
            }

            function validateEmail() {
                const input = document.getElementById('email');
                const error = document.getElementById('emailError');
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                const isValid = emailRegex.test(input.value);

                if (input.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    input.classList.add('form-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('form-input-error');
                }

                return isValid;
            }

            function validatePassword() {
                const input = document.getElementById('password');
                const password = input.value;

                const lengthError = document.getElementById('passwordLengthError');
                const uppercaseError = document.getElementById('passwordUppercaseError');
                const lowercaseError = document.getElementById('passwordLowercaseError');
                const specialError = document.getElementById('passwordSpecialError');

                let hasErrors = false;

                if (password.length > 0) {
                    // Check length
                    if (password.length < 8) {
                        lengthError.classList.add('show');
                        hasErrors = true;
                    } else {
                        lengthError.classList.remove('show');
                    }

                    // Check uppercase
                    if (!/[A-Z]/.test(password)) {
                        uppercaseError.classList.add('show');
                        hasErrors = true;
                    } else {
                        uppercaseError.classList.remove('show');
                    }

                    // Check lowercase
                    if (!/[a-z]/.test(password)) {
                        lowercaseError.classList.add('show');
                        hasErrors = true;
                    } else {
                        lowercaseError.classList.remove('show');
                    }

                    // Check special character
                    if (!/[^a-zA-Z0-9]/.test(password)) {
                        specialError.classList.add('show');
                        hasErrors = true;
                    } else {
                        specialError.classList.remove('show');
                    }

                    if (hasErrors) {
                        input.classList.add('form-input-error');
                    } else {
                        input.classList.remove('form-input-error');
                    }
                } else {
                    // Hide all errors when field is empty
                    lengthError.classList.remove('show');
                    uppercaseError.classList.remove('show');
                    lowercaseError.classList.remove('show');
                    specialError.classList.remove('show');
                    input.classList.remove('form-input-error');
                }

                return !hasErrors && password.length >= 8;
            }

            function validatePasswordConfirm() {
                const passwordInput = document.getElementById('password');
                const confirmInput = document.getElementById('password-confirm');
                const error = document.getElementById('passwordConfirmError');
                const isValid = confirmInput.value === passwordInput.value;

                if (confirmInput.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    confirmInput.classList.add('form-input-error');
                } else {
                    error.classList.remove('show');
                    confirmInput.classList.remove('form-input-error');
                }

                return isValid;
            }

            function validateForm() {
                const firstNameValid = validateFirstName();
                const lastNameValid = validateLastName();
                const emailValid = validateEmail();
                const passwordValid = validatePassword();
                const confirmValid = validatePasswordConfirm();

                const registerBtn = document.getElementById('kc-register');
                const allValid = firstNameValid && lastNameValid && emailValid && passwordValid && confirmValid;

                registerBtn.disabled = !allValid;

                return allValid;
            }

            // Event listeners
            document.getElementById('firstName').addEventListener('input', function() {
                validateFirstName();
                validateForm();
            });

            document.getElementById('lastName').addEventListener('input', function() {
                validateLastName();
                validateForm();
            });

            document.getElementById('email').addEventListener('input', function() {
                validateEmail();
                validateForm();
            });

            document.getElementById('password').addEventListener('input', function() {
                validatePassword();
                validatePasswordConfirm(); // Re-validate confirm password when password changes
                validateForm();
            });

            document.getElementById('password-confirm').addEventListener('input', function() {
                validatePasswordConfirm();
                validateForm();
            });

            // Form submission
            document.getElementById('kc-register-form').addEventListener('submit', function(e) {
                if (!validateForm()) {
                    e.preventDefault();
                    return;
                }

                const registerBtn = document.getElementById('kc-register');
                registerBtn.disabled = true;
                registerBtn.style.opacity = '0.7';
                registerBtn.innerHTML = `
                    <svg class="loading-spinner h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24">
                        <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Creating Account...
                `;
            });

            // Initial validation check
            validateForm();
        });
    </script>
</div>

</#if>

</@layout.registrationLayout>
