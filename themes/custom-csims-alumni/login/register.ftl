<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true displayInfo=false; section>
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
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --spacing-4: 1rem;
            --spacing-8: 2rem;
            --radius-lg: 0.75rem;
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
        .auth-container {
            display: flex;
            min-height: 100vh;
            background: var(--light-turquoise);
        }
        .register-form-section {
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
            padding: var(--spacing-8) var(--spacing-4);
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
        .register-form {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-4);
        }
        .form-label {
            font-size: var(--font-size-sm);
            font-weight: 600;
            color: var(--oxford-navy);
        }
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid var(--light-turquoise);
            border-radius: 0.5rem;
            background: var(--bright-snow);
            font-size: var(--font-size-base);
            font-family: var(--font-family);
        }
        .btn-primary {
            background: linear-gradient(90deg, var(--primary-main), var(--light-green));
            color: white;
            border: none;
            padding: 1rem 1.5rem;
            border-radius: 0.5rem;
            font-size: var(--font-size-base);
            font-weight: 600;
            font-family: var(--font-family);
            cursor: pointer;
            margin-top: 1rem;
        }
        .btn-primary:hover { background: var(--primary-main);}
        .form-footer {
            text-align: center;
            margin-top: 2rem;
            font-size: var(--font-size-sm);
            color: var(--oxford-navy);
        }
        .link { color: var(--primary-main); text-decoration: none;}
        .link:hover { color: var(--light-green); }
        .error-message { color: #e53939; font-size: var(--font-size-sm);}
        @media (max-width: 1024px) {
          .auth-container { flex-direction: column;}
        }
        @media (max-width: 480px) {
            .form-header { margin-bottom: 1rem;}
            .form-title { font-size: var(--font-size-xl);}
            .form-container { padding: 1.5rem 0.5rem;}
        }
    </style>
<#elseif section = "form">
<div class="auth-container">
    <section class="register-form-section">
        <div class="form-container">
            <header class="form-header">
                <h1 class="form-title">Create a Kleek Account</h1>
                <p class="form-subtitle">Register to access academic services</p>
            </header>

            <#if message?has_content>
                <div class="error-message">${kcSanitize(message.summary)?no_esc}</div>
            </#if>

            <form id="kc-register-form" action="${url.registrationAction}" method="post" class="register-form">
                <#if !realm.registrationEmailAsUsername>
                  <div class="form-group">
                      <label for="username" class="form-label">${msg("username")}</label>
                      <input type="text" id="username" name="username"
                        class="form-input <#if messagesPerField.existsError('username')>error</#if>"
                        value="${(register.formData.username!'')}" autofocus autocomplete="username" required>
                      <#if messagesPerField.existsError('username')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('username'))?no_esc}</div>
                      </#if>
                  </div>
                </#if>
                <div class="form-group">
                    <label for="email" class="form-label">${msg("email")}</label>
                    <input type="email" id="email" name="email"
                        class="form-input <#if messagesPerField.existsError('email')>error</#if>"
                        value="${(register.formData.email!'')}" autocomplete="email" required>
                    <#if messagesPerField.existsError('email')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}</div>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="firstName" class="form-label">${msg("firstName")}</label>
                    <input type="text" id="firstName" name="firstName"
                        class="form-input <#if messagesPerField.existsError('firstName')>error</#if>"
                        value="${(register.formData.firstName!'')}" autocomplete="given-name" required>
                    <#if messagesPerField.existsError('firstName')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}</div>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="lastName" class="form-label">${msg("lastName")}</label>
                    <input type="text" id="lastName" name="lastName"
                        class="form-input <#if messagesPerField.existsError('lastName')>error</#if>"
                        value="${(register.formData.lastName!'')}" autocomplete="family-name" required>
                    <#if messagesPerField.existsError('lastName')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}</div>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="password" class="form-label">${msg("password")}</label>
                    <input type="password" id="password" name="password"
                        class="form-input <#if messagesPerField.existsError('password','password-confirm')>error</#if>"
                        autocomplete="new-password" required>
                    <#if messagesPerField.existsError('password')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('password'))?no_esc}</div>
                    </#if>
                </div>
                <div class="form-group">
                    <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                    <input type="password" id="password-confirm" name="password-confirm"
                        class="form-input <#if messagesPerField.existsError('password-confirm')>error</#if>"
                        autocomplete="new-password" required>
                    <#if messagesPerField.existsError('password-confirm')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}</div>
                    </#if>
                </div>
                <button type="submit" class="btn-primary" name="register" id="kc-register">${msg("doRegister")}</button>
            </form>

            <footer class="form-footer">
                Already have an account? <a href="${url.loginUrl}" class="link">${msg("doLogIn")}</a>
            </footer>
        </div>
    </section>
</div>
</#if>
</@layout.registrationLayout>
