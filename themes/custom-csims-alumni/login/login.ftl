<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Kleek – Tertiary Registry & Records System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aeonik:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --oxford-navy: #042d62;
            --light-green: #7de19a;
            --light-turquoise: #e4fff6;
            --onyx: #121212;
            --bright-snow: #f9f9f9;
            --primary-main: var(--oxford-navy);
            --accent: var(--light-green);

            --font-family: 'Aeonik', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            --font-size-xs: 0.75rem;
            --font-size-sm: 0.875rem;
            --font-size-base: 1rem;
            --font-size-lg: 1.125rem;
            --font-size-xl: 1.25rem;
            --font-size-2xl: 1.5rem;
            --font-size-3xl: 1.875rem;
            --font-size-4xl: 2.25rem;

            --spacing-1: 0.25rem;
            --spacing-2: 0.5rem;
            --spacing-3: 0.75rem;
            --spacing-4: 1rem;
            --spacing-5: 1.25rem;
            --spacing-6: 1.5rem;
            --spacing-8: 2rem;
            --spacing-10: 2.5rem;
            --spacing-12: 3rem;
            --spacing-16: 4rem;
            --spacing-20: 5rem;

            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;

            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --transition-normal: 250ms ease-in-out;
        }
        html, body {
            font-family: var(--font-family);
            font-size: var(--font-size-base);
            background: var(--light-turquoise);
            color: var(--onyx);
            margin: 0; padding: 0; height: 100%;
            min-height: 100vh !important;
            overflow-x: hidden;
        }
        .login-pf-page-header, .login-pf-header, h1#kc-page-title,
        .login-pf-signup, #kc-page-title, .kc-page-title,
        .login-pf .container, .login-pf-page .login-pf-signup,
        .login-pf-page .login-pf-header, .card-pf-title,
        .login-pf-page .card-pf .card-pf-title, #kc-info-wrapper {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
        }
        .auth-container {
            display: flex;
            min-height: 100vh;
            background: var(--light-turquoise);
        }
        .mobile-header {
            display: none;
            background: var(--primary-main);
            color: var(--accent);
            padding: var(--spacing-4) var(--spacing-6);
            text-align: center;
        }
        .mobile-logo {
            font-size: var(--font-size-2xl);
            font-weight: bold;
        }
        .mobile-subtitle {
            font-size: var(--font-size-sm);
        }
        .auth-form-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--spacing-8);
            background: var(--bright-snow);
        }
        .form-container {
            width: 100%;
            max-width: 420px;
            background: var(--bright-snow);
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            padding: var(--spacing-8) var(--spacing-6);
        }
        .form-header {
            text-align: center;
            margin-bottom: var(--spacing-4);
        }
        .form-title {
            font-size: var(--font-size-3xl);
            font-weight: 700;
            color: var(--primary-main);
            margin-bottom: var(--spacing-2);
        }
        .form-subtitle {
            font-size: var(--font-size-base);
            color: var(--oxford-navy);
            font-weight: 400;
        }
        .auth-form {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-4);
        }
        .form-label {
            font-size: var(--font-size-sm);
            font-weight: 600;
            color: var(--oxford-navy);
        }
        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }
        .form-input {
            width: 100%;
            padding: var(--spacing-3) var(--spacing-4);
            border: 2px solid var(--light-turquoise);
            border-radius: var(--radius-md);
            font-size: var(--font-size-base);
            font-family: var(--font-family);
            background-color: var(--bright-snow);
            outline: none;
            transition: border-color var(--transition-normal), box-shadow var(--transition-normal);
        }
        .form-input:focus {
            border-color: var(--primary-main);
            box-shadow: 0 0 0 2px var(--light-green);
        }
        .form-input::placeholder { color: #789; }
        .input-icon {
            position: absolute;
            right: var(--spacing-3);
            width: 20px; height: 20px;
            color: var(--oxford-navy);
        }
        .password-toggle {
            background: none;
            border: none;
            position: absolute;
            right: var(--spacing-3);
            cursor: pointer;
            color: var(--oxford-navy);
        }
        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: var(--spacing-2) 0;
        }
        .checkbox-wrapper {
            display: flex; align-items: center; gap: var(--spacing-2);
            font-size: var(--font-size-sm); color: var(--onyx);
        }
        .checkbox-wrapper input[type="checkbox"] { display: none; }
        .checkmark {
            width: 20px; height: 20px;
            border: 2px solid var(--light-green);
            border-radius: var(--radius-sm); display: flex; align-items: center; justify-content: center;
            background: var(--bright-snow);
            position: relative;
        }
        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark {
            background: var(--light-green); border-color: var(--primary-main);
        }
        .checkbox-wrapper input[type="checkbox"]:checked + .checkmark::after {
            content: '✓'; color: var(--primary-main); font-size: 12px; font-weight: bold;
        }
        .forgot-password {
            color: var(--primary-main); text-decoration: none;
        }
        .forgot-password:hover { color: var(--light-green); }
        .btn-primary {
            background: linear-gradient(90deg, var(--primary-main), var(--light-green) 90%);
            color: white;
            border: none;
            padding: var(--spacing-4) var(--spacing-6);
            border-radius: var(--radius-md);
            font-size: var(--font-size-base);
            font-weight: 600;
            font-family: var(--font-family);
            cursor: pointer;
            transition: box-shadow var(--transition-normal);
            box-shadow: var(--shadow-sm);
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, var(--primary-main), var(--light-green));
            box-shadow: var(--shadow-md);
        }
        .btn-secondary {
            background: transparent;
            color: var(--primary-main);
            border: none;
            padding: 0;
            font-size: var(--font-size-base);
            font-weight: 600;
            font-family: var(--font-family);
            text-decoration: none;
            cursor: pointer;
            transition: color var(--transition-normal);
        }
        .btn-secondary:hover {
            color: var(--light-green);
            text-decoration: underline;
        }
        .form-footer {
            text-align: center;
            margin-top: var(--spacing-4);
            padding-top: var(--spacing-4);
            border-top: 1px solid var(--light-turquoise);
        }
        .form-footer-text {
            color: var(--primary-main);
            font-size: var(--font-size-sm);
            margin-bottom: 0;
            display: inline;
        }
        .form-footer .btn-secondary { margin-left: var(--spacing-2); }

        /* Error and Alerts */
        .form-input.error { border-color: #e53939; }
        .error-message { color: #e53939; font-size: var(--font-size-sm); margin-top: var(--spacing-1);}
        .alert {
            border-radius: var(--radius-md);
            margin-bottom: var(--spacing-4);
            padding: var(--spacing-4);
        }
        .alert-error { background-color: #fddede; color: #b51616; border: 1px solid #e53939;}
        .alert-success { background-color: #edffe8; color: #257a3e; border: 1px solid #7de19a;}
        .alert-info { background-color: var(--light-turquoise); color: var(--primary-main); border: 1px solid var(--light-green);}
        @media (max-width: 1024px) {
            .auth-container { flex-direction: column; }
            .mobile-header { display: block;}
        }
        @media (max-width: 768px) {
            .auth-form-section { padding: var(--spacing-4);}
            .form-container { max-width: 100%; }
        }
        @media (max-width: 480px) {
            .auth-form-section { padding: var(--spacing-3);}
            .form-header { margin-bottom: var(--spacing-3);}
            .form-title { font-size: var(--font-size-xl);}
            .btn-primary { width: 100%; font-size: var(--font-size-sm);}
        }
    </style>
<#elseif section = "form">

<!-- Mobile header (only visible on mobile) -->
<div class="mobile-header">
    <div class="mobile-logo">Kleek</div>
    <div class="mobile-subtitle">Tertiary Registry & Records System</div>
</div>

<div class="auth-container">
    <section class="auth-form-section">
        <div class="form-container">
            <header class="form-header">
                <h1 class="form-title">Kleek Login</h1>
                <p class="form-subtitle">Sign in to access your academic records and services</p>
            </header>

            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                ${kcSanitize(message.summary)?no_esc}
              </div>
            </#if>

            <#if realm.password>
              <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="auth-form">
                <div class="form-group">
                    <label for="username" class="form-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="input-wrapper">
                        <input
                            type="text"
                            id="username"
                            name="username"
                            value="${(login.username!'')}"
                            class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                            autofocus
                            autocomplete="<#if realm.loginWithEmailAllowed>email<#else>username</#if>"
                            tabindex="1"
                            required>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                      <div class="error-message">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                      </div>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="password" class="form-label">${msg("password")}</label>
                    <div class="input-wrapper">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                            autocomplete="current-password"
                            tabindex="2"
                            required>
                        <button type="button" class="password-toggle" id="passwordToggle">
                            <!-- eye icon SVG here if desired-->
                        </button>
                    </div>
                </div>

                <div class="form-options">
                    <#if realm.rememberMe && !usernameHidden??>
                      <label class="checkbox-wrapper">
                          <input type="checkbox" id="rememberMe" name="rememberMe" tabindex="3" <#if login.rememberMe??>checked</#if>>
                          <span class="checkmark"></span>
                          <span class="checkbox-label">${msg("rememberMe")}</span>
                      </label>
                    </#if>
                    <#if realm.resetPasswordAllowed>
                      <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <button type="submit" class="btn-primary" name="login" id="kc-login" tabindex="4">${msg("doLogIn")}</button>

                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                  <footer class="form-footer">
                      <span class="form-footer-text">Don't have an account?</span>
                      <a id="kc-registration" href="${url.registrationUrl}" class="btn-secondary">
                            ${msg("doRegister")}
                      </a>
                  </footer>
                </#if>
              </form>
            </#if>
        </div>
    </section>
</div>
<script>
    // Password toggle functionality
    function togglePasswordVisibility(inputId) {
        const input = document.getElementById(inputId);
        if (input.type === 'password') {
            input.type = 'text';
        } else {
            input.type = 'password';
        }
    }
    document.addEventListener('DOMContentLoaded', function() {
        const passwordToggle = document.getElementById('passwordToggle');
        if (passwordToggle) {
            passwordToggle.addEventListener('click', function(e) {
                e.preventDefault();
                togglePasswordVisibility('password');
            });
        }
        const params = new URLSearchParams(window.location.search);
        const clientId = params.get("clientId");
        if (!clientId) return;
        const registerLink = document.getElementById("kc-registration");
        if (!registerLink) return;
        const url = new URL(registerLink.href);
        url.searchParams.set("clientId", clientId);
        registerLink.href = url.toString();
    });
</script>
</#if>
</@layout.registrationLayout>
