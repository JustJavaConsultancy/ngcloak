<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>Just Java | Sign Up - Document Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
        .login-pf-page .card-pf .card-pf-title {
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

        /* Custom styles */
        :root {
            --rich-black: #070f29;
            --ultramarine-blue: #255bec;
            --violet: #780aff;
            --maya-blue: #5ecaf9;
            --white: #ffffff;
            --light-gray: #f8fafc;
            --medium-gray: #e2e8f0;
            --dark-gray: #64748b;
            --text-dark: #1e293b;
        }

        * {
            box-sizing: border-box;
        }

        html, body {
            margin: 0 !important;
            padding: 0 !important;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif !important;
            background-color: var(--light-gray) !important;
            color: var(--text-dark) !important;
            line-height: 1.6 !important;
            height: 100% !important;
            overflow-x: hidden !important;
        }

        .custom-register-container {
            display: flex;
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-radius: 12px;
            overflow: hidden;
            margin: 20px auto;
            min-height: calc(100vh - 40px);
        }

        .brand-section {
            flex: 1.2;
            background: linear-gradient(135deg, var(--rich-black) 0%, var(--violet) 100%);
            color: var(--white);
            padding: 3rem 4rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
        }

        .brand-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23780aff' fill-opacity='0.08' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.4;
        }

        .logo-container {
            display: flex;
            align-items: center;
            margin-bottom: 2.5rem;
            position: relative;
            z-index: 1;
        }

        .logo {
            height: 50px;
            width: 38px;
            margin-right: 15px;
        }

        .logo-text {
            font-size: 1.8rem;
            font-weight: 700;
        }

        .tagline {
            font-size: 2.2rem;
            font-weight: 300;
            margin-bottom: 2.5rem;
            line-height: 1.3;
            position: relative;
            z-index: 1;
        }

        .system-description {
            margin-bottom: 3rem;
            position: relative;
            z-index: 1;
        }

        .system-description h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            font-weight: 600;
        }

        .system-description p {
            opacity: 0.9;
            font-size: 1.05rem;
            max-width: 500px;
        }

        .features {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-top: 2rem;
            position: relative;
            z-index: 1;
        }

        .feature {
            display: flex;
            align-items: flex-start;
        }

        .feature-icon {
            background-color: rgba(255, 255, 255, 0.15);
            width: 36px;
            height: 36px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 12px;
            flex-shrink: 0;
        }

        .feature-text h3 {
            font-size: 1rem;
            margin-bottom: 4px;
            font-weight: 600;
        }

        .feature-text p {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        .copyright {
            margin-top: 3rem;
            font-size: 0.85rem;
            opacity: 0.7;
            position: relative;
            z-index: 1;
        }

        .register-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 3rem 4rem;
            background-color: var(--white);
        }

        .register-container {
            max-width: 420px;
            width: 100%;
            margin: 0 auto;
        }

        .register-header {
            margin-bottom: 2.5rem;
            text-align: center;
        }

        .register-header h1 {
            font-size: 2.2rem;
            margin-bottom: 0.5rem;
            color: var(--rich-black);
            font-weight: 700;
        }

        .register-header p {
            color: var(--dark-gray);
            font-size: 1.05rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-row {
            display: flex;
            gap: 1rem;
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--text-dark);
            font-size: 0.95rem;
        }

        .input-with-icon {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--dark-gray);
            cursor: pointer;
            transition: color 0.2s;
        }

        .password-toggle:hover {
            color: var(--ultramarine-blue);
        }

        .form-input {
            width: 100%;
            padding: 0.85rem 1rem;
            border: 1px solid var(--medium-gray);
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
            background-color: var(--light-gray);
        }

        .form-input.with-icon {
            padding-left: 45px;
        }

        .form-input.with-toggle {
            padding-right: 45px;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--ultramarine-blue);
            box-shadow: 0 0 0 3px rgba(37, 91, 236, 0.1);
            background-color: var(--white);
        }

        .form-input.error {
            border-color: #dc2626;
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
        }

        .register-button {
            width: 100%;
            padding: 0.9rem;
            background: linear-gradient(135deg, var(--ultramarine-blue) 0%, var(--violet) 100%);
            color: var(--white);
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 12px rgba(37, 91, 236, 0.2);
        }

        .register-button:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(37, 91, 236, 0.3);
        }

        .register-button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
            transform: none;
        }

        .login-link {
            text-align: center;
            margin-top: 2rem;
            color: var(--dark-gray);
            font-size: 0.95rem;
        }

        .login-link a {
            color: var(--ultramarine-blue);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
        }

        .login-link a:hover {
            color: var(--violet);
            text-decoration: underline;
        }

        .security-notice {
            margin-top: 2rem;
            padding: 1rem;
            background-color: rgba(37, 91, 236, 0.05);
            border-radius: 8px;
            border-left: 4px solid var(--ultramarine-blue);
            font-size: 0.85rem;
            color: var(--dark-gray);
        }

        .error-message {
            color: #dc2626;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: none;
        }

        .error-message.show {
            display: block;
        }

        /* Mobile-specific styles */
        .mobile-header {
            display: none;
            background: linear-gradient(135deg, var(--rich-black) 0%, var(--violet) 100%);
            color: var(--white);
            padding: 2rem 1.5rem 1.5rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .mobile-header::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23780aff' fill-opacity='0.08' fill-rule='evenodd'/%3E%3C/svg%3E");
            opacity: 0.4;
        }

        .mobile-logo-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            position: relative;
            z-index: 1;
        }

        .mobile-logo {
            height: 40px;
            width: 30px;
            margin-right: 12px;
        }

        .mobile-logo-text {
            font-size: 1.5rem;
            font-weight: 700;
        }

        .mobile-subtitle {
            font-size: 0.9rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        /* Responsive design */
        @media (max-width: 1024px) {
            .custom-register-container {
                flex-direction: column;
                margin: 0;
                border-radius: 0;
                min-height: 100vh;
                box-shadow: none;
            }

            .brand-section {
                display: none;
            }

            .mobile-header {
                display: block;
            }

            .register-section {
                padding: 2rem 1.5rem;
                flex: 1;
                justify-content: flex-start;
            }

            .register-container {
                max-width: 400px;
            }

            .register-header {
                margin-bottom: 2rem;
            }

            .register-header h1 {
                font-size: 1.8rem;
            }

            .form-input {
                padding: 1rem;
                font-size: 16px; /* Prevent zoom on iOS */
            }

            .form-input.with-icon {
                padding-left: 45px;
            }

            .form-input.with-toggle {
                padding-right: 45px;
            }

            .register-button {
                padding: 1rem;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }

        @media (max-width: 480px) {
            .register-section {
                padding: 1.5rem 1rem;
            }

            .mobile-header {
                padding: 1.5rem 1rem 1rem;
            }

            .register-header h1 {
                font-size: 1.6rem;
            }

            .security-notice {
                font-size: 0.8rem;
                padding: 0.8rem;
            }
        }
    </style>
<#elseif section = "form">

<!-- Mobile header (only visible on mobile) -->
<div class="mobile-header">
    <div class="mobile-logo-container">
        <svg class="mobile-logo" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M24 4C35.0457 4 44 12.9543 44 24C44 35.0457 35.0457 44 24 44C12.9543 44 4 35.0457 4 24C4 12.9543 12.9543 4 24 4Z" fill="white"/>
            <path d="M24 8C32.8366 8 40 15.1634 40 24C40 32.8366 32.8366 40 24 40C15.1634 40 8 32.8366 8 24C8 15.1634 15.1634 8 24 8Z" fill="#255bec"/>
            <path d="M24 12C30.6274 12 36 17.3726 36 24C36 30.6274 30.6274 36 24 36C17.3726 36 12 30.6274 12 24C12 17.3726 17.3726 12 24 12Z" fill="white"/>
        </svg>
        <div class="mobile-logo-text">Just Java</div>
    </div>
    <div class="mobile-subtitle">Document Management System</div>
</div>

<div class="custom-register-container">
    <div class="brand-section">
        <div>
            <div class="logo-container">
                <svg class="logo" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M24 4C35.0457 4 44 12.9543 44 24C44 35.0457 35.0457 44 24 44C12.9543 44 4 35.0457 4 24C4 12.9543 12.9543 4 24 4Z" fill="white"/>
                    <path d="M24 8C32.8366 8 40 15.1634 40 24C40 32.8366 32.8366 40 24 40C15.1634 40 8 32.8366 8 24C8 15.1634 15.1634 8 24 8Z" fill="#255bec"/>
                    <path d="M24 12C30.6274 12 36 17.3726 36 24C36 30.6274 30.6274 36 24 36C17.3726 36 12 30.6274 12 24C12 17.3726 17.3726 12 24 12Z" fill="white"/>
                </svg>
                <div class="logo-text">Just Java</div>
            </div>

            <div class="tagline">Innovate,<br />Develop,<br />Empower.</div>

            <div class="system-description">
                <h2>Document Management System</h2>
                <p>
                    Join our secure, scalable platform for organizing, storing, and
                    retrieving your digital documents with enterprise-grade security
                    and compliance.
                </p>
            </div>

            <div class="features">
                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div class="feature-text">
                        <h3>Secure Storage</h3>
                        <p>Enterprise-grade security for all your documents</p>
                    </div>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <div class="feature-text">
                        <h3>Advanced Search</h3>
                        <p>Find documents quickly with powerful search</p>
                    </div>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-tags"></i>
                    </div>
                    <div class="feature-text">
                        <h3>Smart Tagging</h3>
                        <p>Organize documents with custom tags</p>
                    </div>
                </div>

                <div class="feature">
                    <div class="feature-icon">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </div>
                    <div class="feature-text">
                        <h3>Scalable</h3>
                        <p>Grows with your business needs</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="copyright">&copy; 2025 Just Java. All rights reserved.</div>
    </div>

    <div class="register-section">
        <div class="register-container">
            <div class="register-header">
                <h1>Create Account</h1>
                <p>Join our document management system</p>
            </div>

            <form id="kc-register-form" action="${url.registrationAction}" method="post">
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
                    <div class="input-with-icon">
                        <i class="fas fa-envelope input-icon"></i>
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
                    </div>
                    <div class="error-message" id="emailError">Please enter a valid email address.</div>
                    <#if messagesPerField.existsError('email')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">${msg("password")}</label>
                    <div class="input-with-icon">
                        <i class="fas fa-lock input-icon"></i>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-input with-icon with-toggle"
                            placeholder="Create a strong password"
                            autocomplete="new-password"
                            required
                            aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                        />
                        <i class="fas fa-eye password-toggle" id="togglePassword"></i>
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
                    <div class="input-with-icon">
                        <i class="fas fa-lock input-icon"></i>
                        <input
                            type="password"
                            id="password-confirm"
                            name="password-confirm"
                            class="form-input with-icon with-toggle"
                            placeholder="Confirm your password"
                            autocomplete="new-password"
                            required
                            aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <i class="fas fa-eye password-toggle" id="togglePasswordConfirm"></i>
                    </div>
                    <div class="error-message" id="passwordConfirmError">Passwords do not match.</div>
                    <#if messagesPerField.existsError('password-confirm')>
                        <div class="error-message show">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </div>
                    </#if>
                </div>

                <button type="submit" class="register-button" id="registerBtn" disabled>
                    ${msg("doRegister")}
                </button>
            </form>

            <div class="login-link">
                Already have an account? <a href="${url.loginUrl}">Sign in</a>
            </div>

            <div class="security-notice">
                <i class="fas fa-info-circle"></i> By creating an account, you agree to our terms of service and privacy policy. Your data is protected with enterprise-grade security.
            </div>
        </div>
    </div>
</div>

<script>
    // Password visibility toggles
    document.getElementById("togglePassword").addEventListener("click", function () {
        togglePasswordVisibility("password", this);
    });

    document.getElementById("togglePasswordConfirm").addEventListener("click", function () {
        togglePasswordVisibility("password-confirm", this);
    });

    function togglePasswordVisibility(inputId, toggleIcon) {
        const passwordField = document.getElementById(inputId);

        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
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
