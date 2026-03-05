<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>

<#if section = "header">
    <title>JUST HR - Employee Registration</title>
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
            background: linear-gradient(135deg, #10b981 0%, #059669 100%) !important;
            min-height: 100vh !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        .login-pf-page {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            background: transparent !important;
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
            background: transparent !important;
            position: relative !important;
        }

        #kc-content {
            padding: 0 !important;
            margin: 0 !important;
            width: 100% !important;
            height: 100% !important;
            background: transparent !important;
        }

        #kc-info {
            margin: 0 !important;
            padding: 0 !important;
        }
    </style>
    <style data-purpose="mobile-optimizations">
        /* Mobile-first design optimizations */
        .mobile-container {
            min-height: 100vh;
            padding: 1rem;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            position: relative;
            overflow: hidden;
            padding-top: 2rem;
        }

        .mobile-card {
            width: 100%;
            max-width: 420px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
            margin-bottom: 2rem;
        }

        .floating-elements {
            position: absolute;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .floating-shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            animation: float 8s ease-in-out infinite;
        }

        .floating-shape:nth-child(1) {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            top: 15%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-shape:nth-child(2) {
            width: 80px;
            height: 80px;
            border-radius: 20px;
            top: 25%;
            right: 15%;
            animation-delay: 2s;
        }

        .floating-shape:nth-child(3) {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            bottom: 40%;
            left: 20%;
            animation-delay: 4s;
        }

        .floating-shape:nth-child(4) {
            width: 70px;
            height: 70px;
            border-radius: 15px;
            bottom: 20%;
            right: 10%;
            animation-delay: 1s;
        }

        /* Touch-optimized form elements */
        .mobile-input {
            height: 52px !important;
            font-size: 16px !important; /* Prevents zoom on iOS */
            border-radius: 14px !important;
            padding-left: 52px !important;
            padding-right: 16px !important;
            border: 2px solid #e5e7eb !important;
            background: #ffffff !important;
            transition: all 0.3s ease !important;
        }

        .mobile-input:focus {
            border-color: #10b981 !important;
            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1) !important;
            transform: translateY(-1px) !important;
        }

        .mobile-input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            color: #9ca3af;
        }

        .mobile-button {
            height: 52px !important;
            border-radius: 14px !important;
            font-size: 16px !important;
            font-weight: 600 !important;
            background: linear-gradient(135deg, #10b981 0%, #059669 100%) !important;
            border: none !important;
            color: white !important;
            transition: all 0.3s ease !important;
            touch-action: manipulation;
        }

        .mobile-button:hover, .mobile-button:active {
            transform: translateY(-2px) !important;
            box-shadow: 0 8px 25px rgba(16, 185, 129, 0.3) !important;
        }

        .mobile-button:disabled {
            opacity: 0.6 !important;
            transform: none !important;
            box-shadow: none !important;
            background: #9ca3af !important;
        }

        /* Form layout for mobile */
        .form-row {
            display: flex;
            gap: 12px;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1;
        }

        .form-group-full {
            width: 100%;
            margin-bottom: 20px;
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
            50% { transform: translateY(-15px) rotate(180deg); }
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
            font-size: 12px;
            margin-top: 6px;
            padding-left: 12px;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        /* Message styles */
        .mobile-alert {
            padding: 14px;
            border-radius: 14px;
            margin-bottom: 16px;
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

        /* Password strength indicator */
        .password-strength {
            margin-top: 8px;
            padding: 8px 12px;
            border-radius: 8px;
            background: #f9fafb;
            border: 1px solid #e5e7eb;
        }

        .strength-item {
            display: flex;
            align-items: center;
            font-size: 11px;
            margin-bottom: 4px;
        }

        .strength-item:last-child {
            margin-bottom: 0;
        }

        .strength-check {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-right: 6px;
            background: #e5e7eb;
            transition: all 0.2s ease;
        }

        .strength-check.valid {
            background: #10b981;
        }

        .strength-text {
            color: #6b7280;
        }

        .strength-text.valid {
            color: #059669;
        }

        /* Safe area handling for notched devices */
        @supports (padding: max(0px)) {
            .mobile-container {
                padding-top: max(2rem, env(safe-area-inset-top) + 1rem);
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
        <div class="floating-shape"></div>
        <div class="floating-shape"></div>
        <div class="floating-shape"></div>
        <div class="floating-shape"></div>
    </div>
    <!-- END: Floating Background Elements -->

    <!-- BEGIN: Main Registration Card -->
    <main class="mobile-card z-10">
        <!-- BEGIN: Card Header -->
        <section class="pt-6 pb-4 px-6 text-center fade-in-up">
            <!-- Employee Icon -->
            <div class="flex justify-center mb-4">
                <div class="w-14 h-14 bg-gradient-to-br from-green-500 to-emerald-600 rounded-full flex items-center justify-center text-white shadow-lg">
                    <svg class="h-7 w-7" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1a1 1 0 102 0V7zM12 7a1 1 0 112 0v1a1 1 0 11-2 0V7zM16 3a1 1 0 10-2 0v1a1 1 0 102 0V3zM12 3a1 1 0 112 0v1a1 1 0 11-2 0V3z"></path>
                    </svg>
                </div>
            </div>

            <!-- Brand and Title -->
            <div class="mb-2">
                <h1 class="text-xl font-bold text-gray-900 mb-1">JUST HR</h1>
                <p class="text-lg font-semibold text-gray-700">Employee Registration</p>
            </div>

            <!-- Registration Badge -->
            <div class="inline-flex items-center px-3 py-1 bg-green-50 text-green-700 text-xs font-medium rounded-full border border-green-100 mb-3">
                <svg class="w-3 h-3 mr-1" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3z"></path>
                </svg>
                Join the Team
            </div>

            <p class="text-sm text-gray-600">
                Create your employee account to get started.
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

        <!-- BEGIN: Registration Form -->
        <form id="kc-register-form" class="px-6 pb-6 fade-in-up-delay-2" action="${url.registrationAction}" method="post" novalidate="novalidate">
            <!-- Name Fields Row -->
            <div class="form-row">
                <div class="form-group">
                    <label class="block text-sm font-semibold text-gray-700 mb-2" for="firstName">
                        First Name
                    </label>
                    <div class="relative">
                        <div class="mobile-input-icon">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="mobile-input w-full <#if messagesPerField.existsError('firstName')>mobile-input-error</#if>"
                            id="firstName"
                            name="firstName"
                            placeholder="John"
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
                        Last Name
                    </label>
                    <div class="relative">
                        <div class="mobile-input-icon">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            class="mobile-input w-full <#if messagesPerField.existsError('lastName')>mobile-input-error</#if>"
                            id="lastName"
                            name="lastName"
                            placeholder="Doe"
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
            <div class="form-group-full">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="email">
                    Work Email
                </label>
                <div class="relative">
                    <div class="mobile-input-icon">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
                            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
                        </svg>
                    </div>
                    <input
                        class="mobile-input w-full <#if messagesPerField.existsError('email')>mobile-input-error</#if>"
                        id="email"
                        name="email"
                        placeholder="john.doe@company.com"
                        type="email"
                        value="${(register.formData.email!'')}"
                        autocomplete="email"
                        tabindex="3"
                        required
                    />
                </div>
                <div class="error-message" id="emailError">Please enter a valid work email address.</div>
                <#if messagesPerField.existsError('email')>
                    <div class="error-message show">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Password Field -->
            <div class="form-group-full">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="password">
                    Create Password
                </label>
                <div class="relative">
                    <div class="mobile-input-icon">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                    <input
                        class="mobile-input w-full pr-12 <#if messagesPerField.existsError('password')>mobile-input-error</#if>"
                        id="password"
                        name="password"
                        type="password"
                        placeholder="Create a strong password"
                        autocomplete="new-password"
                        tabindex="4"
                        required
                    />
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer" id="passwordToggle">
                        <svg class="h-4 w-4 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                            <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                </div>

                <!-- Password Strength Indicator -->
                <div class="password-strength" id="passwordStrength" style="display: none;">
                    <div class="strength-item">
                        <div class="strength-check" id="lengthCheck"></div>
                        <span class="strength-text" id="lengthText">At least 8 characters</span>
                    </div>
                    <div class="strength-item">
                        <div class="strength-check" id="uppercaseCheck"></div>
                        <span class="strength-text" id="uppercaseText">One uppercase letter</span>
                    </div>
                    <div class="strength-item">
                        <div class="strength-check" id="lowercaseCheck"></div>
                        <span class="strength-text" id="lowercaseText">One lowercase letter</span>
                    </div>
                    <div class="strength-item">
                        <div class="strength-check" id="specialCheck"></div>
                        <span class="strength-text" id="specialText">One special character</span>
                    </div>
                </div>

                <#if messagesPerField.existsError('password')>
                    <div class="error-message show">
                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Confirm Password Field -->
            <div class="form-group-full">
                <label class="block text-sm font-semibold text-gray-700 mb-2" for="password-confirm">
                    Confirm Password
                </label>
                <div class="relative">
                    <div class="mobile-input-icon">
                        <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                    <input
                        class="mobile-input w-full pr-12 <#if messagesPerField.existsError('password-confirm')>mobile-input-error</#if>"
                        id="password-confirm"
                        name="password-confirm"
                        type="password"
                        placeholder="Confirm your password"
                        autocomplete="new-password"
                        tabindex="5"
                        required
                    />
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center cursor-pointer" id="passwordConfirmToggle">
                        <svg class="h-4 w-4 text-gray-400 hover:text-gray-600" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
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
                class="mobile-button w-full flex justify-center items-center mt-6"
                type="submit"
                name="register"
                id="kc-register"
                tabindex="6"
                disabled
            >
                <span id="register-text">Create Employee Account</span>
                <svg id="register-icon" class="ml-2 h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                </svg>
            </button>
        </form>
        <!-- END: Registration Form -->

        <!-- BEGIN: Card Footer -->
        <footer class="bg-gray-50 px-6 py-4 border-t border-gray-100">
            <div class="flex justify-between items-center text-xs text-gray-500">
                <div class="flex items-center">
                    <svg class="w-3 h-3 text-green-500 mr-1" fill="currentColor" viewBox="0 0 20 20">
                        <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                    </svg>
                    Secure Registration
                </div>
                <div>
                    Already have an account?
                    <a class="font-medium text-green-600 hover:text-green-500 ml-1" href="${url.loginUrl}">Sign In</a>
                </div>
            </div>
        </footer>
        <!-- END: Card Footer -->
    </main>
    <!-- END: Main Registration Card -->

    <!-- BEGIN: Bottom Links -->
    <footer class="text-center">
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

            // Password strength validation
            function updatePasswordStrength(password) {
                const strengthIndicator = document.getElementById('passwordStrength');
                const lengthCheck = document.getElementById('lengthCheck');
                const lengthText = document.getElementById('lengthText');
                const uppercaseCheck = document.getElementById('uppercaseCheck');
                const uppercaseText = document.getElementById('uppercaseText');
                const lowercaseCheck = document.getElementById('lowercaseCheck');
                const lowercaseText = document.getElementById('lowercaseText');
                const specialCheck = document.getElementById('specialCheck');
                const specialText = document.getElementById('specialText');

                if (password.length > 0) {
                    strengthIndicator.style.display = 'block';

                    // Check length
                    if (password.length >= 8) {
                        lengthCheck.classList.add('valid');
                        lengthText.classList.add('valid');
                    } else {
                        lengthCheck.classList.remove('valid');
                        lengthText.classList.remove('valid');
                    }

                    // Check uppercase
                    if (/[A-Z]/.test(password)) {
                        uppercaseCheck.classList.add('valid');
                        uppercaseText.classList.add('valid');
                    } else {
                        uppercaseCheck.classList.remove('valid');
                        uppercaseText.classList.remove('valid');
                    }

                    // Check lowercase
                    if (/[a-z]/.test(password)) {
                        lowercaseCheck.classList.add('valid');
                        lowercaseText.classList.add('valid');
                    } else {
                        lowercaseCheck.classList.remove('valid');
                        lowercaseText.classList.remove('valid');
                    }

                    // Check special character
                    if (/[^a-zA-Z0-9]/.test(password)) {
                        specialCheck.classList.add('valid');
                        specialText.classList.add('valid');
                    } else {
                        specialCheck.classList.remove('valid');
                        specialText.classList.remove('valid');
                    }
                } else {
                    strengthIndicator.style.display = 'none';
                }
            }

            // Validation functions
            function validateFirstName() {
                const input = document.getElementById('firstName');
                const error = document.getElementById('firstNameError');
                const isValid = input.value.trim().length > 0;

                if (input.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    input.classList.add('mobile-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('mobile-input-error');
                }

                return isValid;
            }

            function validateLastName() {
                const input = document.getElementById('lastName');
                const error = document.getElementById('lastNameError');
                const isValid = input.value.trim().length > 0;

                if (input.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    input.classList.add('mobile-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('mobile-input-error');
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
                    input.classList.add('mobile-input-error');
                } else {
                    error.classList.remove('show');
                    input.classList.remove('mobile-input-error');
                }

                return isValid;
            }

            function validatePassword() {
                const input = document.getElementById('password');
                const password = input.value;

                updatePasswordStrength(password);

                const hasLength = password.length >= 8;
                const hasUppercase = /[A-Z]/.test(password);
                const hasLowercase = /[a-z]/.test(password);
                const hasSpecial = /[^a-zA-Z0-9]/.test(password);

                const isValid = hasLength && hasUppercase && hasLowercase && hasSpecial;

                if (password.length > 0 && !isValid) {
                    input.classList.add('mobile-input-error');
                } else {
                    input.classList.remove('mobile-input-error');
                }

                return isValid;
            }

            function validatePasswordConfirm() {
                const passwordInput = document.getElementById('password');
                const confirmInput = document.getElementById('password-confirm');
                const error = document.getElementById('passwordConfirmError');
                const isValid = confirmInput.value === passwordInput.value;

                if (confirmInput.value.length > 0 && !isValid) {
                    error.classList.add('show');
                    confirmInput.classList.add('mobile-input-error');
                } else {
                    error.classList.remove('show');
                    confirmInput.classList.remove('mobile-input-error');
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
                const registerText = document.getElementById('register-text');
                const registerIcon = document.getElementById('register-icon');

                registerBtn.disabled = true;
                registerBtn.style.opacity = '0.7';
                registerText.textContent = 'Creating Account...';
                registerIcon.innerHTML = `
                    <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none"></circle>
                    <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                `;
                registerIcon.classList.add('loading-spinner');
            });

            // Prevent zoom on input focus (iOS)
            const inputs = document.querySelectorAll('input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.style.fontSize = '16px';
                });
            });

            // Initial validation check
            validateForm();
        });
    </script>
</div>

</#if>

</@layout.registrationLayout>
