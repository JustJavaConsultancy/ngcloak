<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section == "header">
        <title>Create Account - NASD Communication System</title>
    <#elseif section == "form">
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
.login-pf-signup {
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
.register-container {
    min-height: 100vh;
    display: flex;
    position: relative;
    overflow: hidden;
}

/* Animated background */
.register-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background:
      radial-gradient(circle at 20% 80%, rgba(30, 64, 175, 0.1) 0%, transparent 50%),
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

.stats-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 2rem;
    margin-top: 3rem;
    animation: fadeInUp 1s ease-out 0.6s both;
}

.stat-item {
    text-align: center;
    padding: 1.5rem;
    background: rgba(255, 255, 255, 0.05);
    border-radius: 16px;
    border: 1px solid rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    transition: all 0.3s ease;
}

.stat-item:hover {
    background: rgba(255, 255, 255, 0.08);
    transform: translateY(-2px);
}

.stat-number {
    font-size: 2rem;
    font-weight: 800;
    color: #1e40af;
    display: block;
    margin-bottom: 0.5rem;
}

.stat-label {
    color: #e2e8f0;
    font-size: 0.875rem;
    font-weight: 500;
}

/* Right side - Register form */
.register-form-container {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 4rem;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.95) 0%, rgba(248, 250, 252, 0.95) 100%);
    backdrop-filter: blur(20px);
    position: relative;
    overflow-y: auto;
}

.register-form-container::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="dots" width="20" height="20" patternUnits="userSpaceOnUse"><circle cx="10" cy="10" r="1" fill="%23e2e8f0" opacity="0.4"/></pattern></defs><rect width="100" height="100" fill="url(%23dots)"/></svg>');
    opacity: 0.6;
}

.register-form-container > * {
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

.register-form {
    max-width: 480px;
    margin: 0 auto;
    width: 100%;
    animation: fadeInUp 1s ease-out 0.2s both;
}

.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
    margin-bottom: 1.5rem;
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
    border-color: #1e40af;
    box-shadow: 0 0 0 3px rgba(30, 64, 175, 0.1), 0 4px 12px rgba(0, 0, 0, 0.15);
    transform: translateY(-1px);
}

.form-input.error {
    border-color: #ef4444;
    box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
    animation: shake 0.5s ease-in-out;
}

.form-input.valid {
    border-color: #10b981;
    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    75% { transform: translateX(5px); }
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
    color: #1e40af;
    background: rgba(30, 64, 175, 0.1);
}

.password-toggle svg {
    width: 20px;
    height: 20px;
}

.validation-icon {
    position: absolute;
    right: 3.5rem;
    top: 50%;
    transform: translateY(-50%);
    width: 20px;
    height: 20px;
    opacity: 0;
    transition: all 0.3s ease;
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    font-size: 12px;
}

.form-input.valid ~ .validation-icon.success {
    opacity: 1;
    color: #ffffff;
    background: #10b981;
}

.form-input.error ~ .validation-icon.error {
    opacity: 1;
    color: #ffffff;
    background: #ef4444;
}

.submit-button {
    width: 100%;
    height: 3.5rem;
    background: linear-gradient(135deg, #1e40af 0%, #1d4ed8 100%);
    border: none;
    border-radius: 12px;
    color: #ffffff;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    margin: 2rem 0 1.5rem;
    position: relative;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);
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
    background: linear-gradient(135deg, #1d4ed8 0%, #1e3a8a 100%);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(30, 64, 175, 0.4);
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

.error-message {
    color: #ef4444;
    font-size: 0.875rem;
    margin-top: 0.5rem;
    padding: 0.75rem 1rem;
    background: rgba(239, 68, 68, 0.1);
    border: 1px solid rgba(239, 68, 68, 0.2);
    border-radius: 8px;
    display: none;
    animation: slideInDown 0.3s ease-out;
}

.error-message.show {
    display: block;
}

.success-message {
    color: #10b981;
    font-size: 0.875rem;
    margin-top: 0.5rem;
    padding: 0.75rem 1rem;
    background: rgba(16, 185, 129, 0.1);
    border: 1px solid rgba(16, 185, 129, 0.2);
    border-radius: 8px;
    display: none;
    animation: slideInDown 0.3s ease-out;
}

.success-message.show {
    display: block;
}

@keyframes slideInDown {
    from { opacity: 0; transform: translateY(-10px); }
    to { opacity: 1; transform: translateY(0); }
}

.form-footer {
    text-align: center;
    padding-top: 1.5rem;
    border-top: 1px solid #e2e8f0;
}

.login-link {
    color: #64748b;
    font-size: 0.875rem;
}

.login-link a {
    color: #1e40af;
    text-decoration: none;
    font-weight: 600;
    transition: all 0.2s ease;
    padding: 0.25rem 0.5rem;
    border-radius: 6px;
}

.login-link a:hover {
    color: #1d4ed8;
    background: rgba(30, 64, 175, 0.1);
    text-decoration: none;
}

.terms-notice {
    text-align: center;
    font-size: 0.75rem;
    color: #64748b;
    margin-top: 1rem;
    line-height: 1.5;
}

.terms-notice a {
    color: #1e40af;
    text-decoration: none;
    font-weight: 500;
}

.terms-notice a:hover {
    text-decoration: underline;
}

.progress-indicator {
    display: flex;
    justify-content: center;
    gap: 0.5rem;
    margin-bottom: 2rem;
}

.progress-step {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #e2e8f0;
    transition: all 0.3s ease;
}

.progress-step.active {
    background: #1e40af;
    transform: scale(1.2);
}

.progress-step.completed {
    background: #10b981;
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

    .register-form-container {
        flex: none;
        width: 100%;
    }
}

@media (max-width: 768px) {
    .register-form-container {
        padding: 2rem 1.5rem;
    }

    .form-title {
        font-size: 1.875rem;
    }

    .form-row {
        grid-template-columns: 1fr;
        gap: 1rem;
    }

    .stats-grid {
        grid-template-columns: 1fr;
        gap: 1rem;
    }
}
</style>

<div class="register-container">
    <!-- Brand Showcase Side -->
    <div class="brand-showcase">
        <div class="showcase-content">
            <div class="brand-logo-large">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
            </div>

            <h1 class="brand-title-large">NASD Communication System</h1>

            <p class="brand-subtitle">
                Join thousands of professionals using our secure communication platform designed for the financial industry.
            </p>

            <div class="stats-grid">
                <div class="stat-item">
                    <span class="stat-number">99.9%</span>
                    <span class="stat-label">Uptime</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">256-bit</span>
                    <span class="stat-label">Encryption</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">24/7</span>
                    <span class="stat-label">Support</span>
                </div>
                <div class="stat-item">
                    <span class="stat-number">SOC 2</span>
                    <span class="stat-label">Compliant</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Register Form Side -->
    <div class="register-form-container">
        <div class="form-header">
            <h2 class="form-title">Create Account</h2>
            <p class="form-subtitle">Join our secure communication platform</p>
        </div>

        <div class="progress-indicator">
            <div class="progress-step active"></div>
            <div class="progress-step"></div>
            <div class="progress-step"></div>
        </div>

        <form id="kc-register-form" action="${url.registrationAction}" method="post" class="register-form">
            <div class="form-row">
                <div class="form-group">
                    <label for="firstName" class="form-label">First Name</label>
                    <div class="input-wrapper">
                        <input type="text" id="firstName" name="firstName"
                               value="${(register.formData.firstName!'')}"
                               class="form-input"
                               placeholder="Enter first name"
                               required/>
                        <div class="validation-icon success">✓</div>
                        <div class="validation-icon error">✗</div>
                    </div>
                    <div class="error-message" id="firstName-error">First name is required</div>
                    <#if messagesPerField.existsError('firstName')>
                        <div class="error-message show">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</div>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="lastName" class="form-label">Last Name</label>
                    <div class="input-wrapper">
                        <input type="text" id="lastName" name="lastName"
                               value="${(register.formData.lastName!'')}"
                               class="form-input"
                               placeholder="Enter last name"
                               required/>
                        <div class="validation-icon success">✓</div>
                        <div class="validation-icon error">✗</div>
                    </div>
                    <div class="error-message" id="lastName-error">Last name is required</div>
                    <#if messagesPerField.existsError('lastName')>
                        <div class="error-message show">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</div>
                    </#if>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">Email Address</label>
                <div class="input-wrapper">
                    <input type="email" id="email" name="email"
                           value="${(register.formData.email!'')}"
                           class="form-input"
                           placeholder="Enter your email address"
                           required/>
                    <div class="validation-icon success">✓</div>
                    <div class="validation-icon error">✗</div>
                </div>
                <div class="error-message" id="email-error">Please enter a valid email address</div>
                <div class="success-message" id="email-success">Valid email address</div>
                <#if messagesPerField.existsError('email')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('email'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="password"
                           class="form-input"
                           placeholder="Create a strong password"
                           required/>
                    <div class="validation-icon success">✓</div>
                    <div class="validation-icon error">✗</div>
                    <button type="button" class="password-toggle" id="password-toggle">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
                <div class="error-message" id="password-error">Password must be at least 8 characters with uppercase, lowercase, and special character</div>
                <div class="success-message" id="password-success">Password meets requirements</div>
                <#if messagesPerField.existsError('password')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('password'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label for="password-confirm" class="form-label">Confirm Password</label>
                <div class="input-wrapper">
                    <input type="password" id="password-confirm" name="password-confirm"
                           class="form-input"
                           placeholder="Confirm your password"
                           required/>
                    <div class="validation-icon success">✓</div>
                    <div class="validation-icon error">✗</div>
                    <button type="button" class="password-toggle" id="password-confirm-toggle">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
                <div class="error-message" id="password-confirm-error">Passwords do not match</div>
                <div class="success-message" id="password-confirm-success">Passwords match</div>
                <#if messagesPerField.existsError('password-confirm')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</div>
                </#if>
            </div>

            <button type="submit" id="submit-btn" class="submit-button" disabled>
                Create Account
            </button>

            <div class="terms-notice">
                By creating an account, you agree to our
                <a href="#" onclick="return false;">Terms of Service</a> and
                <a href="#" onclick="return false;">Privacy Policy</a>
            </div>
        </form>

        <div class="form-footer">
            <div class="login-link">
                Already have an account? <a href="${url.loginUrl}">Sign In</a>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Form validation state
    const validationState = {
        firstName: false,
        lastName: false,
        email: false,
        password: false,
        passwordConfirm: false
    };

    // Get form elements
    const form = document.getElementById('kc-register-form');
    const submitBtn = document.getElementById('submit-btn');
    const progressSteps = document.querySelectorAll('.progress-step');

    // Enhanced password toggle functionality
    function setupPasswordToggle(inputId, toggleId) {
        const input = document.getElementById(inputId);
        const toggle = document.getElementById(toggleId);

        if (input && toggle) {
            toggle.addEventListener('click', function() {
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';

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
    }

    setupPasswordToggle('password', 'password-toggle');
    setupPasswordToggle('password-confirm', 'password-confirm-toggle');

    // Enhanced validation functions
    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function validatePassword(password) {
        const hasMinLength = password.length >= 8;
        const hasUppercase = /[A-Z]/.test(password);
        const hasLowercase = /[a-z]/.test(password);
        const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        return hasMinLength && hasUppercase && hasLowercase && hasSpecialChar;
    }

    function updateValidationUI(inputElement, isValid, errorElement, successElement) {
        if (isValid) {
            inputElement.classList.remove('error');
            inputElement.classList.add('valid');
            if (errorElement) errorElement.classList.remove('show');
            if (successElement) successElement.classList.add('show');
        } else {
            inputElement.classList.add('error');
            inputElement.classList.remove('valid');
            if (errorElement) errorElement.classList.add('show');
            if (successElement) successElement.classList.remove('show');
        }
    }

    function updateProgressIndicator() {
        const validCount = Object.values(validationState).filter(state => state).length;
        const totalFields = Object.keys(validationState).length;

        progressSteps.forEach((step, index) => {
            step.classList.remove('active', 'completed');
            if (index < Math.floor((validCount / totalFields) * 3)) {
                step.classList.add('completed');
            } else if (index === Math.floor((validCount / totalFields) * 3)) {
                step.classList.add('active');
            }
        });
    }

    function updateSubmitButton() {
        const allValid = Object.values(validationState).every(state => state);
        submitBtn.disabled = !allValid;
        updateProgressIndicator();
    }

    // Enhanced input validation with real-time feedback
    function setupInputValidation(input, validationKey, validationFn, errorId, successId) {
        if (!input) return;

        input.addEventListener('input', function() {
            const value = this.value.trim();
            const isValid = validationFn ? validationFn(value) : value.length > 0;
            validationState[validationKey] = isValid;

            const errorElement = document.getElementById(errorId);
            const successElement = successId ? document.getElementById(successId) : null;

            if (value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                if (errorElement) errorElement.classList.remove('show');
                if (successElement) successElement.classList.remove('show');
                validationState[validationKey] = false;
            }
            updateSubmitButton();
        });

        // Enhanced focus effects
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-1px)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    }

    // Setup validation for all inputs
    setupInputValidation(document.getElementById('firstName'), 'firstName', null, 'firstName-error');
    setupInputValidation(document.getElementById('lastName'), 'lastName', null, 'lastName-error');
    setupInputValidation(document.getElementById('email'), 'email', validateEmail, 'email-error', 'email-success');
    setupInputValidation(document.getElementById('password'), 'password', validatePassword, 'password-error', 'password-success');

    // Special handling for password confirmation
    const passwordConfirmInput = document.getElementById('password-confirm');
    const passwordInput = document.getElementById('password');

    if (passwordConfirmInput) {
        passwordConfirmInput.addEventListener('input', function() {
            const isValid = this.value === passwordInput.value && this.value.length > 0;
            validationState.passwordConfirm = isValid;

            const errorElement = document.getElementById('password-confirm-error');
            const successElement = document.getElementById('password-confirm-success');

            if (this.value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                errorElement.classList.remove('show');
                successElement.classList.remove('show');
                validationState.passwordConfirm = false;
            }
            updateSubmitButton();
        });

        // Re-validate password confirmation when password changes
        if (passwordInput) {
            passwordInput.addEventListener('input', function() {
                if (passwordConfirmInput.value.length > 0) {
                    passwordConfirmInput.dispatchEvent(new Event('input'));
                }
            });
        }
    }

    // Enhanced form submission
    if (form && submitBtn) {
        form.addEventListener('submit', function(e) {
            const allValid = Object.values(validationState).every(state => state);
            if (!allValid) {
                e.preventDefault();
                return false;
            }

            submitBtn.classList.add('loading');
            submitBtn.disabled = true;
        });
    }

    // Initial validation state
    updateSubmitButton();

    // Prevent terms links from navigating
    document.querySelectorAll('.terms-notice a').forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
        });
    });
});
</script>
    </#if>
</@layout.registrationLayout>
