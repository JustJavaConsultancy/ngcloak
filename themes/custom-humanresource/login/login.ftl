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

        /* CSS Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            margin: 0 !important;
            padding: 0 !important;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        /* Original Hero Section Styles - EXACT MATCH */
        .hero-section {
            background-color: rgba(255, 255, 255, 1);
            overflow: hidden;
        }

        .hero-container {
            display: flex;
            flex-direction: column;
            position: relative;
            min-height: 1382px;
            width: 100%;
            align-items: center;
            padding: 883px 80px 424px;
        }

        @media (max-width: 991px) {
            .hero-container {
                max-width: 100%;
                padding: 100px 20px;
            }
        }

        .background-image {
            position: absolute;
            inset: 0;
            height: 100%;
            width: 100%;
            object-fit: cover;
            object-position: center;
        }

        .overlay-container {
            position: relative;
            background-color: rgba(255, 244, 244, 0.12);
            margin-bottom: -85px;
            width: 551px;
            max-width: 100%;
        }

        @media (max-width: 991px) {
            .overlay-container {
                margin-bottom: 10px;
            }
        }

        .content-panel {
            background-color: rgba(255, 255, 255, 0.09);
            display: flex;
            flex-shrink: 0;
            height: 75px;
            /* Additional styles for login form */
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px 30px;
            min-height: 400px;
            height: auto;
        }

        @media (max-width: 991px) {
            .content-panel {
                max-width: 100%;
                padding: 30px 20px;
                min-height: 350px;
            }
        }

        /* Login Form Styles - Minimal and Clean */
        .login-form {
            width: 100%;
            max-width: 300px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.9);
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.15);
            color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            outline: none;
        }

        .form-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .form-input:focus {
            border-color: rgba(255, 255, 255, 0.6);
            background-color: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 0 2px rgba(255, 255, 255, 0.1);
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
            color: rgba(255, 255, 255, 0.7);
            transition: color 0.3s ease;
        }

        .password-toggle:hover {
            color: rgba(255, 255, 255, 0.9);
        }

        .password-toggle svg {
            width: 18px;
            height: 18px;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 8px 0;
            flex-wrap: wrap;
            gap: 8px;
        }

        .checkbox-wrapper {
            display: flex;
            align-items: center;
            gap: 6px;
            cursor: pointer;
            font-size: 12px;
            color: rgba(255, 255, 255, 0.8);
        }

        .checkbox-wrapper input[type="checkbox"] {
            display: none;
        }

        .checkmark {
            width: 16px;
            height: 16px;
            border: 1px solid rgba(255, 255, 255, 0.4);
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            background-color: rgba(255, 255, 255, 0.1);
        }

        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark {
            background-color: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.6);
        }

        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark::after {
            content: '✓';
            color: rgba(255, 255, 255, 0.9);
            font-size: 10px;
            font-weight: bold;
        }

        .forgot-password {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-size: 12px;
            transition: color 0.3s ease;
        }

        .forgot-password:hover {
            color: rgba(255, 255, 255, 1);
            text-decoration: underline;
        }

        .btn-primary {
            background: rgba(255, 255, 255, 0.2);
            color: rgba(255, 255, 255, 0.95);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 12px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .btn-primary:hover {
            background: rgba(255, 255, 255, 0.3);
            border-color: rgba(255, 255, 255, 0.5);
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .form-footer {
            text-align: center;
            margin-top: 16px;
            padding-top: 16px;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .form-footer-text {
            color: rgba(255, 255, 255, 0.8);
            font-size: 12px;
            display: inline;
        }

        .btn-secondary {
            background: transparent;
            color: rgba(255, 255, 255, 0.9);
            border: none;
            padding: 0;
            font-size: 12px;
            font-weight: 500;
            text-decoration: none;
            display: inline;
            cursor: pointer;
            transition: color 0.3s ease;
            margin-left: 4px;
        }

        .btn-secondary:hover {
            color: rgba(255, 255, 255, 1);
            text-decoration: underline;
        }

        /* Error and Message Styles */
        .error-message {
            color: rgba(255, 200, 200, 0.9);
            font-size: 12px;
            margin-top: 4px;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }

        .alert {
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 16px;
            border: 1px solid;
            backdrop-filter: blur(10px);
            font-size: 13px;
        }

        .alert-error {
            background-color: rgba(255, 200, 200, 0.15);
            color: rgba(255, 220, 220, 0.95);
            border-color: rgba(255, 200, 200, 0.3);
        }

        .alert-success {
            background-color: rgba(200, 255, 200, 0.15);
            color: rgba(220, 255, 220, 0.95);
            border-color: rgba(200, 255, 200, 0.3);
        }

        .alert-info {
            background-color: rgba(200, 220, 255, 0.15);
            color: rgba(220, 230, 255, 0.95);
            border-color: rgba(200, 220, 255, 0.3);
        }

        /* Social Providers */
        .social-providers {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }

        .social-providers h2 {
            text-align: center;
            font-size: 12px;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 12px;
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
            padding: 10px 16px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            background-color: rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: 12px;
            font-weight: 500;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .social-provider-button:hover {
            border-color: rgba(255, 255, 255, 0.5);
            background-color: rgba(255, 255, 255, 0.2);
        }

        /* Mobile Responsive */
        @media (max-width: 480px) {
            .content-panel {
                padding: 20px 15px;
                min-height: 300px;
            }

            .login-form {
                max-width: 100%;
            }

            .form-input {
                font-size: 16px; /* Prevent zoom on iOS */
            }

            .form-options {
                flex-direction: column;
                align-items: flex-start;
                gap: 12px;
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
                                        class="form-input"
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
                                        class="form-input"
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
                        icon.innerHTML = `
                            <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 1-4.243-4.243m4.242 4.242L9.88 9.88" />
                        `;
                    } else {
                        icon.innerHTML = `
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                        `;
                    }
                });
            }

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
