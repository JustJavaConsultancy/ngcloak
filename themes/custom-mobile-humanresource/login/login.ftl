<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
    <title>JUST HR - Employee App</title>
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

        /* Force our container to be visible */
        .app-container {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            z-index: 9999 !important;
            overflow-y: auto !important;
            -webkit-overflow-scrolling: touch !important;
        }
    </style>
    <style data-purpose="mobile-app-design">
        /* Mobile app-like design with square edges and smaller content */
        .app-container {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: "Inter", sans-serif;
            padding: 0.5rem;
        }

        .app-header {
            padding: 1rem 1rem 0.5rem 1rem;
            text-align: center;
            flex-shrink: 0;
        }

        .app-content {
            flex: 1;
            padding: 0 1rem 1rem 1rem;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            min-height: 0;
            margin-top: 1rem;
        }

        .app-logo {
            width: 50px;
            height: 50px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 0.75rem auto;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .app-title {
            color: white;
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
            letter-spacing: -0.025em;
        }

        .app-subtitle {
            color: rgba(255, 255, 255, 0.8) !important;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .login-section {
            background: white;
            border-radius: 4px;
            padding: 1.25rem 1rem;
            margin-top: 0;
            min-height: auto;
            position: relative;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .login-title {
            font-size: 1.125rem;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 0.25rem;
            text-align: center;
        }

        .login-description {
            color: #6b7280;
            text-align: center;
            margin-bottom: 1.25rem;
            font-size: 0.75rem;
        }

        /* Form styles */
        .form-group {
            margin-bottom: 1rem;
        }

        .form-label {
            display: block;
            font-size: 0.75rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.375rem;
        }

        .form-input {
            width: 100%;
            height: 44px;
            padding: 0 0.75rem;
            border: 2px solid #e5e7eb;
            border-radius: 4px;
            font-size: 14px;
            background: #ffffff;
            transition: all 0.2s ease;
            color: #1f2937;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.1);
        }

        .form-input-error {
            border-color: #ef4444;
            background-color: #fef2f2;
        }

        .form-input-error:focus {
            border-color: #ef4444;
            box-shadow: 0 0 0 2px rgba(239, 68, 68, 0.1);
        }

        .password-container {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #9ca3af;
            transition: color 0.2s ease;
        }

        .password-toggle:hover {
            color: #6b7280;
        }

        .error-message {
            color: #ef4444;
            font-size: 0.625rem;
            margin-top: 0.375rem;
            padding-left: 0.25rem;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 1.25rem;
        }

        .remember-me input {
            width: 0.875rem;
            height: 0.875rem;
            margin-right: 0.375rem;
            accent-color: #667eea;
        }

        .remember-me label {
            font-size: 0.75rem;
            color: #6b7280;
            cursor: pointer;
        }

        .forgot-password {
            color: #667eea;
            font-size: 0.75rem;
            font-weight: 500;
            text-decoration: none;
            float: right;
        }

        .forgot-password:hover {
            color: #5a67d8;
        }

        .login-button {
            width: 100%;
            height: 44px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
        }

        .login-button:hover:not(:disabled) {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
        }

        .login-button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .register-link {
            text-align: center;
            padding-top: 0.75rem;
            border-top: 1px solid #e5e7eb;
        }

        .register-link p {
            color: #6b7280;
            font-size: 0.75rem;
            margin-bottom: 0.5rem;
        }

        .register-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 40px;
            border: 2px solid #667eea;
            border-radius: 4px;
            background: white;
            color: #667eea;
            font-size: 0.75rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .register-button:hover {
            background: #f8faff;
            transform: translateY(-1px);
        }

        /* Message styles */
        .alert {
            padding: 0.75rem;
            border-radius: 4px;
            margin-bottom: 1rem;
            border: 1px solid;
            font-size: 0.75rem;
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

        /* Loading spinner */
        .loading-spinner {
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* Responsive adjustments for small screens */
        @media (max-height: 600px) {
            .app-header {
                padding: 0.5rem 1rem 0.25rem 1rem;
            }

            .app-logo {
                width: 40px;
                height: 40px;
                margin-bottom: 0.5rem;
            }

            .app-title {
                font-size: 1rem;
            }

            .app-subtitle {
                font-size: 0.625rem;
            }

            .login-section {
                padding: 1rem 0.75rem;
            }

            .app-content {
                margin-top: 0.5rem;
            }
        }

        @media (max-height: 500px) {
            .app-container {
                padding: 0.25rem;
            }

            .app-header {
                padding: 0.25rem 0.5rem;
            }

            .login-section {
                padding: 0.75rem;
            }

            .form-group {
                margin-bottom: 0.75rem;
            }

            .login-description {
                margin-bottom: 1rem;
            }
        }

        @media (max-width: 320px) {
            .app-container {
                padding: 0.25rem;
            }

            .login-section {
                padding: 0.75rem 0.5rem;
            }

            .form-input {
                height: 40px;
                font-size: 13px;
            }

            .login-button {
                height: 40px;
                font-size: 0.75rem;
            }
        }

        /* Safe area handling for notched devices */
        @supports (padding: max(0px)) {
            .app-container {
                padding-top: max(0.5rem, env(safe-area-inset-top));
                padding-bottom: max(0.5rem, env(safe-area-inset-bottom));
                padding-left: max(0.5rem, env(safe-area-inset-left));
                padding-right: max(0.5rem, env(safe-area-inset-right));
            }
        }
    </style>

<#elseif section = "form">

<div class="app-container">
    <!-- App Header -->
    <header class="app-header">
        <div class="app-logo">
            <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"></path>
            </svg>
        </div>
        <h1 class="app-title">JUST HR</h1>
        <p class="app-subtitle">Employee App</p>
    </header>

    <!-- App Content -->
    <main class="app-content">
        <section class="login-section">
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-description">Sign in to access your workplace</p>

            <!-- Messages -->
            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                </div>
            </#if>

            <!-- Login Form -->
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" novalidate="novalidate">
                    <!-- Username/Email Field -->
                    <div class="form-group">
                        <label class="form-label" for="username">
                            <#if !realm.loginWithEmailAllowed>Employee ID<#elseif !realm.registrationEmailAsUsername>Employee ID or Email<#else>Work Email</#if>
                        </label>
                        <input
                            class="form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                            id="username"
                            name="username"
                            placeholder="Enter your credentials"
                            type="text"
                            value="${(login.username!'')}"
                            autofocus
                            autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                            tabindex="1"
                        />
                        <#if messagesPerField.existsError('username','password')>
                            <div class="error-message">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <!-- Password Field -->
                    <div class="form-group">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.375rem;">
                            <label class="form-label" for="password" style="margin-bottom: 0;">Password</label>
                            <#if realm.resetPasswordAllowed>
                                <a class="forgot-password" href="${url.loginResetCredentialsUrl}">Forgot?</a>
                            </#if>
                        </div>
                        <div class="password-container">
                            <input
                                class="form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
                                id="password"
                                name="password"
                                type="password"
                                placeholder="Enter your password"
                                autocomplete="current-password"
                                tabindex="2"
                            />
                            <div class="password-toggle" id="passwordToggle">
                                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10 12a2 2 0 100-4 2 2 0 000 4z"></path>
                                    <path clip-rule="evenodd" d="M.458 10C1.732 5.943 5.522 3 10 3s8.268 2.943 9.542 7c-1.274 4.057-5.064 7-9.542 7S1.732 14.057.458 10zM14 10a4 4 0 11-8 0 4 4 0 018 0z" fill-rule="evenodd"></path>
                                </svg>
                            </div>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="remember-me">
                            <input
                                id="rememberMe"
                                name="rememberMe"
                                type="checkbox"
                                tabindex="3"
                                <#if login.rememberMe??>checked</#if>
                            />
                            <label for="rememberMe">Keep me signed in</label>
                        </div>
                    </#if>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                    <!-- Submit Button -->
                    <button
                        class="login-button"
                        type="submit"
                        name="login"
                        id="kc-login"
                        tabindex="4"
                    >
                        <span id="login-text">Sign In</span>
                        <svg id="login-icon" class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3"></path>
                        </svg>
                    </button>

                    <!-- Register Link -->
                    <#if realm.registrationAllowed && !registrationDisabled??>
                        <div class="register-link">
                            <p>New employee?</p>
                            <a href="${url.registrationUrl}" class="register-button">
                                <svg class="w-3 h-3 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                                </svg>
                                Create Account
                            </a>
                        </div>
                    </#if>
                </form>
            </#if>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password toggle functionality
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
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"></path>
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

            // Form submission loading state
            const submitButton = document.getElementById('kc-login');
            const loginForm = document.getElementById('kc-form-login');
            const loginText = document.getElementById('login-text');
            const loginIcon = document.getElementById('login-icon');

            if (submitButton && loginForm) {
                loginForm.addEventListener('submit', function() {
                    submitButton.disabled = true;
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
                    this.style.fontSize = '14px';
                });
            });
        });
    </script>
</div>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div style="text-align: center; padding: 0.75rem; background: white; margin: 0.5rem; border-radius: 4px;">
            <p style="color: #6b7280; font-size: 0.75rem; margin-bottom: 0.5rem;">
                New employee?
            </p>
            <a href="${url.registrationUrl}" style="display: inline-flex; align-items: center; justify-content: center; width: 100%; height: 40px; border: 2px solid #667eea; border-radius: 4px; background: white; color: #667eea; font-size: 0.75rem; font-weight: 600; text-decoration: none;">
                <svg style="width: 0.75rem; height: 0.75rem; margin-right: 0.375rem;" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"></path>
                </svg>
                Create Account
            </a>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
