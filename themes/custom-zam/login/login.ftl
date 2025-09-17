<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>
          @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap');

          * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }

          /* Hide default Keycloak elements */
          .login-pf-page-header,
          .login-pf-header,
          h1#kc-page-title,
          .login-pf-signup,
          #kc-info-wrapper,
          #kc-header,
          .login-pf-header {
            display: none !important;
          }

          .login-pf-page {
            padding-top: 0;
            border: none;
          }

          .login-pf-page .card-pf {
            padding: 0;
            margin-bottom: 0;
            border: none;
            max-width: none;
          }

          #kc-content-wrapper {
            margin-top: 0;
          }

          html, body {
            overflow-x: hidden;
            height: 100%;
          }

          body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%);
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            color: #1e293b;
            line-height: 1.6;
          }

          /* Main container */
          .auth-container {
            min-height: 100vh;
            display: flex;
            position: relative;
            overflow: hidden;
          }

          /* Animated background */
          .auth-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
              radial-gradient(circle at 20% 80%, rgba(236, 35, 42, 0.1) 0%, transparent 50%),
              radial-gradient(circle at 80% 20%, rgba(59, 130, 246, 0.1) 0%, transparent 50%),
              radial-gradient(circle at 40% 40%, rgba(16, 185, 129, 0.05) 0%, transparent 50%);
            animation: backgroundShift 20s ease-in-out infinite;
          }

          @keyframes backgroundShift {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
          }

          /* Left side - Brand showcase */
          .brand-showcase {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 4rem;
            position: relative;
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.9) 0%, rgba(30, 41, 59, 0.8) 100%);
            backdrop-filter: blur(20px);
          }

          .brand-showcase::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="%23334155" stroke-width="0.5" opacity="0.3"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            opacity: 0.3;
          }

          .brand-showcase > * {
            position: relative;
            z-index: 2;
          }

          .showcase-content {
            text-align: center;
            max-width: 500px;
          }

          .brand-logo-large {
            margin-bottom: 3rem;
            animation: fadeInUp 1s ease-out;
          }

          .brand-logo-large img {
            width: 120px;
            height: auto;
            filter: brightness(1.1) contrast(1.1);
            transition: transform 0.3s ease;
          }

          .brand-logo-large:hover img {
            transform: scale(1.05);
          }

          .brand-title-large {
            font-size: 2.5rem;
            font-weight: 800;
            color: #f8fafc !important;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
            -webkit-background-clip: text !important;
            -webkit-text-fill-color: transparent !important;
            background-clip: text !important;
            animation: fadeInUp 1s ease-out 0.2s both;
            /* Dark Reader override */
            --darkreader-inline-color: #f8fafc !important;
            --darkreader-inline-bgcolor: transparent !important;
          }

          /* Additional Dark Reader specific overrides */
          [data-darkreader-scheme="dark"] .brand-title-large {
            color: #f8fafc !important;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
            -webkit-text-fill-color: transparent !important;
          }

          /* Force override for Dark Reader */
          .brand-title-large[style*="darkreader"] {
            color: #f8fafc !important;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
            -webkit-text-fill-color: transparent !important;
          }

          .brand-subtitle {
            font-size: 1.25rem;
            color: #cbd5e1;
            margin-bottom: 3rem;
            font-weight: 400;
            line-height: 1.7;
            animation: fadeInUp 1s ease-out 0.4s both;
          }

          .feature-highlights {
            display: grid;
            gap: 1.5rem;
            margin-top: 3rem;
            animation: fadeInUp 1s ease-out 0.6s both;
          }

          .feature-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
          }

          .feature-item:hover {
            background: rgba(255, 255, 255, 0.08);
            transform: translateY(-2px);
          }

          .feature-icon {
            width: 24px;
            height: 24px;
            color: #EC232A;
            flex-shrink: 0;
          }

          .feature-text {
            color: #e2e8f0;
            font-weight: 500;
          }

          /* Right side - Login form */
          .auth-form-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 4rem;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
            backdrop-filter: blur(20px);
            position: relative;
          }

          .auth-form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23e2e8f0" opacity="0.4"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
            opacity: 0.6;
          }

          .auth-form-container > * {
            position: relative;
            z-index: 2;
          }

          .form-header {
            text-align: center;
            margin-bottom: 3rem;
            animation: fadeInDown 1s ease-out;
          }

          .form-title {
            font-size: 2.25rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 0.5rem;
            letter-spacing: -0.025em;
          }

          .form-subtitle {
            font-size: 1.1rem;
            color: #64748b;
            font-weight: 400;
          }

          .auth-form {
            max-width: 400px;
            margin: 0 auto;
            width: 100%;
            animation: fadeInUp 1s ease-out 0.2s both;
          }

          .form-group {
            margin-bottom: 1.5rem;
          }

          .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }

          .input-wrapper {
            position: relative;
          }

          .form-input {
            width: 100%;
            height: 3.5rem;
            padding: 0 1rem;
            background: #ffffff;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 500;
            color: #1e293b;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
          }

          .form-input:focus {
            outline: none;
            border-color: #EC232A;
            box-shadow: 0 0 0 3px rgba(236, 35, 42, 0.1), 0 4px 12px rgba(0, 0, 0, 0.15);
            transform: translateY(-1px);
          }

          .form-input.error {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
          }

          .form-input::placeholder {
            color: #9ca3af;
            font-weight: 400;
          }

          .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6b7280;
            cursor: pointer;
            padding: 0.25rem;
            border-radius: 6px;
            transition: all 0.2s ease;
          }

          .password-toggle:hover {
            color: #EC232A;
            background: rgba(236, 35, 42, 0.1);
          }

          .password-toggle svg {
            width: 20px;
            height: 20px;
          }

          .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
          }

          .remember-me {
            display: flex;
            align-items: center;
            gap: 0.5rem;
          }

          .remember-me input[type="checkbox"] {
            width: 1rem;
            height: 1rem;
            accent-color: #EC232A;
            cursor: pointer;
          }

          .remember-me label {
            font-size: 0.875rem;
            color: #64748b;
            cursor: pointer;
            margin: 0;
          }

          .forgot-password {
            color: #EC232A;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 600;
            transition: all 0.2s ease;
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
          }

          .forgot-password:hover {
            color: #dc2626;
            background: rgba(236, 35, 42, 0.1);
            text-decoration: none;
          }

          .submit-button {
            width: 100%;
            height: 3.5rem;
            background: linear-gradient(135deg, #EC232A 0%, #dc2626 100%);
            border: none;
            border-radius: 12px;
            color: #ffffff;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            margin-bottom: 1.5rem;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(236, 35, 42, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }

          .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s ease;
          }

          .submit-button:hover:not(:disabled) {
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(236, 35, 42, 0.4);
          }

          .submit-button:hover:not(:disabled)::before {
            left: 100%;
          }

          .submit-button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
            background: #9ca3af;
            box-shadow: 0 2px 8px rgba(156, 163, 175, 0.3);
          }

          .submit-button.loading {
            color: transparent;
          }

          .submit-button.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-top: 2px solid #ffffff;
            border-radius: 50%;
            animation: spin 1s linear infinite;
          }

          @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
          }

          .form-footer {
            text-align: center;
            padding-top: 1.5rem;
            border-top: 1px solid #e2e8f0;
          }

          .signup-link {
            color: #64748b;
            font-size: 0.875rem;
          }

          .signup-link a {
            color: #EC232A;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.2s ease;
            padding: 0.25rem 0.5rem;
            border-radius: 6px;
          }

          .signup-link a:hover {
            color: #dc2626;
            background: rgba(236, 35, 42, 0.1);
            text-decoration: none;
          }

          .error-message {
            color: #ef4444;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            padding: 0.75rem 1rem;
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.2);
            border-radius: 8px;
            animation: slideInDown 0.3s ease-out;
          }

          @keyframes slideInDown {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
          }

          .terms-notice {
            text-align: center;
            font-size: 0.75rem;
            color: #64748b;
            margin-top: 1rem;
            line-height: 1.5;
          }

          .terms-notice a {
            color: #EC232A;
            text-decoration: none;
            font-weight: 500;
          }

          .terms-notice a:hover {
            text-decoration: underline;
          }

          /* Animations */
          @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
          }

          @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
          }

          /* Responsive design */
          @media (max-width: 1024px) {
            .brand-showcase {
              display: none;
            }

            .auth-form-container {
              flex: none;
              width: 100%;
            }
          }

          @media (max-width: 768px) {
            .auth-form-container {
              padding: 2rem 1.5rem;
            }

            .brand-title-large {
              font-size: 2rem;
            }

            .form-title {
              font-size: 1.875rem;
            }

            .form-options {
              flex-direction: column;
              align-items: stretch;
              gap: 1rem;
            }

            .remember-me {
              justify-content: center;
            }
          }

          /* Bootstrap integration */
          .kc-login #kc-form {
            width: 100% !important;
          }

          .kc-login #kc-form-wrapper {
            width: 100% !important;
          }
        </style>

        <div class="auth-container">
          <!-- Brand Showcase Side -->
          <div class="brand-showcase">
            <div class="showcase-content">
              <div class="brand-logo-large">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
              </div>

              <h1 class="brand-title-large">NASD Communication System</h1>

              <p class="brand-subtitle">
                Secure, professional communication platform designed for modern financial institutions and corporate environments.
              </p>

              <div class="feature-highlights">
                <div class="feature-item">
                  <svg class="feature-icon" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                  </svg>
                  <span class="feature-text">Enterprise-grade security</span>
                </div>

                <div class="feature-item">
                  <svg class="feature-icon" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" />
                  </svg>
                  <span class="feature-text">Customizable interface</span>
                </div>

                <div class="feature-item">
                  <svg class="feature-icon" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M6 6V5a3 3 0 013-3h2a3 3 0 013 3v1h2a2 2 0 012 2v3.57A22.952 22.952 0 0110 13a22.95 22.95 0 01-8-1.43V8a2 2 0 012-2h2zm2-1a1 1 0 011-1h2a1 1 0 011 1v1H8V5zm1 5a1 1 0 011-1h.01a1 1 0 110 2H10a1 1 0 01-1-1z" clip-rule="evenodd" />
                  </svg>
                  <span class="feature-text">Professional compliance</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Login Form Side -->
          <div class="auth-form-container">
            <div class="form-header">
              <h2 class="form-title">Welcome Back</h2>
              <p class="form-subtitle">Sign in to access your account</p>
            </div>

            <div id="kc-form">
              <div id="kc-form-wrapper">
                <#if realm.password>
                  <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="auth-form">

                    <#if !usernameHidden??>
                      <div class="form-group">
                        <label for="username" class="form-label">
                          <#if !realm.loginWithEmailAllowed>
                            Username
                          <#elseif !realm.registrationEmailAsUsername>
                            Username or Email
                          <#else>
                            Email Address
                          </#if>
                        </label>
                        <div class="input-wrapper">
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
                            placeholder="Enter your email address"
                            required
                          />
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                          </div>
                        </#if>
                      </div>
                    </#if>

                    <div class="form-group">
                      <label for="password" class="form-label">Password</label>
                      <div class="input-wrapper">
                        <input
                          tabindex="3"
                          id="password"
                          class="form-input <#if messagesPerField.existsError('username','password')>error</#if>"
                          name="password"
                          type="password"
                          autocomplete="current-password"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          placeholder="Enter your password"
                          required
                        />
                        <button type="button" class="password-toggle" id="password-toggle">
                          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
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
                        <div class="remember-me">
                          <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                          <label for="rememberMe">${msg("rememberMe")}</label>
                        </div>
                      <#else>
                        <div></div>
                      </#if>

                      <#if realm.resetPasswordAllowed>
                        <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="forgot-password">
                          Forgot Password?
                        </a>
                      </#if>
                    </div>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                    <button
                      tabindex="7"
                      class="submit-button"
                      name="login"
                      id="kc-login"
                      type="submit"
                    >
                      Sign In
                    </button>

                    <div class="terms-notice">
                      By signing in, you agree to our
                      <a href="#" onclick="return false;">Terms of Service</a> and
                      <a href="#" onclick="return false;">Privacy Policy</a>
                    </div>
                  </form>
                </#if>

                <#if realm.registrationAllowed && !registrationDisabled??>
                  <div class="form-footer">
                    <div class="signup-link">
                      Don't have an account? <a tabindex="8" href="${url.registrationUrl}">Create Account</a>
                    </div>
                  </div>
                </#if>
              </div>
            </div>
          </div>
        </div>

        <script>
          document.addEventListener('DOMContentLoaded', function() {
            // Enhanced password toggle
            const passwordToggle = document.getElementById('password-toggle');
            const passwordInput = document.getElementById('password');

            if (passwordToggle && passwordInput) {
              passwordToggle.addEventListener('click', function() {
                const isPassword = passwordInput.type === 'password';
                passwordInput.type = isPassword ? 'text' : 'password';

                this.innerHTML = isPassword ?
                  `<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                     <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
                     <line x1="1" y1="1" x2="23" y2="23"/>
                   </svg>` :
                  `<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                     <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                     <circle cx="12" cy="12" r="3"/>
                   </svg>`;
              });
            }

            // Enhanced form submission
            const form = document.getElementById('kc-form-login');
            const submitBtn = document.getElementById('kc-login');

            if (form && submitBtn) {
              form.addEventListener('submit', function() {
                submitBtn.classList.add('loading');
                submitBtn.disabled = true;
              });
            }

            // Enhanced input interactions
            const inputs = document.querySelectorAll('.form-input');
            inputs.forEach(input => {
              input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-1px)';
              });

              input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
              });
            });

            // Prevent terms links from navigating
            document.querySelectorAll('.terms-notice a').forEach(link => {
              link.addEventListener('click', function(e) {
                e.preventDefault();
              });
            });
          });
        </script>

        <@passkeys.conditionalUIData />
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}"
                                    class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
