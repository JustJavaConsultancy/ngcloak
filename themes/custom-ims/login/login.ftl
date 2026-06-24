<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=false; section>
    <#if section = "header">
        <title>Crimson Core - Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">

        <style>
            /* Hide default Keycloak login chrome */
            html,
            body,
            .login-pf,
            .login-pf body {
                min-height: 100%;
                margin: 0;
                background: #f7f8fc;
            }

            .login-pf-page-header,
            .login-pf-header,
            h1#kc-page-title,
            .login-pf-signup,
            #kc-header,
            #kc-header-wrapper {
                display: none !important;
            }

            .login-pf-page {
                padding: 0 !important;
                margin: 0 !important;
                background: #f7f8fc !important;
                border: 0 !important;
            }

            .login-pf-page .card-pf {
                width: 100% !important;
                max-width: none !important;
                min-height: 100vh !important;
                padding: 0 !important;
                margin: 0 !important;
                border: 0 !important;
                box-shadow: none !important;
                background: transparent !important;
            }

            #kc-content,
            #kc-content-wrapper,
            #kc-form,
            #kc-form-wrapper {
                width: 100%;
                margin: 0 !important;
                padding: 0 !important;
            }

            * {
                box-sizing: border-box;
            }

            body {
                font-family: "Inter", ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
                color: #111827;
                -webkit-font-smoothing: antialiased;
                text-rendering: geometricPrecision;
            }

            .ims-shell {
                min-height: 100vh;
                width: 100%;
                display: flex;
                overflow: hidden;
                background: #f7f8fc;
            }

            .ims-brand-panel {
                width: 46.2%;
                min-height: 100vh;
                position: relative;
                color: #ffffff;
                background:
                        radial-gradient(circle at 7% 7%, rgba(144, 42, 255, 0.55) 0, rgba(144, 42, 255, 0) 28%),
                        linear-gradient(146deg, #7224ff 0%, #5432ff 48%, #284eff 100%);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                padding: clamp(1.55rem, 3.9vw, 3.55rem) clamp(1.45rem, 4.15vw, 4.1rem) clamp(1.35rem, 3.2vw, 3rem);
            }

            .ims-logo {
                display: inline-flex;
                align-items: center;
                gap: 0.58rem;
                line-height: 1;
                letter-spacing: 0;
                user-select: none;
            }

            .ims-logo-mark {
                width: clamp(0.95rem, 1.7vw, 1.35rem);
                height: clamp(0.95rem, 1.7vw, 1.35rem);
                flex: 0 0 auto;
                filter: drop-shadow(0 7px 14px rgba(0, 0, 0, 0.08));
            }

            .ims-logo-title {
                display: block;
                color: #ffffff;
                font-size: clamp(0.7rem, 1vw, 0.9rem);
                font-weight: 800;
                letter-spacing: 0.015em;
            }

            .ims-logo-subtitle {
                display: block;
                margin-top: 0.24rem;
                color: #f4a039;
                font-size: clamp(0.34rem, 0.55vw, 0.48rem);
                font-weight: 800;
                letter-spacing: 0.19em;
                text-transform: uppercase;
                opacity: 0.96;
            }

            .ims-brand-main {
                width: 100%;
                display: flex;
                flex: 1;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding-bottom: clamp(0.5rem, 3vh, 2rem);
            }

            .ims-hero-frame {
                width: min(75.5%, 27rem);
                aspect-ratio: 216 / 217;
                display: block;
                margin: 0 auto;
                border: 0;
                background: #151b1e;
                box-shadow: 0 1.25rem 3.5rem rgba(8, 15, 25, 0.18);
                object-fit: cover;
            }

            .ims-brand-copy {
                text-align: center;
                margin-top: clamp(1rem, 2.4vh, 1.65rem);
                max-width: 27rem;
            }

            .ims-brand-copy h2 {
                margin: 0;
                color: #ffffff;
                font-size: clamp(1.02rem, 2.05vw, 1.55rem);
                line-height: 1.08;
                font-weight: 800;
                letter-spacing: -0.035em;
            }

            .ims-brand-copy p {
                max-width: 22rem;
                margin: 0.47rem auto 0;
                color: rgba(255, 255, 255, 0.78);
                font-size: clamp(0.52rem, 0.87vw, 0.76rem);
                line-height: 1.42;
                font-weight: 500;
            }

            .ims-status {
                display: flex;
                align-items: center;
                gap: clamp(0.65rem, 1.3vw, 1.15rem);
                color: rgba(255, 255, 255, 0.82);
                font-size: clamp(0.43rem, 0.74vw, 0.64rem);
                font-weight: 600;
                white-space: nowrap;
            }

            .ims-live {
                display: inline-flex;
                align-items: center;
                gap: 0.38rem;
                text-transform: uppercase;
            }

            .ims-live::before {
                content: "";
                width: 0.36rem;
                height: 0.36rem;
                border-radius: 999px;
                background: #1cff63;
                box-shadow: 0 0 0 0.18rem rgba(28, 255, 99, 0.12);
            }

            .ims-status-separator {
                width: 1px;
                height: 0.72rem;
                background: rgba(255, 255, 255, 0.33);
            }

            .ims-form-panel {
                width: 53.8%;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                background: #f7f8fc;
                padding: clamp(1.5rem, 5vw, 5rem);
            }

            .ims-login-wrap {
                width: min(60%, 23.25rem);
                min-width: 19rem;
            }

            .ims-login-title {
                margin: 0;
                color: #111827;
                font-size: clamp(1.35rem, 2.1vw, 1.75rem);
                line-height: 1.12;
                font-weight: 800;
                letter-spacing: -0.045em;
            }

            .ims-login-subtitle {
                margin: 0.56rem 0 1.8rem;
                color: #8b94a7;
                font-size: clamp(0.68rem, 0.9vw, 0.82rem);
                font-weight: 500;
            }

            .ims-form {
                display: flex;
                flex-direction: column;
                gap: 1.16rem;
            }

            .ims-field-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                margin-bottom: 0.45rem;
            }

            .ims-field-label {
                display: block;
                color: #b4bac6;
                font-size: clamp(0.58rem, 0.78vw, 0.7rem);
                line-height: 1;
                font-weight: 600;
                letter-spacing: -0.005em;
            }

            .ims-forgot {
                color: #4730ff;
                font-size: clamp(0.58rem, 0.78vw, 0.7rem);
                line-height: 1;
                font-weight: 700;
                text-decoration: none;
            }

            .ims-forgot:hover {
                text-decoration: underline;
            }

            .ims-input-wrap {
                position: relative;
                width: 100%;
            }

            .ims-input-icon,
            .ims-eye-button {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                display: inline-flex;
                align-items: center;
                justify-content: center;
                color: #9aa3b5;
            }

            .ims-input-icon {
                left: 0.85rem;
                width: 1rem;
                height: 1rem;
                pointer-events: none;
            }

            .ims-eye-button {
                right: 0.62rem;
                width: 1.75rem;
                height: 1.75rem;
                border: 0;
                background: transparent;
                cursor: pointer;
                padding: 0;
            }

            .ims-eye-button:hover {
                color: #626d80;
            }

            .ims-icon-svg {
                width: clamp(0.72rem, 0.95vw, 0.9rem);
                height: clamp(0.72rem, 0.95vw, 0.9rem);
                stroke: currentColor;
                stroke-width: 1.85;
                stroke-linecap: round;
                stroke-linejoin: round;
                fill: none;
            }

            .ims-input {
                width: 100%;
                height: clamp(2.3rem, 3.4vw, 2.72rem);
                border: 1px solid #e7e9f0;
                border-radius: 0.52rem;
                background: #ffffff;
                color: #273041;
                font-size: clamp(0.66rem, 0.9vw, 0.82rem);
                font-weight: 500;
                outline: none;
                padding: 0 2.75rem 0 2.4rem;
                box-shadow: 0 1px 1px rgba(20, 26, 40, 0.01);
                transition: border-color 0.15s ease, box-shadow 0.15s ease;
            }

            .ims-input::placeholder {
                color: #6f7786;
                opacity: 1;
            }

            .ims-input:hover {
                border-color: #dce0ea;
            }

            .ims-input:focus {
                border-color: #4a34ff;
                box-shadow: 0 0 0 0.2rem rgba(74, 52, 255, 0.12);
            }

            .ims-error {
                margin: 0.45rem 0 0;
                color: #d92d20;
                font-size: 0.72rem;
                line-height: 1.35;
                font-weight: 600;
            }

            .ims-options {
                display: flex;
                align-items: center;
                gap: 0.48rem;
                margin-top: 0.05rem;
            }

            .ims-checkbox {
                width: 0.75rem;
                height: 0.75rem;
                margin: 0;
                appearance: none;
                -webkit-appearance: none;
                border: 1px solid #d7dce6;
                border-radius: 0.16rem;
                background: #ffffff;
                cursor: pointer;
                display: grid;
                place-items: center;
            }

            .ims-checkbox:checked {
                border-color: #4c32ff;
                background: #4c32ff;
            }

            .ims-checkbox:checked::after {
                content: "";
                width: 0.25rem;
                height: 0.44rem;
                border: solid #ffffff;
                border-width: 0 1.5px 1.5px 0;
                transform: rotate(45deg) translateY(-1px);
            }

            .ims-remember-label {
                color: #9aa2b2;
                font-size: clamp(0.58rem, 0.78vw, 0.7rem);
                font-weight: 600;
                user-select: none;
            }

            .ims-submit {
                width: 100%;
                height: clamp(2.55rem, 3.65vw, 2.95rem);
                margin-top: 0.38rem;
                border: 0;
                border-radius: 0.52rem;
                color: #ffffff;
                background: linear-gradient(92deg, #6431ff 0%, #2e4fff 100%);
                font-size: clamp(0.68rem, 0.86vw, 0.82rem);
                font-weight: 700;
                letter-spacing: -0.01em;
                cursor: pointer;
                box-shadow: 0 0.75rem 1.45rem rgba(57, 71, 255, 0.14);
                transition: transform 0.15s ease, box-shadow 0.15s ease, filter 0.15s ease;
            }

            .ims-submit:hover {
                transform: translateY(-1px);
                box-shadow: 0 1rem 1.65rem rgba(57, 71, 255, 0.18);
                filter: saturate(1.05);
            }

            .ims-submit:active {
                transform: translateY(0);
            }

            .ims-submit:disabled {
                cursor: wait;
                opacity: 0.74;
                transform: none;
            }

            .ims-security-footer {
                margin-top: clamp(2rem, 5.8vh, 3.7rem);
                padding-top: clamp(1.18rem, 2.4vh, 1.55rem);
                border-top: 1px solid #e6e9f1;
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: 1rem;
                color: #8a4550;
                font-size: clamp(0.5rem, 0.72vw, 0.62rem);
                line-height: 1;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.02em;
                white-space: nowrap;
            }

            .ims-secure-copy {
                display: inline-flex;
                align-items: center;
                gap: 0.32rem;
            }

            .ims-lock-small {
                width: 0.68rem;
                height: 0.68rem;
                stroke: currentColor;
                stroke-width: 2;
                fill: none;
                stroke-linecap: round;
                stroke-linejoin: round;
            }

            @media (max-width: 900px) {
                .ims-shell {
                    min-height: 100dvh;
                    flex-direction: column;
                    background: linear-gradient(146deg, #7224ff 0%, #5432ff 48%, #284eff 100%);
                }

                .ims-brand-panel {
                    width: 100%;
                    min-height: auto;
                    padding: 1.6rem 1.4rem 1.2rem;
                    background: transparent;
                }

                .ims-brand-main {
                    padding: 2rem 0 0.8rem;
                }

                .ims-hero-frame {
                    width: min(66vw, 18rem);
                }

                .ims-status {
                    justify-content: center;
                    padding-top: 1.3rem;
                }

                .ims-form-panel {
                    width: 100%;
                    min-height: auto;
                    flex: 1;
                    align-items: flex-start;
                    padding: 2rem 1.35rem 2.5rem;
                    border-radius: 1.65rem 1.65rem 0 0;
                }

                .ims-login-wrap {
                    width: 100%;
                    max-width: 24rem;
                    min-width: 0;
                    margin: 0 auto;
                }
            }
        </style>
    <#elseif section = "form">
        <div class="ims-shell">
            <aside class="ims-brand-panel" aria-label="IMS Enterprise Hub brand panel">
                <div class="ims-logo" aria-label="IMS Enterprise Hub">
                    <svg class="ims-logo-mark" viewBox="0 0 24 24" role="img" aria-hidden="true">
                        <defs>
                            <linearGradient id="imsLogoGradient" x1="3" y1="3" x2="21" y2="21" gradientUnits="userSpaceOnUse">
                                <stop stop-color="#F6FBFF"/>
                                <stop offset="1" stop-color="#B7F3FF"/>
                            </linearGradient>
                        </defs>
                        <rect x="3.5" y="3.5" width="17" height="17" rx="3.2" stroke="url(#imsLogoGradient)" stroke-width="2" fill="none"/>
                        <rect x="8" y="8" width="8" height="8" rx="1.4" fill="none" stroke="#FFFFFF" stroke-width="1.8"/>
                    </svg>
                    <span>
                    <span class="ims-logo-title">IMS</span>
                    <span class="ims-logo-subtitle">Enterprise Hub</span>
                </span>
                </div>

                <div class="ims-brand-main">
                    <img class="ims-hero-frame" src="${url.resourcesPath}/img/crimson-warehouse-illustration.png" alt="Real-time inventory intelligence illustration">
                    <div class="ims-brand-copy">
                        <h2>Commanding Precision</h2>
                        <p>Real-time inventory intelligence for high-velocity global supply chains.</p>
                    </div>
                </div>

                <div class="ims-status" aria-label="System status">
                    <span class="ims-live">System Live</span>
                    <span class="ims-status-separator" aria-hidden="true"></span>
                    <span>Global Server Cluster: East-1</span>
                </div>
            </aside>

            <main class="ims-form-panel">
                <div class="ims-login-wrap">
                    <h1 class="ims-login-title">Welcome back.</h1>
                    <p class="ims-login-subtitle">Enter your credentials to access Crimson Core.</p>

                    <form id="kc-form-login" class="ims-form" action="${url.loginAction}" method="post">
                        <div class="ims-field">
                            <label for="username" class="ims-field-label">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>Corporate Email</#if>
                            </label>
                            <div class="ims-input-wrap" style="margin-top: .45rem;">
                            <span class="ims-input-icon" aria-hidden="true">
                                <svg class="ims-icon-svg" viewBox="0 0 24 24">
                                    <rect x="3.5" y="5.5" width="17" height="13" rx="2.5"></rect>
                                    <path d="m5 8 7 5 7-5"></path>
                                </svg>
                            </span>
                                <input
                                        id="username"
                                        name="username"
                                        type="text"
                                        value="${(login.username!'')}"
                                        class="ims-input"
                                        autocomplete="username"
                                        placeholder="name@crimsonlogistics.com"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>
                            <#if messagesPerField.existsError('username','password')>
                                <p class="ims-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                            </#if>
                        </div>

                        <div class="ims-field">
                            <div class="ims-field-row">
                                <label for="password" class="ims-field-label">${msg("password")}</label>
                                <#if realm.resetPasswordAllowed>
                                    <a class="ims-forgot" href="${url.loginResetCredentialsUrl}">Forgot password?</a>
                                </#if>
                            </div>
                            <div class="ims-input-wrap">
                            <span class="ims-input-icon" aria-hidden="true">
                                <svg class="ims-icon-svg" viewBox="0 0 24 24">
                                    <rect x="5.5" y="10" width="13" height="10" rx="2.2"></rect>
                                    <path d="M8 10V7.6a4 4 0 0 1 8 0V10"></path>
                                </svg>
                            </span>
                                <input
                                        id="password"
                                        name="password"
                                        type="password"
                                        class="ims-input"
                                        autocomplete="current-password"
                                        placeholder="••••••••"
                                />
                                <button class="ims-eye-button" type="button" id="togglePassword" aria-label="Show password">
                                    <svg class="ims-icon-svg ims-eye-open" viewBox="0 0 24 24" aria-hidden="true">
                                        <path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path>
                                        <circle cx="12" cy="12" r="2.8"></circle>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <#if realm.rememberMe>
                            <div class="ims-options">
                                <input
                                        id="rememberMe"
                                        name="rememberMe"
                                        type="checkbox"
                                        class="ims-checkbox"
                                        <#if login.rememberMe??>checked</#if>
                                />
                                <label for="rememberMe" class="ims-remember-label">Keep me logged in on this terminal</label>
                            </div>
                        </#if>

                        <input type="hidden" name="credentialId" id="id-hidden-input" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button id="kc-login" class="ims-submit" type="submit">Sign In</button>
                    </form>

                    <div class="ims-security-footer">
                    <span class="ims-secure-copy">
                        <svg class="ims-lock-small" viewBox="0 0 24 24" aria-hidden="true">
                            <rect x="6" y="10" width="12" height="10" rx="2"></rect>
                            <path d="M8.5 10V7.5a3.5 3.5 0 0 1 7 0V10"></path>
                        </svg>
                        Secured with TLS 1.2
                    </span>
                        <span>v2.4.0-Core-Production</span>
                    </div>
                </div>
            </main>
        </div>

        <script>
            (function () {
                var toggle = document.getElementById("togglePassword");
                var password = document.getElementById("password");
                var form = document.getElementById("kc-form-login");
                var submit = document.getElementById("kc-login");

                if (toggle && password) {
                    toggle.addEventListener("click", function () {
                        var showing = password.type === "text";
                        password.type = showing ? "password" : "text";
                        toggle.setAttribute("aria-label", showing ? "Show password" : "Hide password");
                        toggle.innerHTML = showing
                            ? '<svg class="ims-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path><circle cx="12" cy="12" r="2.8"></circle></svg>'
                            : '<svg class="ims-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6a19.4 19.4 0 0 1-2.8 3.1M9.9 17.6A9.9 9.9 0 0 1 2.5 12"></path><path d="M4 4l16 16"></path><path d="M10.7 10.7a2.8 2.8 0 0 0 3.6 3.6"></path></svg>';
                    });
                }

                if (form && submit) {
                    form.addEventListener("submit", function () {
                        submit.disabled = true;
                        submit.textContent = "Signing In...";
                    });
                }
            })();
        </script>
    </#if>
</@layout.registrationLayout>
