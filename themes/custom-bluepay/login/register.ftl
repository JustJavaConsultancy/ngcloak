<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>BluePay - Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url("https://db.onlinewebfonts.com/c/3ddd0e3d1a076e112b27d8d9b7e20200?family=Basis+Grotesque+Pro");

        /* Hide all default Keycloak elements */
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .login-pf-signup,
        .login-pf-social,
        .login-pf-brand,
        .login-pf-footer,
        .feedback-aligner {
            display: none !important;
        }

        .login-pf-page {
            padding-top: 0 !important;
            border: none !important;
            background: none !important;
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
            margin-top: 0 !important;
            padding: 0 !important;
        }

        .login-pf-page .alert {
            margin: 0 !important;
            padding: 0 !important;
            border: none !important;
            background: none !important;
        }

        .login-pf-page .form-control {
            height: auto !important;
            box-shadow: none !important;
        }

        /* Root variables */
        :root {
            --primary-blue: #0C74B1;
            --light-blue: #CFE5F2;
            --dark-blue: #005a9e;
            --text-color: #405979;
            --light-gray: #FFF;
            --darker-blue: #062C5A;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #fff;
            font-family: 'Basis Grotesque Pro', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            font-optical-sizing: auto;
            font-style: normal;
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Desktop Layout */
        .desktop-layout {
            display: none;
        }

        .mobile-layout {
            display: block;
        }

        @media (min-width: 900px) {
            .desktop-layout {
                display: flex !important;
                min-height: 100vh;
            }

            .mobile-layout {
                display: none !important;
            }
        }

        /* Desktop Styles */
        .left-panel {
            background: linear-gradient(#0c74b116, #0C74B1), url('${url.resourcesPath}/img/blueImage.png') no-repeat center center/cover;
            background-size: cover;
            width: 40%;
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: white;
            position: relative;
        }

        .left-content h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .left-content p {
            font-size: 1.1rem;
            font-weight: 400;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        .dots-indicator {
            display: flex;
            gap: 8px;
            margin-top: 2rem;
        }

        .dot {
            width: 10px;
            height: 10px;
            background-color: rgba(255, 255, 255, 0.4);
            border-radius: 50%;
            display: inline-block;
        }

        .dot.active {
            background-color: white;
            width: 25px;
            border-radius: 10px;
        }

        .right-panel {
            width: 60%;
            padding: 2rem;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: white;
        }

        .form-container {
            width: 100%;
            max-width: 600px;
            background: white;
            border-radius: 16px;
            padding: 40px 30px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            border: 1px solid #f1f5f9;
        }

        /* Mobile Styles */
        @media (max-width: 899px) {
            .mobile-container {
                min-height: 100vh;
                padding: 20px;
                background-color: #ffffff;
            }

            .mobile-header {
                text-align: center;
                margin-bottom: 30px;
                padding-top: 20px;
            }

            .mobile-logo {
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 8px;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                color: #0c74b1;
            }

            .mobile-logo-icon {
                background: #0c74b1;
                color: white;
                width: 40px;
                height: 40px;
                border-radius: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .mobile-tagline {
                color: #64748b;
                font-size: 16px;
            }

            .form-container {
                background: white;
                border-radius: 16px;
                padding: 30px 25px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                border: 1px solid #f1f5f9;
                margin-bottom: 20px;
            }

            .mobile-footer-links {
                text-align: center;
                margin-top: 20px;
            }

            .mobile-footer-link {
                color: #0c74b1;
                text-decoration: none;
                font-size: 14px;
                margin: 0 10px;
                font-weight: 500;
            }

            .mobile-security-note {
                text-align: center;
                margin-top: 20px;
                font-size: 12px;
                color: #94a3b8;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 5px;
            }
        }

        /* Form Styles */
        .form-title {
            color: #062c5a;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 8px;
        }

        .form-subtitle {
            color: #64748b;
            margin-bottom: 30px;
            font-size: 15px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #374151;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 16px;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.2s;
            background-color: #f8fafc;
            color: #1e293b;
        }

        .form-input:focus {
            outline: none;
            border-color: #0c74b1;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(12, 116, 177, 0.1);
        }

        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-chevron-down' viewBox='0 0 16 16'%3E%3Cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 12px center;
        }

        .input-group {
            display: flex;
            gap: 12px;
            align-items: stretch;
        }

        .input-group-text {
            padding: 16px;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            background-color: #f8fafc;
            color: #64748b;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 80px;
        }

        .password-toggle {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #64748b;
            cursor: pointer;
            font-size: 18px;
        }

        .btn-primary {
            width: 100%;
            padding: 16px;
            background-color: #0c74b1;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(12, 116, 177, 0.2);
        }

        .btn-primary:hover {
            background-color: #0a6ba8;
        }

        .btn-primary:disabled {
            background-color: #cfe5f2;
            cursor: not-allowed;
            transform: none;
        }

        .btn-primary:active {
            transform: scale(0.98);
        }

        /* Password Requirements */
        .password-requirements {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 16px;
            margin-top: 12px;
            font-size: 14px;
            display: none;
        }

        .password-requirements.visible {
            display: block;
        }

        .password-requirement {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 8px;
        }

        .password-requirement.valid {
            color: #059669;
        }

        .password-requirement.invalid {
            color: #6b7280;
        }

        .password-error {
            color: #dc2626;
            font-size: 14px;
            margin-top: 8px;
            display: none;
        }

        .password-error.visible {
            display: block;
        }

        /* Error Styles */
        .text-danger {
            color: #dc2626;
            font-size: 14px;
            margin-top: 5px;
        }

        .form-error {
            color: #dc2626;
            font-size: 14px;
            margin-top: 5px;
        }

        /* Utility Classes */
        .mb-3 {
            margin-bottom: 20px;
        }

        .mb-4 {
            margin-bottom: 24px;
        }

        .mb-5 {
            margin-bottom: 32px;
        }

        .mt-3 {
            margin-top: 20px;
        }

        .mt-4 {
            margin-top: 24px;
        }

        .row {
            display: flex;
            gap: 16px;
            margin-bottom: 20px;
        }

        .col {
            flex: 1;
        }

        .text-center {
            text-align: center;
        }

        .w-100 {
            width: 100%;
        }

        .d-none {
            display: none;
        }

        .position-relative {
            position: relative;
        }

        /* Mobile specific adjustments */
        @media (max-width: 480px) {
            .form-container {
                padding: 20px 16px;
            }

            .form-title {
                font-size: 22px;
            }

            .row {
                flex-direction: column;
                gap: 0;
            }

            .col {
                margin-bottom: 20px;
            }
        }

        /* Links */
        a {
            color: #0c74b1;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
<#elseif section = "form">

<body>
    <!-- Desktop layout -->
    <div class="desktop-layout">
        <!-- Left Panel -->
        <div class="left-panel">
            <div class="left-content">
                <img src="${url.resourcesPath}/img/logo.svg" alt="BluePay Logo" style="height: 40px; margin-bottom: 2rem;">
                <h1>Create Your Business Account</h1>
                <p>Join thousands of businesses using BluePay for seamless payment processing and financial management.</p>

                <!-- Dots indicator -->
                <div class="dots-indicator">
                    <span class="dot active"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
        </div>

        <!-- Right Panel -->
        <div class="right-panel">
            <div class="form-container">
                <h2 class="form-title">Create Your Account</h2>
                <p class="form-subtitle">Provide your basic information</p>

                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <div class="mb-3">
                        <label class="form-label">Country<span style="color: #dc2626;">*</span></label>
                        <select class="form-input form-select" id="country" name="user.attributes.country" required>
                            <option selected>Nigeria</option>
                            <option value="Ghana">Ghana</option>
                            <option value="Kenya">Kenya</option>
                            <option value="South Africa">South Africa</option>
                        </select>
                        <div id="country-error" class="text-danger d-none">
                            Country not supported
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Business Name<span style="color: #dc2626;">*</span></label>
                        <input type="text" class="form-input" name="user.attributes.businessName" required>
                        <#if messagesPerField.exists('user.attributes.businessName')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessName')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label class="form-label">${msg("firstName")}<span style="color: #dc2626;">*</span></label>
                            <input type="text" class="form-input" name="firstName" required>
                            <#if messagesPerField.exists('firstName')>
                                <div class="text-danger">${kcSanitize(msg(messagesPerField.get('firstName')))?no_esc}</div>
                            </#if>
                        </div>
                        <div class="col">
                            <label class="form-label">${msg("lastName")}<span style="color: #dc2626;">*</span></label>
                            <input type="text" class="form-input" name="lastName" required>
                            <#if messagesPerField.exists('lastName')>
                                <div class="text-danger">${kcSanitize(msg(messagesPerField.get('lastName')))?no_esc}</div>
                            </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number<span style="color: #dc2626;">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text">+234</span>
                            <input type="text" class="form-input" id="phoneNumber" name="user.attributes.phoneNumber" maxlength="10" autocomplete="tel" inputmode="numeric" required style="flex: 1;">
                        </div>
                        <div class="text-danger d-none" id="phone-error">Please enter the other 10 digits of your phone number</div>
                        <#if messagesPerField.exists('user.attributes.phoneNumber')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.phoneNumber')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">${msg("email")}<span style="color: #dc2626;">*</span></label>
                        <input type="email" class="form-input" id="email" name="email" required>
                        <div class="text-danger d-none" id="email-error">Please enter a valid email address.</div>
                        <#if messagesPerField.exists('email')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('email')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Business Type<span style="color: #dc2626;">*</span></label>
                        <select class="form-input form-select" name="user.attributes.businessType" required>
                            <option value="" disabled selected hidden>Select Business Type</option>
                            <option value="Business Name Registration">Business Name Registration</option>
                            <option value="Co-operative Societies">Co-operative Societies</option>
                            <option value="MDAs(Ministries, Departments & Agencies">MDAs (Ministries, Departments & Agencies)</option>
                            <option value="Non-Governmental Organizations(NGOs)">Non-Governmental Organizations (NGOs)</option>
                            <option value="Partnership">Partnership</option>
                            <option value="Private Limited Liability Company(Ltd)">Private Limited Liability Company (Ltd)</option>
                            <option value="Public Limited Liability Company(PLC)">Public Limited Liability Company (PLC)</option>
                        </select>
                        <#if messagesPerField.exists('user.attributes.businessType')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessType')))?no_esc}</div>
                        </#if>
                    </div>

                    <!-- Password Field with Requirements -->
                    <div class="mb-3">
                        <label for="password" class="form-label">${msg("password")}<span style="color: #dc2626;">*</span></label>
                        <div class="position-relative">
                            <input type="password" class="form-input" id="password" name="password" autocomplete="new-password" required>
                            <span class="password-toggle" id="togglePassword">
                                <i class="fa-regular fa-eye"></i>
                            </span>
                        </div>
                        <!-- Password Requirements -->
                        <div class="password-requirements">
                            <p style="color: #1f2937; margin-bottom: 8px; font-weight: 500;">Your password must contain:</p>
                            <div class="password-requirement" data-requirement="length">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 8 characters</span>
                            </div>
                            <div class="password-requirement" data-requirement="uppercase">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 Uppercase character (A-Z)</span>
                            </div>
                            <div class="password-requirement" data-requirement="lowercase">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 lower case character (a-z)</span>
                            </div>
                            <div class="password-requirement" data-requirement="digit">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 digit (0 - 9)</span>
                            </div>
                            <div class="password-requirement" data-requirement="special">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 special character (~!@#$)</span>
                            </div>
                        </div>
                    </div>

                    <!-- Confirm Password Field -->
                    <div class="mb-3">
                        <label for="password-confirm" class="form-label">Confirm Password<span style="color: #dc2626;">*</span></label>
                        <div class="position-relative">
                            <input type="password" class="form-input" id="password-confirm" name="password-confirm" autocomplete="new-password" required>
                            <span class="password-toggle" id="toggleConfirmPassword">
                                <i class="fa-regular fa-eye"></i>
                            </span>
                        </div>
                        <div class="password-error">Passwords must match!</div>
                    </div>

                    <div class="mb-3 mt-4">
                        <button type="submit" class="btn-primary w-100" id="registerButton" disabled>
                            Create Account
                        </button>
                    </div>

                    <div class="mt-3">
                        <p>By clicking the "Create Account" button, you agree to <a href="">BluePay's privacy policy</a> and <a href="">terms of acceptable use and data processing.</a></p>
                        <hr style="margin: 20px 0; border: none; border-top: 1px solid #e2e8f0;" />
                        <p class="text-center">Already have an account? <a href="${url.loginUrl}">Sign in</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Mobile layout -->
    <div class="mobile-layout">
        <div class="mobile-container">
            <!-- Mobile Header -->
            <div class="mobile-header">
                <div class="mobile-logo">
                    <div class="mobile-logo-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    BluePay
                </div>
                <div class="mobile-tagline">Secure payments made simple</div>
            </div>

            <div class="form-container">
                <h2 class="form-title">Create Your Account</h2>
                <p class="form-subtitle">Provide your basic information</p>

                <form id="kc-register-form-mobile" action="${url.registrationAction}" method="post">
                    <div class="mb-3">
                        <label class="form-label">Country<span style="color: #dc2626;">*</span></label>
                        <select class="form-input form-select" id="country-mobile" name="user.attributes.country" required>
                            <option selected>Nigeria</option>
                            <option value="Ghana">Ghana</option>
                            <option value="Kenya">Kenya</option>
                            <option value="South Africa">South Africa</option>
                        </select>
                        <div id="country-error-mobile" class="text-danger d-none">
                            Country not supported
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Business Name<span style="color: #dc2626;">*</span></label>
                        <input type="text" class="form-input" name="user.attributes.businessName" required>
                        <#if messagesPerField.exists('user.attributes.businessName')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessName')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">${msg("firstName")}<span style="color: #dc2626;">*</span></label>
                        <input type="text" class="form-input" name="firstName" required>
                        <#if messagesPerField.exists('firstName')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('firstName')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">${msg("lastName")}<span style="color: #dc2626;">*</span></label>
                        <input type="text" class="form-input" name="lastName" required>
                        <#if messagesPerField.exists('lastName')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('lastName')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Phone Number<span style="color: #dc2626;">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text">+234</span>
                            <input type="text" class="form-input" id="phoneNumber-mobile" name="user.attributes.phoneNumber" maxlength="10" autocomplete="tel" inputmode="numeric" required style="flex: 1;">
                        </div>
                        <div class="text-danger d-none" id="phone-error-mobile">Please enter the other 10 digits of your phone number</div>
                        <#if messagesPerField.exists('user.attributes.phoneNumber')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.phoneNumber')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">${msg("email")}<span style="color: #dc2626;">*</span></label>
                        <input type="email" class="form-input" id="email-mobile" name="email" required>
                        <div class="text-danger d-none" id="email-error-mobile">Please enter a valid email address.</div>
                        <#if messagesPerField.exists('email')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('email')))?no_esc}</div>
                        </#if>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Business Type<span style="color: #dc2626;">*</span></label>
                        <select class="form-input form-select" name="user.attributes.businessType" required>
                            <option value="" disabled selected hidden>Select Business Type</option>
                            <option value="Business Name Registration">Business Name Registration</option>
                            <option value="Co-operative Societies">Co-operative Societies</option>
                            <option value="MDAs(Ministries, Departments & Agencies">MDAs (Ministries, Departments & Agencies)</option>
                            <option value="Non-Governmental Organizations(NGOs)">Non-Governmental Organizations (NGOs)</option>
                            <option value="Partnership">Partnership</option>
                            <option value="Private Limited Liability Company(Ltd)">Private Limited Liability Company (Ltd)</option>
                            <option value="Public Limited Liability Company(PLC)">Public Limited Liability Company (PLC)</option>
                        </select>
                        <#if messagesPerField.exists('user.attributes.businessType')>
                            <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessType')))?no_esc}</div>
                        </#if>
                    </div>

                    <!-- Password Field with Requirements -->
                    <div class="mb-3">
                        <label for="password-mobile" class="form-label">${msg("password")}<span style="color: #dc2626;">*</span></label>
                        <div class="position-relative">
                            <input type="password" class="form-input" id="password-mobile" name="password" autocomplete="new-password" required>
                            <span class="password-toggle" id="togglePassword-mobile">
                                <i class="fa-regular fa-eye"></i>
                            </span>
                        </div>
                        <!-- Password Requirements -->
                        <div class="password-requirements" id="password-requirements-mobile">
                            <p style="color: #1f2937; margin-bottom: 8px; font-weight: 500;">Your password must contain:</p>
                            <div class="password-requirement" data-requirement="length">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 8 characters</span>
                            </div>
                            <div class="password-requirement" data-requirement="uppercase">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 Uppercase character (A-Z)</span>
                            </div>
                            <div class="password-requirement" data-requirement="lowercase">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 lower case character (a-z)</span>
                            </div>
                            <div class="password-requirement" data-requirement="digit">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 digit (0 - 9)</span>
                            </div>
                            <div class="password-requirement" data-requirement="special">
                                <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                <span>At least 1 special character (~!@#$)</span>
                            </div>
                        </div>
                    </div>

                    <!-- Confirm Password Field -->
                    <div class="mb-3">
                        <label for="password-confirm-mobile" class="form-label">Confirm Password<span style="color: #dc2626;">*</span></label>
                        <div class="position-relative">
                            <input type="password" class="form-input" id="password-confirm-mobile" name="password-confirm" autocomplete="new-password" required>
                            <span class="password-toggle" id="toggleConfirmPassword-mobile">
                                <i class="fa-regular fa-eye"></i>
                            </span>
                        </div>
                        <div class="password-error" id="password-error-mobile">Passwords must match!</div>
                    </div>

                    <div class="mb-3 mt-4">
                        <button type="submit" class="btn-primary w-100" id="registerButton-mobile" disabled>
                            Create Account
                        </button>
                    </div>

                    <div class="mt-3">
                        <p>By clicking the "Create Account" button, you agree to <a href="">BluePay's privacy policy</a> and <a href="">terms of acceptable use and data processing.</a></p>
                        <hr style="margin: 20px 0; border: none; border-top: 1px solid #e2e8f0;" />
                        <p class="text-center">Already have an account? <a href="${url.loginUrl}">Sign in</a></p>
                    </div>
                </form>
            </div>

            <!-- Mobile Footer Links -->
            <div class="mobile-footer-links">
                <a href="${url.loginUrl}" class="mobile-footer-link">Sign in instead</a>
                <a href="#" class="mobile-footer-link">Help Center</a>
            </div>

            <!-- Mobile Security Note -->
            <div class="mobile-security-note">
                <i class="fas fa-lock"></i>
                Your information is securely encrypted
            </div>
        </div>
    </div>

    <script>
        // Pass the resource path to JavaScript
        window.resourcesPath = "${url.resourcesPath}";
    </script>
    <script src="${url.resourcesPath}/js/script.js"></script>
</body>

</#if>
</@layout.registrationLayout>
