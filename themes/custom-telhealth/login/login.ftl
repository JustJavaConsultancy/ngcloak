<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>

<@layout.registrationLayout
    displayMessage=!messagesPerField.existsError('username','password')
    displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??;
    section>

    <#if section = "header">
        ${msg("loginAccountTitle")}

    <#elseif section = "form">
        <style>
            /* ============================================================
               Aggressive hiding of default Keycloak elements
               (mirrors the working Kleek override block)
               ============================================================ */
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

            html, body {
                margin: 0 !important;
                padding: 0 !important;
                height: 100% !important;
                overflow-x: hidden !important;
            }

            /* ============================================================
               Tel Health custom styles (original)
               ============================================================ */
            :root {
                --surface-container-highest: #e0e3e5;
                --primary-fixed: #dbe1ff;
                --surface-dim: #d8dadc;
                --text-secondary: #475569;
                --primary: #004ac6;
                --error-container: #ffdad6;
                --on-error-container: #93000a;
                --secondary-container: #6df5e1;
                --on-primary-fixed-variant: #003ea8;
                --background: #f7f9fb;
                --surface-container-high: #e6e8ea;
                --surface-container-low: #f2f4f6;
                --on-primary: #ffffff;
                --surface-container: #eceef0;
                --border-base: #e2e8f0;
                --surface-muted: #f1f5f9;
                --on-surface: #191c1e;
                --surface: #f7f9fb;
                --success: #16a34a;
                --on-surface-variant: #434655;
                --outline: #737686;
                --text-primary: #0f172a;
                --secondary: #006b5f;
                --error: #ba1a1a;
                --primary-container: #2563eb;
                --outline-variant: #c3c6d7;
                --surface-container-lowest: #ffffff;
            }

            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
                background: var(--surface);
                color: var(--text-primary);
            }

            .tel-auth-shell {
                width: 100%;
                min-height: 100vh;
                display: flex;
                background: var(--surface);
            }

            .tel-auth-visual {
                position: relative;
                display: none;
                width: 50%;
                min-height: 100vh;
                padding: 32px;
                align-items: center;
                justify-content: center;
                overflow: hidden;
                background:
                    linear-gradient(135deg, rgba(0, 74, 198, 0.88), rgba(37, 99, 235, 0.92)),
                    radial-gradient(circle at 20% 20%, rgba(255,255,255,0.22), transparent 30%),
                    radial-gradient(circle at 80% 70%, rgba(109,245,225,0.22), transparent 35%),
                    var(--primary-container);
            }

            .tel-auth-visual::before {
                content: "";
                position: absolute;
                inset: 0;
                background-image:
                    linear-gradient(rgba(255,255,255,0.08) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(255,255,255,0.08) 1px, transparent 1px);
                background-size: 44px 44px;
                opacity: 0.35;
            }

            .tel-auth-visual-content {
                position: relative;
                z-index: 1;
                max-width: 540px;
                color: #fff;
            }

            .tel-status-row {
                display: flex;
                align-items: center;
                gap: 8px;
                margin-bottom: 16px;
                font-size: 13px;
                font-weight: 700;
                letter-spacing: 0.08em;
                text-transform: uppercase;
            }

            .tel-status-icon,
            .tel-brand-icon {
                width: 34px;
                height: 34px;
                border-radius: 999px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                font-weight: 800;
                background: rgba(255,255,255,0.2);
                border: 1px solid rgba(255,255,255,0.28);
            }

            .tel-visual-title {
                margin: 0 0 24px;
                font-size: clamp(32px, 4vw, 48px);
                line-height: 1.12;
                letter-spacing: -0.02em;
                font-weight: 800;
            }

            .tel-visual-copy {
                margin: 0;
                font-size: 18px;
                line-height: 1.65;
                color: rgba(255,255,255,0.86);
            }

            .tel-visual-footer {
                position: absolute;
                z-index: 1;
                left: 32px;
                bottom: 32px;
                display: flex;
                align-items: center;
                gap: 10px;
                color: rgba(255,255,255,0.82);
                font-size: 12px;
                font-weight: 600;
                letter-spacing: 0.04em;
            }

            .tel-auth-panel {
                width: 100%;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 24px;
                background:
                    radial-gradient(circle at 80% 10%, rgba(0, 74, 198, 0.06), transparent 26%),
                    var(--surface-bright, #f7f9fb);
            }

            .tel-auth-inner {
                width: 100%;
                max-width: 440px;
            }

            .tel-card {
                width: 100%;
                padding: 32px;
                background: var(--surface-container-lowest);
                border: 1px solid var(--border-base);
                border-radius: 12px;
                box-shadow: 0 1px 3px rgba(15, 23, 42, 0.05), 0 10px 15px -3px rgba(15, 23, 42, 0.03);
            }

            .tel-card-header {
                text-align: center;
                margin-bottom: 28px;
            }

            .tel-logo {
                width: 56px;
                height: 56px;
                margin: 0 auto 18px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 16px;
                background: var(--primary);
                color: #fff;
                font-weight: 800;
                font-size: 24px;
                box-shadow: 0 10px 20px rgba(0, 74, 198, 0.18);
            }

            .tel-card-title {
                margin: 0 0 8px;
                color: var(--text-primary);
                font-size: 30px;
                line-height: 38px;
                letter-spacing: -0.02em;
                font-weight: 700;
            }

            .tel-card-subtitle {
                margin: 0;
                color: var(--text-secondary);
                font-size: 14px;
                line-height: 20px;
            }

            .tel-login-form {
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .tel-field {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .tel-label-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 12px;
            }

            .tel-label {
                color: var(--text-primary);
                font-size: 14px;
                line-height: 20px;
                font-weight: 700;
            }

            .tel-forgot-link,
            .tel-link {
                color: var(--primary);
                text-decoration: none;
                font-size: 12px;
                font-weight: 700;
            }

            .tel-forgot-link:hover,
            .tel-link:hover {
                text-decoration: underline;
            }

            .tel-input-wrap {
                position: relative;
            }

            .tel-input-icon {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--outline);
                font-size: 15px;
                font-weight: 800;
                pointer-events: none;
            }

            .tel-input {
                width: 100%;
                min-height: 48px;
                padding: 12px 14px 12px 44px;
                color: var(--text-primary);
                background: #fff;
                border: 1px solid var(--border-base);
                border-radius: 8px;
                outline: none;
                font: inherit;
                font-size: 14px;
                line-height: 20px;
                transition: border-color 0.16s ease, box-shadow 0.16s ease, background 0.16s ease;
            }

            .tel-input[type="password"],
            .tel-input.has-password-toggle {
                padding-right: 44px;
            }

            .tel-input:focus {
                border-color: var(--primary);
                box-shadow: 0 0 0 4px rgba(0, 74, 198, 0.12);
            }

            .tel-input[aria-invalid="true"] {
                border-color: var(--error);
                box-shadow: 0 0 0 4px rgba(186, 26, 26, 0.10);
            }

            .tel-password-toggle {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                min-width: 30px;
                min-height: 30px;
                border: 0;
                background: transparent;
                color: var(--outline);
                cursor: pointer;
                font-weight: 700;
            }

            .tel-password-toggle:hover {
                color: var(--text-primary);
            }

            .tel-error-message {
                display: block;
                color: var(--on-error-container);
                background: var(--error-container);
                border: 1px solid rgba(186, 26, 26, 0.18);
                padding: 10px 12px;
                border-radius: 8px;
                font-size: 13px;
                line-height: 18px;
            }

            .tel-options {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 12px;
                margin: 2px 0 6px;
            }

            .tel-checkbox-label {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                color: var(--text-secondary);
                font-size: 14px;
                line-height: 20px;
                user-select: none;
            }

            .tel-checkbox-label input {
                width: 16px;
                height: 16px;
                accent-color: var(--primary);
            }

            .tel-submit {
                width: 100%;
                min-height: 48px;
                display: inline-flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                padding: 12px 16px;
                border: 0;
                border-radius: 8px;
                background: var(--primary-container);
                color: #fff;
                font-size: 15px;
                font-weight: 800;
                cursor: pointer;
                box-shadow: 0 1px 3px rgba(15, 23, 42, 0.08);
                transition: transform 0.16s ease, background 0.16s ease, opacity 0.16s ease;
            }

            .tel-submit:hover {
                background: var(--primary);
            }

            .tel-submit:active {
                transform: scale(0.98);
            }

            .tel-submit:disabled {
                opacity: 0.72;
                cursor: not-allowed;
            }

            .tel-register-box {
                margin-top: 28px;
                padding-top: 24px;
                border-top: 1px solid var(--border-base);
                text-align: center;
                color: var(--text-secondary);
                font-size: 14px;
                line-height: 22px;
            }

            .tel-social {
                margin-top: 24px;
                padding-top: 24px;
                border-top: 1px solid var(--border-base);
            }

            .tel-social-title {
                margin: 0 0 14px;
                text-align: center;
                color: var(--text-secondary);
                font-size: 13px;
                font-weight: 700;
            }

            .tel-social-list {
                list-style: none;
                padding: 0;
                margin: 0;
                display: grid;
                gap: 10px;
            }

            .tel-social-button {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                min-height: 44px;
                padding: 10px 14px;
                border: 1px solid var(--border-base);
                border-radius: 8px;
                background: #fff;
                color: var(--text-primary);
                text-decoration: none;
                font-size: 14px;
                font-weight: 700;
            }

            .tel-auth-footer {
                margin-top: 24px;
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                justify-content: center;
                gap: 18px;
            }

            .tel-auth-footer a,
            .tel-auth-footer span {
                color: var(--outline);
                text-decoration: none;
                font-size: 12px;
                font-weight: 600;
            }

            .tel-auth-footer a:hover {
                color: var(--text-secondary);
            }

            @media (min-width: 1024px) {
                .tel-auth-visual {
                    display: flex;
                }

                .tel-auth-panel {
                    width: 50%;
                    padding: 32px;
                }
            }

            @media (max-width: 520px) {
                .tel-auth-panel {
                    padding: 16px;
                }

                .tel-card {
                    padding: 24px;
                }

                .tel-card-title {
                    font-size: 24px;
                    line-height: 32px;
                }

                .tel-options {
                    align-items: flex-start;
                    flex-direction: column;
                }
            }
        </style>

        <main class="tel-auth-shell">
            <section class="tel-auth-visual" aria-hidden="true">
                <div class="tel-auth-visual-content">
                    <div class="tel-status-row">
                        <span class="tel-status-icon">+</span>
                        <span>System Operational</span>
                    </div>
                    <h1 class="tel-visual-title">Empowering Modern Healthcare Operations.</h1>
                    <p class="tel-visual-copy">
                        Tel Health is an enterprise-grade hospital management system designed for clinical precision,
                        operational efficiency, and human-centered care.
                    </p>
                </div>

                <div class="tel-visual-footer">
                    <span class="tel-brand-icon">✓</span>
                    <span>HIPAA Compliant Environment</span>
                </div>
            </section>

            <section class="tel-auth-panel">
                <div class="tel-auth-inner">
                    <div class="tel-card">
                        <div class="tel-card-header">
                            <div class="tel-logo" aria-hidden="true">TH</div>
                            <h2 class="tel-card-title">Welcome Back</h2>
                            <p class="tel-card-subtitle">
                                Please enter your credentials to access the hospital management system.
                            </p>
                        </div>

                        <div id="kc-form">
                            <div id="kc-form-wrapper">
                                <#if realm.password>
                                    <form id="kc-form-login"
                                          class="tel-login-form"
                                          onsubmit="login.disabled = true; return true;"
                                          action="${url.loginAction}"
                                          method="post">

                                        <#if !usernameHidden??>
                                            <div class="tel-field">
                                                <label for="username" class="tel-label">
                                                    <#if !realm.loginWithEmailAllowed>
                                                        ${msg("username")}
                                                    <#elseif !realm.registrationEmailAsUsername>
                                                        ${msg("usernameOrEmail")}
                                                    <#else>
                                                        ${msg("email")}
                                                    </#if>
                                                </label>

                                                <div class="tel-input-wrap">
                                                    <span class="tel-input-icon" aria-hidden="true">@</span>
                                                    <input tabindex="2"
                                                           id="username"
                                                           class="tel-input"
                                                           name="username"
                                                           value="${(login.username!'')}"
                                                           type="text"
                                                           autofocus
                                                           autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                                           dir="ltr"
                                                           placeholder="<#if realm.registrationEmailAsUsername>name@hospital.com<#else>Username or email</#if>" />
                                                </div>

                                                <#if messagesPerField.existsError('username','password')>
                                                    <span id="input-error" class="tel-error-message" aria-live="polite">
                                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                    </span>
                                                </#if>
                                            </div>
                                        </#if>

                                        <div class="tel-field">
                                            <div class="tel-label-row">
                                                <label for="password" class="tel-label">${msg("password")}</label>

                                                <#if realm.resetPasswordAllowed>
                                                    <a class="tel-forgot-link" tabindex="6" href="${url.loginResetCredentialsUrl}">
                                                        ${msg("doForgotPassword")}
                                                    </a>
                                                </#if>
                                            </div>

                                            <div class="tel-input-wrap" dir="ltr">
                                                <span class="tel-input-icon" aria-hidden="true">#</span>
                                                <input tabindex="3"
                                                       id="password"
                                                       class="tel-input has-password-toggle"
                                                       name="password"
                                                       type="password"
                                                       autocomplete="current-password"
                                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                                       placeholder="••••••••" />

                                                <button class="tel-password-toggle"
                                                        type="button"
                                                        aria-label="${msg('showPassword')}"
                                                        aria-controls="password"
                                                        data-password-toggle
                                                        tabindex="4"
                                                        data-label-show="${msg('showPassword')}"
                                                        data-label-hide="${msg('hidePassword')}">
                                                    <span aria-hidden="true">👁</span>
                                                </button>
                                            </div>

                                            <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                                <span id="input-error" class="tel-error-message" aria-live="polite">
                                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>

                                        <div class="tel-options">
                                            <div id="kc-form-options">
                                                <#if realm.rememberMe && !usernameHidden??>
                                                    <label class="tel-checkbox-label" for="rememberMe">
                                                        <#if login.rememberMe??>
                                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" checked />
                                                        <#else>
                                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" />
                                                        </#if>
                                                        <span>${msg("rememberMe")}</span>
                                                    </label>
                                                </#if>
                                            </div>
                                        </div>

                                        <div id="kc-form-buttons">
                                            <input type="hidden"
                                                   id="id-hidden-input"
                                                   name="credentialId"
                                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />

                                            <button tabindex="7"
                                                    class="tel-submit"
                                                    name="login"
                                                    id="kc-login"
                                                    type="submit">
                                                <span>${msg("doLogIn")}</span>
                                                <span aria-hidden="true">→</span>
                                            </button>
                                        </div>
                                    </form>
                                </#if>
                            </div>
                        </div>

                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <div id="kc-registration-container" class="tel-register-box">
                                <div id="kc-registration">
                                    <span>
                                        ${msg("noAccount")}<br />
                                        <a class="tel-link" tabindex="8" href="${url.registrationUrl}">
                                            ${msg("doRegister")}
                                        </a>
                                    </span>
                                </div>
                            </div>
                        <#else>
                            <div class="tel-register-box">
                                <span>Don't have an account?</span><br />
                                <span>Contact your Hospital Administrator</span>
                            </div>
                        </#if>

                        <#if realm.password && social?? && social.providers?has_content>
                            <div id="kc-social-providers" class="tel-social">
                                <p class="tel-social-title">${msg("identity-provider-login-label")}</p>
                                <ul class="tel-social-list">
                                    <#list social.providers as p>
                                        <li>
                                            <a data-once-link
                                               id="social-${p.alias}"
                                               class="tel-social-button"
                                               type="button"
                                               href="${p.loginUrl}">
                                                <#if p.iconClasses?has_content>
                                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                                    <span>${p.displayName!}</span>
                                                <#else>
                                                    <span>${p.displayName!}</span>
                                                </#if>
                                            </a>
                                        </li>
                                    </#list>
                                </ul>
                            </div>
                        </#if>
                    </div>

                    <div class="tel-auth-footer">
                        <span>Privacy Policy</span>
                        <span>Security Standards</span>
                        <span>Help Center</span>
                    </div>
                </div>
            </section>
        </main>

        <@passkeys.conditionalUIData />

        <script>
            (function () {
                var passwordInput = document.getElementById("password");
                var toggleButton = document.querySelector("[data-password-toggle]");

                if (!passwordInput || !toggleButton) {
                    return;
                }

                toggleButton.addEventListener("click", function () {
                    var isPassword = passwordInput.getAttribute("type") === "password";
                    passwordInput.setAttribute("type", isPassword ? "text" : "password");
                    toggleButton.setAttribute(
                        "aria-label",
                        isPassword ? toggleButton.dataset.labelHide : toggleButton.dataset.labelShow
                    );
                    toggleButton.innerHTML = isPassword
                        ? '<span aria-hidden="true">🙈</span>'
                        : '<span aria-hidden="true">👁</span>';
                });
            })();
        </script>

    <#elseif section = "info">
        <#-- Registration is rendered inside the custom card above. -->

    <#elseif section = "socialProviders">
        <#-- Social providers are rendered inside the custom card above. -->
    </#if>

</@layout.registrationLayout>
