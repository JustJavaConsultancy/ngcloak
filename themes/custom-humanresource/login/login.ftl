<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
    <title>JUST HR - Workforce Manager Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
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

        /* Reset Keycloak page structure */
        .login-pf-page {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            background: none !important;
            min-height: 100vh !important;
        }

        .login-pf-page .card-pf {
            padding: 0 !important;
            margin: 0 !important;
            border: none !important;
            max-width: none !important;
            background: none !important;
            box-shadow: none !important;
            border-top: none !important;
        }

        #kc-content-wrapper {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            height: 100vh !important;
            overflow: auto !important;
        }

        #kc-content {
            padding: 0 !important;
            margin: 0 !important;
            width: 100% !important;
            height: 100% !important;
        }

        #kc-info {
            margin: 0 !important;
        }

        /* CSS Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            margin: 0 !important;
            padding: 0 !important;
            font-family: "Inter", sans-serif !important;
            background-color: #f9fafb !important;
            -webkit-font-smoothing: antialiased !important;
            -moz-osx-font-smoothing: grayscale !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        /* Background watermark styles */
        .bg-shield-watermark {
            position: fixed;
            bottom: -40px;
            left: 5%;
            width: 300px;
            height: 350px;
            color: #e5e7eb;
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
            color: #e5e7eb;
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

        /* Main container */
        .main-container {
            background-color: #f9fafb;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            position: relative;
            overflow: hidden;
        }

        /* Login card */
        .login-card {
            width: 100%;
            max-width: 480px;
            background-color: white;
            border-radius: 1rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            overflow: hidden;
            z-index: 10;
            animation: fadeInScale 0.6s ease-out;
        }

        /* Card header */
        .card-header {
            padding: 2.5rem 2rem 1.5rem;
            text-align: center;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .shield-icon-container {
            display: flex;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .shield-icon {
            width: 3.5rem;
            height: 3.5rem;
            background-color: #dbeafe;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #2563eb;
            animation: pulse 2s infinite;
        }

        .brand-container {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            margin-bottom: 0.25rem;
        }

        .brand-icon {
            width: 1.5rem;
            height: 1.5rem;
            color: #2563eb;
        }

        .brand-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #111827;
            letter-spacing: -0.025em;
        }

        .brand-subtitle {
            font-size: 1.25rem;
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.75rem;
        }

        .secure-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            background-color: #f0fdf4;
            color: #16a34a;
            font-size: 0.75rem;
            font-weight: 700;
            border-radius: 9999px;
            border: 1px solid #bbf7d0;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .secure-badge svg {
            width: 0.75rem;
            height: 0.75rem;
            margin-right: 0.25rem;
        }

        .auth-description {
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: #6b7280;
        }

        /* Form styles */
        .login-form {
            padding: 0 2.5rem 2.5rem;
            animation: slideInFromLeft 0.8s ease-out 0.4s both;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .input-container {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            width: 1.25rem;
            height: 1.25rem;
            color: #9ca3af;
            pointer-events: none;
            transition: color 0.2s ease-in-out;
        }

        .form-input {
            display: block;
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            color: #111827;
            background-color: white;
            transition: all 0.2s ease-in-out;
            outline: none;
        }

        .form-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .form-input:focus + .input-icon {
            color: #3b82f6;
        }

        .form-input::placeholder {
            color: #9ca3af;
        }

        .password-container {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            padding: 0.25rem;
            color: #9ca3af;
            transition: color 0.2s ease-in-out;
        }

        .password-toggle:hover {
            color: #6b7280;
        }

        .password-toggle svg {
            width: 1.25rem;
            height: 1.25rem;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
        }

        .checkbox-input {
            width: 1rem;
            height: 1rem;
            color: #3b82f6;
            border: 1px solid #d1d5db;
            border-radius: 0.25rem;
            margin-right: 0.5rem;
        }

        .checkbox-input:focus {
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .checkbox-label {
            font-size: 0.875rem;
            color: #374151;
        }

        .forgot-password {
            font-size: 0.75rem;
            font-weight: 600;
            color: #3b82f6;
            text-decoration: none;
            transition: color 0.2s ease-in-out;
        }

        .forgot-password:hover {
            color: #2563eb;
        }

        .submit-button {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 1rem;
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            font-size: 1rem;
            font-weight: 700;
            color: white;
            background-color: #3b82f6;
            cursor: pointer;
            transition: all 0.2s ease-in-out;
        }

        .submit-button:hover {
            background-color: #2563eb;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }

        .submit-button:active {
            transform: translateY(0);
        }

        .submit-button svg {
            margin-left: 0.5rem;
            width: 1.25rem;
            height: 1.25rem;
        }

        /* Card footer */
        .card-footer {
            background-color: #f9fafb;
            padding: 1.25rem 2.5rem;
            border-top: 1px solid #f3f4f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
            animation: fadeInUp 0.8s ease-out 0.6s both;
        }

        .encryption-badge {
            display: flex;
            align-items: center;
            font-size: 0.75rem;
            font-weight: 500;
            color: #6b7280;
        }

        .encryption-badge svg {
            width: 1rem;
            height: 1rem;
            color: #22c55e;
            margin-right: 0.25rem;
        }

        .support-link {
            font-size: 0.75rem;
            font-weight: 600;
            color: #3b82f6;
            text-decoration: none;
            transition: color 0.2s ease-in-out;
        }

        .support-link:hover {
            color: #2563eb;
        }

        /* Page footer */
        .page-footer {
            width: 100%;
            max-width: 64rem;
            margin-top: 3rem;
            padding: 0 1rem;
            display: flex;
            flex-direction: column;
            justify-content: between;
            align-items: center;
            font-size: 0.625rem;
            font-weight: 700;
            color: #9ca3af;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            gap: 1rem;
            animation: fadeInUp 1s ease-out 0.8s both;
        }

        .footer-links {
            display: flex;
            gap: 1.5rem;
        }

        .footer-link {
            color: #9ca3af;
            text-decoration: none;
            transition: color 0.2s ease-in-out;
        }

        .footer-link:hover {
            color: #6b7280;
        }

        .copyright {
            text-align: center;
        }

        /* Error styles */
        .form-input.error {
            border-color: #ef4444;
        }

        .form-input.error:focus {
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
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

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 1rem;
            }

            .login-card {
                max-width: 100%;
            }

            .card-header {
                padding: 2rem 1.5rem 1rem;
            }

            .login-form {
                padding: 0 1.5rem 2rem;
            }

            .card-footer {
                padding: 1rem 1.5rem;
                flex-direction: column;
                gap: 0.75rem;
                text-align: center;
            }

            .page-footer {
                margin-top: 2rem;
                font-size: 0.625rem;
            }

            .footer-links {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .form-options {
                flex-direction: column;
                gap: 0.75rem;
                align-items: flex-start;
            }
        }

        @media (max-width: 480px) {
            .main-container {
                padding: 0.75rem;
            }

            .card-header {
                padding: 1.5rem 1rem 0.75rem;
            }

            .login-form {
                padding: 0 1rem 1.5rem;
            }

            .brand-title {
                font-size: 1.25rem;
            }

            .brand-subtitle {
                font-size: 1.125rem;
            }

            .form-input {
                font-size: 16px; /* Prevent zoom on iOS */
            }
        }
    </style>

<#elseif section = "form">

<div class="main-container">
    <!-- Background Watermarks -->
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

    <!-- Main Login Card -->
    <main class="login-card">
        <!-- Card Header -->
        <section class="card-header">
            <!-- Top Shield Icon -->
            <div class="shield-icon-container">
                <div class="shield-icon">
                    <svg class="h-8 w-8" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path clip-rule="evenodd" d="M2.166 4.999A11.954 11.954 0 0010 1.944 11.954 11.954 0 0017.834 5c.11.65.166 1.32.166 2.001 0 5.225-3.34 9.67-8 11.317C5.34 16.67 2 12.225 2 7c0-.682.057-1.35.166-2.001zm11.541 3.708a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                    </svg>
                </div>
            </div>
            <!-- Brand and Subtitle -->
            <div class="brand-container">
                <svg class="brand-icon" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 6a3 3 0 013-3h10a1 1 0 01.8 1.6L14.25 8l2.55 3.4a1 1 0 01-.8 1.6H6a3 3 0 01-3-3V6z"></path>
                </svg>
                <h1 class="brand-title">JUST HR</h1>
            </div>
            <p class="brand-subtitle">Workforce Manager</p>
            <!-- Secure Portal Badge -->
            <div class="secure-badge">
                <svg fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                </svg>
                Secure Portal
            </div>
            <p class="auth-description">
                Authorized access only. Please enter your credentials below.
            </p>
        </section>

        <!-- Login Form -->
        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div style="padding: 0 2.5rem;">
                <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </div>
        </#if>

        <#if realm.password>
            <form id="kc-form-login" class="login-form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" novalidate="novalidate">
                <!-- Email Field -->
                <div class="form-group">
                    <label for="username" class="form-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="input-container">
                        <svg class="input-icon" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" fill-rule="evenodd"></path>
                        </svg>
                        <input
                            class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
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
                <div class="form-group">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                        <label class="form-label" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a class="forgot-password" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                    <div class="input-container password-container">
                        <svg class="input-icon" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" fill-rule="evenodd"></path>
                        </svg>
                        <input
                            class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            tabindex="2"
                            style="padding-right: 2.5rem;"
                        />
                        <button type="button" class="password-toggle" id="passwordToggle">
                            <svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                                <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                            </svg>
                        </button>
                    </div>
                </div>

                <!-- Remember Device -->
                <div class="form-options">
                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="checkbox-container">
                            <input
                                class="checkbox-input"
                                id="rememberMe"
                                name="rememberMe"
                                type="checkbox"
                                tabindex="3"
                                <#if login.rememberMe??>checked</#if>
                            />
                            <label class="checkbox-label" for="rememberMe">${msg("rememberMe")}</label>
                        </div>
                    <#else>
                        <div></div>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <!-- Submit Button -->
                <button class="submit-button" type="submit" name="login" id="kc-login" tabindex="4">
                    ${msg("doLogIn")}
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
                    </svg>
                </button>
            </form>
        </#if>

        <!-- Card Footer -->
        <footer class="card-footer">
            <div class="encryption-badge">
                <svg fill="currentColor" viewBox="0 0 20 20">
                    <path clip-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" fill-rule="evenodd"></path>
                </svg>
                256-bit Encryption
            </div>
            <a class="support-link" href="#">Contact Support</a>
        </footer>
    </main>

    <!-- Page Footer -->
    <footer class="page-footer">
        <div class="footer-links">
            <a class="footer-link" href="#">Privacy Policy</a>
            <a class="footer-link" href="#">Terms of Use</a>
            <a class="footer-link" href="#">System Status</a>
        </div>
        <div class="copyright">© 2024 JUST HR. ALL RIGHTS RESERVED.</div>
    </footer>
</div>

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
                        <path d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 11-4.243-4.243m4.242 4.242L9.88 9.88" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" fill="none" stroke="currentColor"/>
                    `;
                } else {
                    // Show "eye" icon when password is hidden
                    icon.innerHTML = `
                        <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                        <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd" fill="currentColor"></path>
                    `;
                }
            });
        }

        // Add subtle hover animations to form elements
        const formInputs = document.querySelectorAll('.form-input');
        formInputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.style.transform = 'translateY(-1px)';
            });

            input.addEventListener('blur', function() {
                this.style.transform = 'translateY(0)';
            });
        });

        // Add loading state to submit button
        const submitButton = document.getElementById('kc-login');
        const loginForm = document.getElementById('kc-form-login');

        if (submitButton && loginForm) {
            loginForm.addEventListener('submit', function() {
                submitButton.disabled = true;
                submitButton.style.opacity = '0.7';
                submitButton.innerHTML = `
                    <svg style="animation: spin 1s linear infinite; width: 1.25rem; height: 1.25rem; margin-right: 0.5rem;" fill="none" viewBox="0 0 24 24">
                        <circle style="opacity: 0.25;" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path style="opacity: 0.75;" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    Signing In...
                `;
            });
        }
    });

    // Add CSS for spin animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
    `;
    document.head.appendChild(style);
</script>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div id="kc-registration-container">
            <div id="kc-registration">
                <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
