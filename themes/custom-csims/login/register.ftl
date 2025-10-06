<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Sign Up - CSIMS</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Aeonik:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
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

      body {
          font-family: var(--font-family);
          font-size: var(--font-size-base);
          line-height: 1.6;
          color: var(--gray-900);
          background-color: var(--gray-50);
          -webkit-font-smoothing: antialiased;
          -moz-osx-font-smoothing: grayscale;
      }

      #kc-info-wrapper {
        display: none;
      }

      .login-pf-page .card-pf {
        padding: 0px;
        margin-bottom: 0;
      }

      .login-pf-header, .login-pf-page-header {
        display: none !important;
      }

      .login-pf-page {
        padding-top: 0px;
      }

      .card-pf {
        max-width: 15000px !important;
        padding: 0;
        border-top: 0px solid transparent;
      }

      @media (min-width: 768px) {
        .login-pf-page .card-pf {
          padding: 0px;
        }
      }

      #kc-content-wrapper {
        margin-top: 0px;
      }

      #kc-info {
        margin: 0px;
      }

      html, body {
        overflow-x: hidden;
      }

      /* Auth Container */
      .auth-container {
          display: flex;
          min-height: 100vh;
          background: linear-gradient(135deg, var(--primary-50) 0%, var(--gray-50) 100%);
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
          max-width: 400px;
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

      .form-input,
      .form-select {
          width: 100%;
          padding: var(--spacing-3) var(--spacing-4);
          padding-right: var(--spacing-10);
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

      .form-input:focus,
      .form-select:focus {
          border-color: var(--primary-500);
          box-shadow: 0 0 0 3px var(--primary-100);
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

      .form-input:focus + .input-icon,
      .form-select:focus + .input-icon {
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

      .select-wrapper {
          position: relative;
      }

      .select-icon {
          position: absolute;
          right: var(--spacing-3);
          top: 50%;
          transform: translateY(-50%);
          width: 20px;
          height: 20px;
          color: var(--gray-400);
          pointer-events: none;
          transition: color var(--transition-normal);
      }

      .form-select:focus + .select-icon {
          color: var(--primary-500);
      }

      /* Password Requirements */
      .password-requirements {
          display: flex;
          align-items: center;
          gap: var(--spacing-2);
          margin-top: var(--spacing-2);
          flex-wrap: wrap;
      }

      .requirement {
          display: flex;
          align-items: center;
          gap: var(--spacing-1);
          font-size: var(--font-size-xs);
          color: var(--gray-500);
          transition: color var(--transition-normal);
      }

      .requirement:not(:last-child)::after {
          content: '•';
          color: var(--gray-400);
          margin-left: var(--spacing-2);
      }

      .requirement.valid {
          color: var(--success-600);
      }

      /* Form Options */
      .form-options {
          display: flex;
          justify-content: space-between;
          align-items: center;
          margin: var(--spacing-2) 0;
      }

      .checkbox-wrapper {
          display: flex;
          align-items: center;
          gap: var(--spacing-2);
          cursor: pointer;
          font-size: var(--font-size-sm);
          color: var(--gray-600);
      }

      .checkbox-wrapper input[type="checkbox"] {
          display: none;
      }

      .checkmark {
          width: 20px;
          height: 20px;
          border: 2px solid var(--gray-300);
          border-radius: var(--radius-sm);
          display: flex;
          align-items: center;
          justify-content: center;
          transition: all var(--transition-normal);
          position: relative;
      }

      .checkbox-wrapper input[type="checkbox"]:checked + .checkmark {
          background-color: var(--primary-500);
          border-color: var(--primary-500);
      }

      .checkbox-wrapper input[type="checkbox"]:checked + .checkmark::after {
          content: '✓';
          color: white;
          font-size: 12px;
          font-weight: bold;
      }

      .terms-link {
          color: var(--primary-600);
          text-decoration: none;
          font-weight: 500;
          transition: color var(--transition-normal);
      }

      .terms-link:hover {
          color: var(--primary-700);
          text-decoration: underline;
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

      .btn-primary:hover {
          background: linear-gradient(135deg, var(--primary-700) 0%, var(--primary-800) 100%);
          box-shadow: var(--shadow-md);
          transform: translateY(-1px);
      }

      .btn-primary:active {
          transform: translateY(0);
          box-shadow: var(--shadow-sm);
      }

      .btn-primary:disabled {
          background: var(--gray-400);
          cursor: not-allowed;
          transform: none;
          box-shadow: var(--shadow-sm);
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
      .form-input.error {
          border-color: var(--error-500);
      }

      .form-input.error:focus {
          box-shadow: 0 0 0 3px var(--error-50);
      }

      .error-message {
          color: var(--error-500);
          font-size: var(--font-size-sm);
          margin-top: var(--spacing-1);
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

      /* Grid layout for form fields */
      .form-grid {
          display: grid;
          grid-template-columns: 1fr 1fr;
          gap: var(--spacing-4);
      }

      /* Responsive Design */
      @media (max-width: 1024px) {
          .auth-container {
              flex-direction: column;
          }

          .auth-form-section {
              min-height: 100vh;
              flex: 1;
          }

          .auth-illustration-section {
              display: none;
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

          .form-input,
          .form-select {
              padding: var(--spacing-2) var(--spacing-3);
              padding-right: var(--spacing-8);
          }

          .form-footer {
              margin-top: var(--spacing-3);
              padding-top: var(--spacing-3);
          }

          .form-grid {
              grid-template-columns: 1fr;
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

          .form-options {
              flex-direction: column;
              gap: var(--spacing-2);
              align-items: flex-start;
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

          .form-input,
          .form-select {
              padding: var(--spacing-2);
              padding-right: var(--spacing-6);
              font-size: var(--font-size-sm);
          }

          .form-label {
              font-size: var(--font-size-xs);
          }
      }
    </style>

    <div class="auth-container">
        <!-- Left Side - Form Section -->
        <section class="auth-form-section">
            <div class="form-container">
                <header class="form-header">
                    <h1 class="form-title">Create Account</h1>
                    <p class="form-subtitle">Join CSIMS to manage your academic records</p>
                </header>

                <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                  <div class="alert alert-<#if message.type = 'error'>error<#elseif message.type = 'success'>success<#else>info</#if>">
                    ${kcSanitize(message.summary)?no_esc}
                  </div>
                </#if>

                <form id="kc-register-form" action="${url.registrationAction}" method="post" class="auth-form">
                    <div class="form-group">
                        <label for="userType" class="form-label">Account Type</label>
                        <div class="select-wrapper">
                            <select id="userType" name="userType" class="form-select" required>
                                <option value="">Select account type</option>
                                <option value="student">Student</option>
                                <option value="alumni">Alumni</option>
                                <option value="external">External User</option>
                                <option value="verifier">Third-Party Verifier</option>
                            </select>
                            <svg class="select-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="m19.5 8.25-7.5 7.5-7.5-7.5" />
                            </svg>
                        </div>
                    </div>

                    <div class="form-group" id="matricGroup" style="display: none;">
                        <label for="matricNumber" class="form-label">Matriculation Number</label>
                        <div class="input-wrapper">
                            <input type="text" id="matricNumber" name="matricNumber" class="form-input">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 0 0 2.25-2.25V6.75A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25v10.5A2.25 2.25 0 0 0 4.5 19.5Zm6-10.125a1.875 1.875 0 1 1-3.75 0 1.875 1.875 0 0 1 3.75 0Z" />
                            </svg>
                        </div>
                    </div>

                    <div class="form-group" id="phoneGroup" style="display: none;">
                        <label for="phoneNumber" class="form-label">Phone Number</label>
                        <div class="input-wrapper">
                            <input type="tel" id="phoneNumber" name="phoneNumber" class="form-input">
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 6.75c0 8.284 6.716 15 15 15h2.25a2.25 2.25 0 0 0 2.25-2.25v-1.372c0-.516-.351-.966-.852-1.091l-4.423-1.106c-.44-.11-.902.055-1.173.417l-.97 1.293c-.282.376-.769.542-1.21.38a12.035 12.035 0 0 1-7.143-7.143c-.162-.441.004-.928.38-1.21l1.293-.97c.363-.271.527-.734.417-1.173L6.963 3.102a1.125 1.125 0 0 0-1.091-.852H3.75A2.25 2.25 0 0 0 1.5 4.5v2.25Z" />
                            </svg>
                        </div>
                    </div>

                    <div class="form-grid">
                        <div class="form-group">
                            <label for="firstName" class="form-label">${msg("firstName")}</label>
                            <div class="input-wrapper">
                                <input
                                    type="text"
                                    id="firstName"
                                    name="firstName"
                                    value="${(register.formData.firstName!'')}"
                                    class="form-input <#if messagesPerField.existsError('firstName')>error</#if>"
                                    placeholder="John"
                                    autocomplete="given-name"
                                    required>
                                <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                                </svg>
                            </div>
                            <#if messagesPerField.existsError('firstName')>
                              <div class="error-message">
                                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                              </div>
                            </#if>
                        </div>

                        <div class="form-group">
                            <label for="lastName" class="form-label">${msg("lastName")}</label>
                            <div class="input-wrapper">
                                <input
                                    type="text"
                                    id="lastName"
                                    name="lastName"
                                    value="${(register.formData.lastName!'')}"
                                    class="form-input <#if messagesPerField.existsError('lastName')>error</#if>"
                                    placeholder="Doe"
                                    autocomplete="family-name"
                                    required>
                                <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                                </svg>
                            </div>
                            <#if messagesPerField.existsError('lastName')>
                              <div class="error-message">
                                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                              </div>
                            </#if>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email" class="form-label">${msg("email")}</label>
                        <div class="input-wrapper">
                            <input
                                type="email"
                                id="email"
                                name="email"
                                value="${(register.formData.email!'')}"
                                class="form-input <#if messagesPerField.existsError('email')>error</#if>"
                                placeholder="you@example.com"
                                autocomplete="email"
                                required>
                            <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M21.75 6.75v10.5a2.25 2.25 0 0 1-2.25 2.25h-15a2.25 2.25 0 0 1-2.25-2.25V6.75m19.5 0A2.25 2.25 0 0 0 19.5 4.5h-15a2.25 2.25 0 0 0-2.25 2.25m19.5 0v.243a2.25 2.25 0 0 1-1.07 1.916l-7.5 4.615a2.25 2.25 0 0 1-2.36 0L3.32 8.91a2.25 2.25 0 0 1-1.07-1.916V6.75" />
                            </svg>
                        </div>
                        <#if messagesPerField.existsError('email')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.get('email'))?no_esc}
                          </div>
                        </#if>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                      <div class="form-group">
                          <label for="username" class="form-label">${msg("username")}</label>
                          <div class="input-wrapper">
                              <input
                                  type="text"
                                  id="username"
                                  name="username"
                                  value="${(register.formData.username!'')}"
                                  class="form-input <#if messagesPerField.existsError('username')>error</#if>"
                                  placeholder="username"
                                  autocomplete="username"
                                  required>
                              <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                  <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                              </svg>
                          </div>
                          <#if messagesPerField.existsError('username')>
                            <div class="error-message">
                              ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </div>
                          </#if>
                      </div>
                    </#if>

                    <div class="form-group">
                        <label for="password" class="form-label">${msg("password")}</label>
                        <div class="input-wrapper">
                            <input
                                type="password"
                                id="password"
                                name="password"
                                class="form-input <#if messagesPerField.existsError('password')>error</#if>"
                                placeholder="••••••••"
                                autocomplete="new-password"
                                required>
                            <button type="button" class="password-toggle" id="passwordToggle">
                                <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                </svg>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                          </div>
                        </#if>
                        <div class="password-requirements">
                            <div class="requirement" id="length-req">
                                <span>At least 8 characters</span>
                            </div>
                            <div class="requirement" id="uppercase-req">
                                <span>One uppercase letter</span>
                            </div>
                            <div class="requirement" id="number-req">
                                <span>One number</span>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                        <div class="input-wrapper">
                            <input
                                type="password"
                                id="password-confirm"
                                name="password-confirm"
                                class="form-input <#if messagesPerField.existsError('password-confirm')>error</#if>"
                                placeholder="••••••••"
                                autocomplete="new-password"
                                required>
                            <button type="button" class="password-toggle" id="confirmPasswordToggle">
                                <svg class="input-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                </svg>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                          </div>
                        </#if>
                    </div>

                    <#if recaptchaRequired??>
                      <div class="form-group">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                      </div>
                    </#if>

                    <div class="form-options">
                        <label class="checkbox-wrapper">
                            <input type="checkbox" id="agreeTerms" name="agreeTerms" required>
                            <span class="checkmark"></span>
                            <span class="checkbox-label">I agree to the <a href="#" class="terms-link">Terms of Service</a> and <a href="#" class="terms-link">Privacy Policy</a></span>
                        </label>
                    </div>

                    <button type="submit" class="btn-primary" id="register-button">${msg("doRegister")}</button>

                    <footer class="form-footer">
                        <span class="form-footer-text">Already have an account?</span>
                        <a href="${url.loginUrl}" class="btn-secondary">Sign In</a>
                    </footer>
                </form>
            </div>
        </section>

        <!-- Right Side - Illustration Section -->
        <section class="auth-illustration-section">
            <div class="illustration-content">
                <header class="illustration-header">
                    <h2 class="illustration-title">Join CSIMS</h2>
                    <h3 class="illustration-subtitle">Your Academic Records Hub</h3>
                </header>

                <div class="illustration-placeholder">
                    <img src="${url.resourcesPath}/img/certificate.svg" alt="Certificate illustration" class="placeholder-icon">
                </div>

                <div class="feature-highlights">
                    <div class="feature-item">
                        <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" />
                        </svg>
                        <span>Student Portal Access</span>
                    </div>
                    <div class="feature-item">
                        <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75 11.25 15 15 9.75m-3-7.036A11.959 11.959 0 0 1 3.598 6 11.99 11.99 0 0 0 3 9.749c0 5.592 3.824 10.29 9 11.623 5.176-1.332 9-6.03 9-11.623 0-1.31-.21-2.571-.598-3.751h-.152c-3.196 0-6.1-1.248-8.25-3.285Z" />
                        </svg>
                        <span>Secure 2FA Authentication</span>
                    </div>
                    <div class="feature-item">
                        <svg class="feature-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v10.5a.75.75 0 0 1-.75.75H5.25a.75.75 0 0 1-.75-.75V8.25a.75.75 0 0 1 .75-.75h13.5a.75.75 0 0 1 .75.75Z" />
                        </svg>
                        <span>Multi-University Support</span>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        // Password toggle functionality
        function togglePasswordVisibility(inputId) {
            const input = document.getElementById(inputId);
            const toggle = input.parentElement.querySelector('.password-toggle');
            const icon = toggle.querySelector('svg');

            if (input.type === 'password') {
                input.type = 'text';
                icon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 0 0 1.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.451 10.451 0 0 1 12 4.5c4.756 0 8.773 3.162 10.065 7.498a10.522 10.522 0 0 1-4.293 5.774M6.228 6.228 3 3m3.228 3.228 3.65 3.65m7.894 7.894L21 21m-3.228-3.228-3.65-3.65m0 0a3 3 0 1 1-4.243-4.243m4.242 4.242L9.88 9.88" />
                `;
            } else {
                input.type = 'password';
                icon.innerHTML = `
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                `;
            }
        }

        // Password validation
        function validatePassword() {
            const passwordInput = document.getElementById('password');
            if (!passwordInput) return;

            const password = passwordInput.value;
            const requirements = {
                length: password.length >= 8,
                uppercase: /[A-Z]/.test(password),
                number: /\d/.test(password)
            };

            // Update requirement indicators
            updateRequirement('length-req', requirements.length);
            updateRequirement('uppercase-req', requirements.uppercase);
            updateRequirement('number-req', requirements.number);

            return Object.values(requirements).every(req => req);
        }

        function updateRequirement(requirementId, isValid) {
            const requirement = document.getElementById(requirementId);
            if (!requirement) return;

            if (isValid) {
                requirement.classList.add('valid');
            } else {
                requirement.classList.remove('valid');
            }
        }

        function validatePasswordMatch() {
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('password-confirm');

            if (!passwordInput || !confirmPasswordInput) return true;

            const password = passwordInput.value;
            const confirmPassword = confirmPasswordInput.value;

            if (confirmPassword && password !== confirmPassword) {
                confirmPasswordInput.classList.add('error');
                return false;
            } else {
                confirmPasswordInput.classList.remove('error');
                return true;
            }
        }

            // User type dropdown functionality
        function setupUserTypeToggle() {
            const userTypeSelect = document.getElementById('userType');
            const matricGroup = document.getElementById('matricGroup');
            const phoneGroup = document.getElementById('phoneGroup');

            if (!userTypeSelect) return;

            userTypeSelect.addEventListener('change', function(e) {
                const userType = e.target.value;

                // Show/hide matriculation number field for students
                if (matricGroup) {
                    matricGroup.style.display = userType === 'student' ? 'block' : 'none';
                    const matricInput = document.getElementById('matricNumber');
                    if (matricInput) {
                        matricInput.required = userType === 'student';
                    }
                }

                // Show/hide phone number field for alumni and external users
                if (phoneGroup) {
                    phoneGroup.style.display = (userType === 'alumni' || userType === 'external') ? 'block' : 'none';
                    const phoneInput = document.getElementById('phoneNumber');
                    if (phoneInput) {
                        phoneInput.required = (userType === 'alumni' || userType === 'external');
                    }
                }
            });
        }

        // Initialize functionality
        document.addEventListener('DOMContentLoaded', function() {
            // User type toggle
            setupUserTypeToggle();

            // Password toggle
            const passwordToggle = document.getElementById('passwordToggle');
            if (passwordToggle) {
                passwordToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    togglePasswordVisibility('password');
                });
            }

            const confirmPasswordToggle = document.getElementById('confirmPasswordToggle');
            if (confirmPasswordToggle) {
                confirmPasswordToggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    togglePasswordVisibility('password-confirm');
                });
            }

            // Password validation
            const passwordInput = document.getElementById('password');
            if (passwordInput) {
                passwordInput.addEventListener('input', validatePassword);
            }

            // Confirm password validation
            const confirmPasswordInput = document.getElementById('password-confirm');
            if (confirmPasswordInput) {
                confirmPasswordInput.addEventListener('input', validatePasswordMatch);
            }

            // Form validation
            const form = document.getElementById('kc-register-form');
            const submitButton = document.getElementById('register-button');

            if (form && submitButton) {
                function checkFormValidity() {
                    const isPasswordValid = validatePassword();
                    const isPasswordMatch = validatePasswordMatch();
                    const agreeTerms = document.getElementById('agreeTerms').checked;
                    const userType = document.getElementById('userType').value;

                    submitButton.disabled = !(isPasswordValid && isPasswordMatch && agreeTerms && userType);
                }

                // Check validity on input changes
                form.addEventListener('input', checkFormValidity);
                form.addEventListener('change', checkFormValidity);

                // Initial check
                checkFormValidity();
            }
        });
    </script>
    </#if>
</@layout.registrationLayout>


