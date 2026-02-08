<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Sign In - Hero Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important;
            font-size: 16px !important;
            line-height: 1.6 !important;
            color: #1f2937 !important;
            background-color: #ffffff !important;
            -webkit-font-smoothing: antialiased !important;
            -moz-osx-font-smoothing: grayscale !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        /* Hero Section Styles */
        .hero-section {
            background-color: rgba(255, 255, 255, 1);
            overflow: hidden;
            min-height: 100vh;
            position: relative;
        }

        .hero-container {
            display: flex;
            flex-direction: column;
            position: relative;
            min-height: 100vh;
            width: 100%;
            align-items: center;
            justify-content: center;
            padding: 80px;
        }

        @media (max-width: 991px) {
            .hero-container {
                max-width: 100%;
                padding: 20px;
            }
        }

        .background-image {
            position: absolute;
            inset: 0;
            height: 100%;
            width: 100%;
            object-fit: cover;
            object-position: center;
            z-index: 1;
        }

        .overlay-container {
            position: relative;
            background-color: rgba(255, 244, 244, 0.12);
            width: 551px;
            max-width: 100%;
            z-index: 2;
            border-radius: 12px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        @media (max-width: 991px) {
            .overlay-container {
                width: 100%;
                max-width: 400px;
            }
        }

        .content-panel {
            background-color: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 991px) {
            .content-panel {
                padding: 30px 20px;
            }
        }

        /* Form Styles */
        .login-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .login-title {
            font-size: 28px;
            font-weight: 700;
            color: #1f2937;
            margin-bottom: 8px;
            letter-spacing: -0.025em;
        }

        .login-subtitle {
            font-size: 16px;
            color: #6b7280;
            font-weight: 400;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
            letter-spacing: 0.025em;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 16px;
            font-family: inherit;
            background-color: white;
            transition: all 0.25s ease-in-out;
            outline: none;
        }

        .form-input:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .form-input::placeholder {
            color: #9ca3af;
        }

        .form-input.error {
            border-color: #ef4444;
        }

        .form-input.error:focus {
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            padding: 4px;
            color: #6b7280;
            transition: color 0.25s ease-in-out;
        }

        .password-toggle:hover {
            color: #374151;
        }

        .password-toggle svg {
            width: 20px;
            height: 20px;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 8px 0;
        }

        .checkbox-wrapper {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            font-size: 14px;
            color: #6b7280;
        }

        .checkbox-wrapper input[type="checkbox"] {
            display: none;
        }

        .checkmark {
            width: 18px;
            height: 18px;
            border: 2px solid #d1d5db;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.25s ease-in-out;
            position: relative;
        }

        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark {
            background-color: #3b82f6;
            border-color: #3b82f6;
        }

        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark::after {
            content: '✓';
            color: white;
            font-size: 12px;
            font-weight: bold;
        }

        .forgot-password {
            color: #3b82f6;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.25s ease-in-out;
        }

        .forgot-password:hover {
            color: #2563eb;
            text-decoration: underline;
        }

        .btn-primary {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            border: none;
            padding: 14px 24px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            font-family: inherit;
            cursor: pointer;
            transition: all 0.25s ease-in-out;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            letter-spacing: 0.025em;
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.1);
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }

        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
        }

        .form-footer-text {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 0;
            display: inline;
        }

        .btn-secondary {
            background: transparent;
            color: #3b82f6;
            border: none;
            padding: 0;
            font-size: 14px;
            font-weight: 600;
            font-family: inherit;
            text-decoration: none;
            display: inline;
            cursor: pointer;
            transition: color 0.25s ease-in-out;
            letter-spacing: 0.025em;
            margin-left: 8px;
        }

        .btn-secondary:hover {
            color: #2563eb;
            text-decoration: underline;
        }

        /* Error and Message Styles */
        .error-message {
            color: #ef4444;
            font-size: 14px;
            margin-top: 4px;
        }

        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid;
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

        /* Social Providers */
        .social-providers {
            margin-top: 24px;
            padding-top: 24px;
            border-top: 1px solid #e5e7eb;
        }

        .social-providers h2 {
            text-align: center;
            font-size: 14px;
            font-weight: 500;
            color: #6b7280;
            margin-bottom: 16px;
        }

        .social-providers-list {
            display: flex;
            flex-direction: column;
            gap: 8px;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .social-provider-button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            background-color: white;
            color: #374151;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.25s ease-in-out;
        }

        .social-provider-button:hover {
            border-color: #d1d5db;
            background-color: #f9fafb;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-container {
                padding: 16px;
                min-height: 100vh;
            }

            .overlay-container {
                width: 100%;
                margin: 0;
            }

            .content-panel {
                padding: 24px 16px;
            }

            .login-title {
                font-size: 24px;
            }

            .login-subtitle {
                font-size: 14px;
            }

            .form-input {
                font-size: 16px; /* Prevent zoom on iOS */
            }

            .form-options {
                flex-direction: column;
                gap: 12px;
                align-items: flex-start;
            }
        }

        @media (max-width: 480px) {
            .content-panel {
                padding: 20px 12px;
            }

            .login-title {
                font-size: 20px;
            }

            .btn-primary {
                width: 100%;
                padding: 12px;
                font-size: 14px;
            }

            .form-input {
                padding: 10px 12px;
                font-size: 14px;
            }

            .form-label {
                font-size: 12px;
            }
        }
    </style>
<#elseif section = "form">
    <section class="hero-section">
        <div class="hero-container">
            <img
                src="https://api.builder.io/api/v1/image/assets/TEMP/a501990b1298550b9f7cb34d588b9d08861363b4?placeholderIfAbsent=true&apiKey=f5d69d5735f94647af8819d73904242b"
                alt="Hero background"
                class="background-image"
            />
            <div class="overlay-container">
                <div class="content-panel">
                    <header class="login-header">
                        <h1 class="login-title">Welcome Back</h1>
                        <p class="login-subtitle">Sign in to your account</p>
                    </header>

                    <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                            ${kcSanitize(message.summary)?no_esc}
                        </div>
                    </#if>

                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="login-form">
                            <#if !usernameHidden??>
                                <div class="form-group">
                                    <label for="username" class="form-label">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                                    </label>
                                    <input
                                        tabindex="2"
                                        id="username"
                                        class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                                        name="username"
                                        value="${(login.username!'')}"
                                        type="text"
                                        autofocus
                                        autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                        dir="ltr"
                                    />
                                    <#if messagesPerField.existsError('username','password')>
                                        <div class="error-message">
                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                        </div>
                                    </#if>
                                </div>
                            </#if>

                            <div class="form-group">
                                <label for="password" class="form-label">${msg("password")}</label>
                                <div class="password-wrapper">
                                    <input
                                        tabindex="3"
                                        id="password"
                                        class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                                        name="password"
                                        type="password"
                                        autocomplete="current-password"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                    <button class="password-toggle" type="button" aria-label="${msg("showPassword")}"
                                            aria-controls="password" data-password-toggle tabindex="4"
                                            data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                            data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                        </svg>
                                    </button>
                                </div>
                                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                    <div class="error-message">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </div>
                                </#if>
                            </div>

                            <div class="form-options">
                                <#if realm.rememberMe && !usernameHidden??>
                                    <label class="checkbox-wrapper">
                                        <#if login.rememberMe??>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                        <#else>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox">
                                        </#if>
                                        <span class="checkmark"></span>
                                        <span>${msg("rememberMe")}</span>
                                    </label>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                    <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>

                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="7" class="btn-primary" name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>

                            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                <footer class="form-footer">
                                    <span class="form-footer-text">${msg("noAccount")}</span>
                                    <a tabindex="8" href="${url.registrationUrl}" class="btn-secondary">${msg("doRegister")}</a>
                                </footer>
                            </#if>
                        </form>
                    </#if>

                    <#if realm.password && social?? && social.providers?has_content>
                        <div class="social-providers">
                            <h2>${msg("identity-provider-login-label")}</h2>
                            <ul class="social-providers-list">
                                <#list social.providers as p>
                                    <li>
                                        <a data-once-link data-disabled-class="disabled" id="social-${p.alias}"
                                                class="social-provider-button"
                                                type="button" href="${p.loginUrl}">
                                            <#if p.iconClasses?has_content>
                                                <i class="${p.iconClasses!}" aria-hidden="true"></i>
                                            </#if>
                                            <span>${p.displayName!}</span>
                                        </a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </section>

    <@passkeys.conditionalUIData />
    <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>

    <script>
        // Enhanced password toggle functionality
        document.addEventListener('DOMContentLoaded', function() {
            const passwordToggle = document.querySelector('.password-toggle');
            const passwordInput = document.getElementById('password');

            if (passwordToggle && passwordInput) {
                passwordToggle.addEventListener('click', function(e) {
                    e.preventDefault();

                    const isPassword = passwordInput.type === 'password';
                    passwordInput.type = isPassword ? 'text' : 'password';

                    const icon = this.querySelector('svg');
                    if (isPassword) {
                        // Show "hide" icon
                        icon.innerHTML = `
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 1-4.243-4.243m4.242 4.242L9.88 9.88" />
                        `;
                    } else {
                        // Show "show" icon
                        icon.innerHTML = `
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        `;
                    }
                });
            }

            // Handle registration link with client ID preservation
            const params = new URLSearchParams(window.location.search);
            const clientId = params.get("clientId");
            if (clientId) {
                const registerLink = document.querySelector('a[href*="registrationUrl"]');
                if (registerLink) {
                    const url = new URL(registerLink.href);
                    url.searchParams.set("clientId", clientId);
                    registerLink.href = url.toString();
                }
            }
        });
    </script>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div id="kc-registration-container">
            <div id="kc-registration">
                <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
            </div>
        </div>
    </#if>

<#elseif section = "socialProviders">
    <#if realm.password && social?? && social.providers?has_content>
        <div id="kc-social-providers" class="social-providers">
            <h2>${msg("identity-provider-login-label")}</h2>
            <ul class="social-providers-list">
                <#list social.providers as p>
                    <li>
                        <a data-once-link data-disabled-class="disabled" id="social-${p.alias}"
                                class="social-provider-button"
                                type="button" href="${p.loginUrl}">
                            <#if p.iconClasses?has_content>
                                <i class="${p.iconClasses!}" aria-hidden="true"></i>
                            </#if>
                            <span>${p.displayName!}</span>
                        </a>
                    </li>
                </#list>
            </ul>
        </div>
    </#if>
</#if>

</@layout.registrationLayout>
