<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>CSIMS | Sign Up - University Registry & Records System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aeonik:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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

        /* CSS Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            /* Color Palette */
            --primary-50: #f0f9ff;
            --primary-100: #e0f2fe;
            --primary-200: #bae6fd;
            --primary-300: #7dd3fc;
            --primary-400: #38bdf8;
            --primary-500: #0ea5e9;
            --primary-600: #0284c7;
            --primary-700: #0369a1;
            --primary-800: #075985;
            --primary-900: #0c4a6e;
            --primary-950: #082f49;

            --gray-50: #f8fafc;
            --gray-100: #f1f5f9;
            --gray-200: #e2e8f0;
            --gray-300: #cbd5e1;
            --gray-400: #94a3b8;
            --gray-500: #64748b;
            --gray-600: #475569;
            --gray-700: #334155;
            --gray-800: #1e293b;
            --gray-900: #0f172a;
            --gray-950: #020617;

            --success-50: #f0fdf4;
            --success-500: #22c55e;
            --success-600: #16a34a;

            --error-50: #fef2f2;
            --error-500: #ef4444;
            --error-600: #dc2626;

            --warning-50: #fffbeb;
            --warning-500: #f59e0b;
            --warning-600: #d97706;

            /* Typography */
            --font-family: 'Aeonik', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            --font-size-xs: 0.75rem;
            --font-size-sm: 0.875rem;
            --font-size-base: 1rem;
            --font-size-lg: 1.125rem;
            --font-size-xl: 1.25rem;
            --font-size-2xl: 1.5rem;
            --font-size-3xl: 1.875rem;
            --font-size-4xl: 2.25rem;

            /* Spacing */
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

            /* Border Radius */
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;

            /* Shadows */
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1), 0 4px 6px -4px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1), 0 8px 10px -6px rgb(0 0 0 / 0.1);

            /* Transitions */
            --transition-fast: 150ms ease-in-out;
            --transition-normal: 250ms ease-in-out;
            --transition-slow: 350ms ease-in-out;
        }

        html, body {
            margin: 0 !important;
            padding: 0 !important;
            font-family: var(--font-family) !important;
            font-size: var(--font-size-base) !important;
            line-height: 1.6 !important;
            color: var(--gray-900) !important;
            background-color: var(--gray-50) !important;
            -webkit-font-smoothing: antialiased !important;
            -moz-osx-font-smoothing: grayscale !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        /* Auth Container */
        .auth-container {
            display: flex;
            min-height: 100vh;
            background: linear-gradient(135deg, var(--primary-50) 0%, var(--gray-50) 100%);
        }

        /* Mobile header */
        .mobile-header {
            display: none;
            background: linear-gradient(135deg, var(--primary-600) 0%, var(--primary-800) 100%);
            color: white;
            padding: var(--spacing-4) var(--spacing-6);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .mobile-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="10" cy="60" r="0.5" fill="white" opacity="0.1"/><circle cx="90" cy="40" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .mobile-logo {
            font-size: var(--font-size-2xl);
            font-weight: 700;
            margin-bottom: var(--spacing-1);
            position: relative;
            z-index: 1;
        }

        .mobile-subtitle {
            font-size: var(--font-size-sm);
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Form Section */
        .auth-form-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--spacing-8);
            background: var(--gray-50);
            position: relative;
        }

        .auth-form-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(135deg, var(--primary-50) 0%, transparent 50%);
            opacity: 0.3;
            pointer-events: none;
        }

        .form-container {
            width: 100%;
            max-width: 420px;
            position: relative;
            z-index: 1;
        }

        .form-header {
            text-align: center;
            margin-bottom: var(--spacing-6);
        }

        .form-title {
            font-size: var(--font-size-3xl);
            font-weight: 700;
            color: var(--gray-900);
            margin-bottom: var(--spacing-2);
            letter-spacing: -0.025em;
        }

        .form-subtitle {
            font-size: var(--font-size-lg);
            color: var(--gray-600);
            font-weight: 400;
        }

        /* Form Styles */
        .auth-form {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-4);
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-1);
        }

        .form-row {
            display: flex;
            gap: var(--spacing-4);
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-label {
            font-size: var(--font-size-sm);
            font-weight: 600;
            color: var(--gray-700);
            letter-spacing: 0.025em;
        }

        .input-wrapper {
            position: relative;
            display: flex;
            align-items: center;
        }

        .form-input {
            width: 100%;
            padding: var(--spacing-3) var(--spacing-4);
            border: 2px solid var(--gray-200);
            border-radius: var(--radius-md);
            font-size: var(--font-size-base);
            font-family: var(--font-family);
            background-color: white;
            transition: all var(--transition-normal);
            outline: none;
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .form-input.with-icon {
            padding-right: var(--spacing-10);
        }

        .form-input:focus {
            border-color: var(--primary-500);
            box-shadow: 0 0 0 3px var(--primary-100);
        }

        .form-input.error {
            border-color: var(--error-500);
        }

        .form-input.error:focus {
            box-shadow: 0 0 0 3px var(--error-50);
        }

        .form-input::placeholder {
            color: var(--gray-400);
        }

        .input-icon {
            position: absolute;
            right: var(--spacing-3);
            width: 20px;
            height: 20px;
            color: var(--gray-400);
            pointer-events: none;
            transition: color var(--transition-normal);
        }

        .form-input:focus + .input-icon {
            color: var(--primary-500);
        }

        .password-toggle {
            position: absolute;
            right: var(--spacing-3);
            background: none;
            border: none;
            cursor: pointer;
            padding: var(--spacing-1);
            color: var(--gray-400);
            transition: color var(--transition-normal);
        }

        .password-toggle:hover {
            color: var(--gray-600);
        }

        .password-toggle .input-icon {
            position: static;
            width: 20px;
            height: 20px;
        }

        /* Buttons */
        .btn-primary {
            background: linear-gradient(135deg, var(--primary-600) 0%, var(--primary-700) 100%);
            color: white;
            border: none;
            padding: var(--spacing-4) var(--spacing-6);
            border-radius: var(--radius-md);
            font-size: var(--font-size-base);
            font-weight: 600;
            font-family: var(--font-family);
            cursor: pointer;
            transition: all var(--transition-normal);
            box-shadow: var(--shadow-sm);
            letter-spacing: 0.025em;
        }

        .btn-primary:hover:not(:disabled) {
            background: linear-gradient(135deg, var(--primary-700) 0%, var(--primary-800) 100%);
            box-shadow: var(--shadow-md);
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
            box-shadow: var(--shadow-sm);
        }

        .btn-primary:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: none;
        }

        .btn-secondary {
            background: transparent;
            color: var(--primary-600);
            border: none;
            padding: 0;
            font-size: var(--font-size-base);
            font-weight: 600;
            font-family: var(--font-family);
            text-decoration: none;
            display: inline;
            cursor: pointer;
            transition: color var(--transition-normal);
            letter-spacing: 0.025em;
        }

        .btn-secondary:hover {
            color: var(--primary-700);
            text-decoration: underline;
        }

        .form-footer {
            text-align: center;
            margin-top: var(--spacing-4);
            padding-top: var(--spacing-4);
            border-top: 1px solid var(--gray-200);
        }

        .form-footer-text {
            color: var(--gray-600);
            font-size: var(--font-size-sm);
            margin-bottom: 0;
            display: inline;
        }

        .form-footer .btn-secondary {
            margin-left: var(--spacing-2);
        }

        /* Illustration Section */
        .auth-illustration-section {
            flex: 1;
            background: linear-gradient(135deg, var(--primary-600) 0%, var(--primary-800) 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--spacing-6);
            margin: var(--spacing-4);
            border-radius: var(--radius-xl);
            position: relative;
            overflow: hidden;
        }

        .auth-illustration-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/><circle cx="50" cy="10" r="0.5" fill="white" opacity="0.1"/><circle cx="10" cy="60" r="0.5" fill="white" opacity="0.1"/><circle cx="90" cy="40" r="0.5" fill="white" opacity="0.1"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .illustration-content {
            width: 100%;
            max-width: 500px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .illustration-header {
            margin-bottom: var(--spacing-6);
        }

        .illustration-title {
            font-size: var(--font-size-4xl);
            font-weight: 700;
            color: white;
            margin-bottom: var(--spacing-3);
            letter-spacing: -0.025em;
        }

        .illustration-subtitle {
            font-size: var(--font-size-lg);
            font-weight: 500;
            color: var(--primary-100);
            margin-bottom: var(--spacing-2);
            letter-spacing: -0.01em;
        }

        .illustration-placeholder {
            margin: var(--spacing-6) 0;
            padding: 0;
            background: none;
            border-radius: 0;
            backdrop-filter: none;
            border: none;
        }

        .placeholder-icon {
            width: 250px;
            height: auto;
            max-width: 100%;
            opacity: 0.8;
        }

        .feature-highlights {
            display: flex;
            flex-direction: column;
            gap: var(--spacing-2);
            margin-top: var(--spacing-4);
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: var(--spacing-2);
            padding: var(--spacing-2) var(--spacing-3);
            background: rgba(255, 255, 255, 0.1);
            border-radius: var(--radius-md);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all var(--transition-normal);
        }

        .feature-item:hover {
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        .feature-icon {
            width: 20px;
            height: 20px;
            color: white;
            flex-shrink: 0;
        }

        .feature-item span {
            color: white;
            font-weight: 500;
            font-size: var(--font-size-xs);
        }

        /* Error styles */
        .error-message {
            color: var(--error-500);
            font-size: var(--font-size-sm);
            margin-top: var(--spacing-1);
            display: none;
        }

        .error-message.show {
            display: block;
        }

        /* Message styles */
        .alert {
            padding: var(--spacing-4);
            border-radius: var(--radius-md);
            margin-bottom: var(--spacing-4);
            border: 1px solid;
        }

        .alert-error {
            background-color: var(--error-50);
            color: var(--error-600);
            border-color: var(--error-200);
        }

        .alert-success {
            background-color: var(--success-50);
            color: var(--success-600);
            border-color: var(--success-200);
        }

        .alert-info {
            background-color: var(--primary-50);
            color: var(--primary-600);
            border-color: var(--primary-200);
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .auth-container {
                flex-direction: column;
            }

            .auth-illustration-section {
                display: none;
            }

            .mobile-header {
                display: block;
            }

            .auth-form-section {
                min-height: calc(100vh - 80px);
                flex: 1;
                padding: var(--spacing-6);
                justify-content: flex-start;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }

        @media (max-width: 768px) {
            .auth-form-section {
                padding: var(--spacing-4);
            }

            .form-container {
                max-width: 100%;
            }

            .form-header {
                margin-bottom: var(--spacing-4);
            }

            .form-title {
                font-size: var(--font-size-2xl);
            }

            .form-subtitle {
                font-size: var(--font-size-base);
            }

            .auth-form {
                gap: var(--spacing-3);
            }

            .form-group {
                gap: var(--spacing-1);
            }

            .form-input {
                padding: var(--spacing-2) var(--spacing-3);
                font-size: 16px; /* Prevent zoom on iOS */
            }

            .form-input.with-icon {
                padding-right: var(--spacing-8);
            }

            .form-footer {
                margin-top: var(--spacing-3);
                padding-top: var(--spacing-3);
            }
        }

        @media (max-width: 480px) {
            .auth-form-section {
                padding: var(--spacing-3);
            }

            .form-container {
                padding: var(--spacing-2);
            }

            .form-header {
                margin-bottom: var(--spacing-3);
            }

            .form-title {
                font-size: var(--font-size-xl);
            }

            .form-subtitle {
                font-size: var(--font-size-sm);
            }

            .auth-form {
                gap: var(--spacing-2);
            }

            .form-footer {
                margin-top: var(--spacing-2);
                padding-top: var(--spacing-2);
            }

            .btn-primary {
                width: 100%;
                padding: var(--spacing-3);
                font-size: var(--font-size-sm);
            }

            .form-input {
                padding: var(--spacing-2);
                font-size: var(--font-size-sm);
            }

            .form-input.with-icon {
                padding-right: var(--spacing-6);
            }

            .form-label {
                font-size: var(--font-size-xs);
            }
        }
    </style>
<#elseif section = "form">

<!-- Mobile header (only visible on mobile) -->
<div class="mobile-header">
    <div class="mobile-logo">CSIMS</div>
    <div class="mobile-subtitle">University Registry & Records System</div>
</div>

<div class="auth-container">
    <!-- Left Side - Form Section -->
    <section class="auth-form-section">
        <div class="form-container">
            <header class="form-header">
                <h1 class="form-title">Create Account</h1>
                <p class="form-subtitle">Join the CSIMS platform</p>
            </header>

            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                ${kcSanitize(message.summary)?no_esc}
              </div>
            </#if>

            <form id="kc-register-form" action="${url.registrationAction}" method="post" class="auth-form">
                <div class="form-row">
                    <div class="form-group">
                        <label class="form-label" for="firstName">${msg("firstName")}</label>
                        <input
                            type="text"
                            id="firstName"
                            name="firstName"
                            class="form-input"
                            value="${(register.formData.firstName!'')}"
                            placeholder="First name"
                            autocomplete="given-name"
                            required
                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                        />
                        <div class="error-message" id="firstNameError">Please enter your first name.</div>
                        <#if messagesPerField.existsError('firstName')>
                            <div class="error-message show">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="lastName">${msg("lastName")}</label>
                        <input
                            type="text"
                            id="lastName"
                            name="lastName"
                            class="form-input"
                            value="${(register.formData.lastName!'')}"
                            placeholder="Last name"
                            autocomplete="family-name"
                            required
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                        />
                        <div class="error-message" id="lastNameError">Please enter your last name.</div>
                        <#if messagesPerField.existsError('lastName')>
                            <div class="error-message show">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                            </div>
                        </#if>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label" for="email">${msg("email")}</label>
                    <div class="input-wrapper">
                        <input
                            type="email"
                            id="email"
                            name="email"
                            class="form-input with-icon"
                            value="${(register.formData.email!'')}"
                            placeholder="Enter your email address"
                            autocomplete="email"
                            required
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                        />
                        <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
                        </svg>
                    </div>
                    <div class="error-message" id="emailError">Please enter a valid email address.</div>
                    <#if messagesPerField.existsError('email')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div class="form-group">
    <input
    type="hidden"
    id="clientId"
    name="user.attributes.clientId"
    value="${(register.formData['user.attributes.clientId']!'')}"
/>

    <#if messagesPerField.existsError('user.attributes.clientId')>
        <div class="error-message show">
            ${kcSanitize(messagesPerField.get('user.attributes.clientId'))?no_esc}
        </div>
    </#if>
</div>


                <div class="form-group">
                    <label class="form-label" for="password">${msg("password")}</label>
                    <div class="input-wrapper">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-input with-icon"
                            placeholder="Create a strong password"
                            autocomplete="new-password"
                            required
                            aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                        />
                        <button type="button" class="password-toggle" id="togglePassword">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                            </svg>
                        </button>
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

                <div class="form-group">
                    <label class="form-label" for="password-confirm">${msg("passwordConfirm")}</label>
                    <div class="input-wrapper">
                        <input
                            type="password"
                            id="password-confirm"
                            name="password-confirm"
                            class="form-input with-icon"
                            placeholder="Confirm your password"
                            autocomplete="new-password"
                            required
                            aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <button type="button" class="password-toggle" id="togglePasswordConfirm">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                            </svg>
                        </button>
                    </div>
                    <div class="error-message" id="passwordConfirmError">Passwords do not match.</div>
                    <#if messagesPerField.existsError('password-confirm')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </div>
                    </#if>
                </div>

                <button type="submit" class="btn-primary" id="registerBtn" disabled>
                    ${msg("doRegister")}
                </button>

                <footer class="form-footer">
                    <span class="form-footer-text">Already have an account?</span>
                    <a href="${url.loginUrl}" class="btn-secondary">Sign in</a>
                </footer>
            </form>
        </div>
    </section>

    <!-- Right Side - Illustration Section -->
    <section class="auth-illustration-section">
        <div class="illustration-content">
            <header class="illustration-header">
                <h2 class="illustration-title">CSIMS</h2>
                <h3 class="illustration-subtitle">University Registry & Records System</h3>
            </header>

            <div class="illustration-placeholder">
                <svg class="placeholder-icon" viewBox="0 0 400 300" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <rect x="50" y="50" width="300" height="200" rx="10" fill="white" fill-opacity="0.1" stroke="white" stroke-width="2"/>
                    <rect x="70" y="70" width="260" height="20" rx="5" fill="white" fill-opacity="0.3"/>
                    <rect x="70" y="100" width="200" height="15" rx="3" fill="white" fill-opacity="0.2"/>
                    <rect x="70" y="125" width="180" height="15" rx="3" fill="white" fill-opacity="0.2"/>
                    <rect x="70" y="150" width="220" height="15" rx="3" fill="white" fill-opacity="0.2"/>
                    <circle cx="300" cy="200" r="30" fill="white" fill-opacity="0.2"/>
                    <path d="M285 200L295 210L315 190" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>

            <div class="feature-highlights">
                <div class="feature-item">
                    <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.623 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                    </svg>
                    <span>Secure Document Verification</span>
                </div>
                <div class="feature-item">
                    <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
                    </svg>
                    <span>Real-time Status Tracking</span>
                </div>
                <div class="feature-item">
                    <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v10.5a.75.75 0 0 1-.75.75H5.25a.75.75 0 0 1-.75-.75V8.25a.75.75 0 0 1 .75-.75h13.5a.75.75 0 0 1 .75.75Z" />
                    </svg>
                    <span>Multi-tenant Architecture</span>
                </div>
            </div>
        </div>
    </section>
</div>

<script>
    // Password visibility toggles
    document.getElementById("togglePassword").addEventListener("click", function () {
        togglePasswordVisibility("password", this);
    });

    document.getElementById("togglePasswordConfirm").addEventListener("click", function () {
        togglePasswordVisibility("password-confirm", this);
    });

    function togglePasswordVisibility(inputId, toggleButton) {
        const passwordField = document.getElementById(inputId);
        const icon = toggleButton.querySelector('svg');

        if (passwordField.type === "password") {
            passwordField.type = "text";
            icon.innerHTML = `
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 1-4.243-4.243m4.242 4.242L9.88 9.88" />
            `;
        } else {
            passwordField.type = "password";
            icon.innerHTML = `
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
            `;
        }
    }

    // Validation functions
    function validateFirstName() {
        const input = document.getElementById("firstName");
        const error = document.getElementById("firstNameError");
        const isValid = input.value.trim().length > 0;

        if (input.value.length > 0 && !isValid) {
            error.classList.add("show");
            input.classList.add("error");
        } else {
            error.classList.remove("show");
            input.classList.remove("error");
        }

        return isValid;
    }

    function validateLastName() {
        const input = document.getElementById("lastName");
        const error = document.getElementById("lastNameError");
        const isValid = input.value.trim().length > 0;

        if (input.value.length > 0 && !isValid) {
            error.classList.add("show");
            input.classList.add("error");
        } else {
            error.classList.remove("show");
            input.classList.remove("error");
        }

        return isValid;
    }

    function validateEmail() {
        const input = document.getElementById("email");
        const error = document.getElementById("emailError");
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const isValid = emailRegex.test(input.value);

        if (input.value.length > 0 && !isValid) {
            error.classList.add("show");
            input.classList.add("error");
        } else {
            error.classList.remove("show");
            input.classList.remove("error");
        }

        return isValid;
    }

    function validatePassword() {
        const input = document.getElementById("password");
        const password = input.value;

        const lengthError = document.getElementById("passwordLengthError");
        const uppercaseError = document.getElementById("passwordUppercaseError");
        const lowercaseError = document.getElementById("passwordLowercaseError");
        const specialError = document.getElementById("passwordSpecialError");

        let hasErrors = false;

        if (password.length > 0) {
            // Check length
            if (password.length < 8) {
                lengthError.classList.add("show");
                hasErrors = true;
            } else {
                lengthError.classList.remove("show");
            }

            // Check uppercase
            if (!/[A-Z]/.test(password)) {
                uppercaseError.classList.add("show");
                hasErrors = true;
            } else {
                uppercaseError.classList.remove("show");
            }

            // Check lowercase
            if (!/[a-z]/.test(password)) {
                lowercaseError.classList.add("show");
                hasErrors = true;
            } else {
                lowercaseError.classList.remove("show");
            }

            // Check special character
            if (!/[^a-zA-Z0-9]/.test(password)) {
                specialError.classList.add("show");
                hasErrors = true;
            } else {
                specialError.classList.remove("show");
            }

            if (hasErrors) {
                input.classList.add("error");
            } else {
                input.classList.remove("error");
            }
        } else {
            // Hide all errors when field is empty
            lengthError.classList.remove("show");
            uppercaseError.classList.remove("show");
            lowercaseError.classList.remove("show");
            specialError.classList.remove("show");
            input.classList.remove("error");
        }

        return !hasErrors && password.length >= 8;
    }

    function validatePasswordConfirm() {
        const passwordInput = document.getElementById("password");
        const confirmInput = document.getElementById("password-confirm");
        const error = document.getElementById("passwordConfirmError");
        const isValid = confirmInput.value === passwordInput.value;

        if (confirmInput.value.length > 0 && !isValid) {
            error.classList.add("show");
            confirmInput.classList.add("error");
        } else {
            error.classList.remove("show");
            confirmInput.classList.remove("error");
        }

        return isValid;
    }

    function validateForm() {
        const firstNameValid = validateFirstName();
        const lastNameValid = validateLastName();
        const emailValid = validateEmail();
        const passwordValid = validatePassword();
        const confirmValid = validatePasswordConfirm();

        const registerBtn = document.getElementById("registerBtn");
        const allValid = firstNameValid && lastNameValid && emailValid && passwordValid && confirmValid;

        registerBtn.disabled = !allValid;

        return allValid;
    }

    // Event listeners
    document.getElementById("firstName").addEventListener("input", function() {
        validateFirstName();
        validateForm();
    });

    document.getElementById("lastName").addEventListener("input", function() {
        validateLastName();
        validateForm();
    });

    document.getElementById("email").addEventListener("input", function() {
        validateEmail();
        validateForm();
    });

    document.getElementById("password").addEventListener("input", function() {
        validatePassword();
        validatePasswordConfirm(); // Re-validate confirm password when password changes
        validateForm();
    });

    document.getElementById("password-confirm").addEventListener("input", function() {
        validatePasswordConfirm();
        validateForm();
    });

    // Form submission
    document.getElementById("kc-register-form").addEventListener("submit", function(e) {
        if (!validateForm()) {
            e.preventDefault();
            return;
        }

        const registerBtn = document.getElementById("registerBtn");
        registerBtn.disabled = true;
        registerBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Creating account...';
    });

    // Auto-focus first field
    window.addEventListener("load", function() {
        const firstNameField = document.getElementById("firstName");
        if (firstNameField) {
            firstNameField.focus();
        }
    });
</script>

</#if>
</@layout.registrationLayout>



