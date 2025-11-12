<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <script src="https://cdn.tailwindcss.com"></script>
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        />
        <link
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"
        />
        <script>
          tailwind.config = {
            theme: {
              extend: {
                colors: {
                  // Professional legal color palette
                  "legal-navy": {
                    50: "#f5f7fa",
                    100: "#eaeff4",
                    200: "#d0dde8",
                    300: "#a6c0d5",
                    400: "#769ebb",
                    500: "#567fa1",
                    600: "#436587",
                    700: "#37516d",
                    800: "#30455c",
                    900: "#2c3b4e",
                  },
                  "legal-burgundy": {
                    50: "#fdf5f5",
                    100: "#faeaea",
                    200: "#f5d5d5",
                    300: "#ecb3b3",
                    400: "#df8383",
                    500: "#cd5555",
                    600: "#b93d3d",
                    700: "#9b2f2f",
                    800: "#802929",
                    900: "#6a2626",
                  },
                  "legal-gold": {
                    50: "#fefce8",
                    100: "#fef9c3",
                    200: "#fef08a",
                    300: "#fde047",
                    400: "#facc15",
                    500: "#eab308",
                    600: "#ca8a04",
                    700: "#a16207",
                    800: "#854d0e",
                    900: "#713f12",
                  },
                  "legal-ivory": {
                    50: "#fefefe",
                    100: "#fdfdfd",
                    200: "#fbfbfb",
                    300: "#f8f8f8",
                    400: "#f3f3f3",
                    500: "#e8e8e8",
                    600: "#d4d4d4",
                    700: "#b5b5b5",
                    800: "#949494",
                    900: "#787878",
                  },
                  primary: "#2c3b4e", // legal-navy-900
                  secondary: "#9b2f2f", // legal-burgundy-700
                  accent: "#ca8a04", // legal-gold-600
                  light: "#f5f7fa", // legal-navy-50
                  dark: "#1a202c",
                },
                fontFamily: {
                  serif: ["Georgia", "Times New Roman", "serif"],
                  sans: ["Inter", "system-ui", "sans-serif"],
                },
                animation: {
                  "fade-in": "fadeIn 0.5s ease-in-out",
                  "slide-in": "slideIn 0.3s ease-out",
                  "pulse-gentle": "pulseGentle 2s infinite",
                  "float-up": "floatUp 0.3s ease-out",
                },
                keyframes: {
                  fadeIn: {
                    "0%": { opacity: "0" },
                    "100%": { opacity: "1" },
                  },
                  slideIn: {
                    "0%": { transform: "translateY(-10px)", opacity: "0" },
                    "100%": { transform: "translateY(0)", opacity: "1" },
                  },
                  pulseGentle: {
                    "0%, 100%": { opacity: "1" },
                    "50%": { opacity: "0.8" },
                  },
                  floatUp: {
                    "0%": { transform: "translateY(0) scale(1)", opacity: "1" },
                    "100%": {
                      transform: "translateY(-24px) scale(0.85)",
                      opacity: "1",
                    },
                  },
                },
              },
            },
          };
        </script>
        <style>
          @import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap");

          body {
            font-family: "Inter", sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #eaeff4 100%);
          }

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

         .pf-c-form-control:not(textarea) {
            height: auto;
         }

          .login-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
          }

          .login-card {
            background: white;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            width: 100%;
            max-width: 420px;
          }

          .gradient-bg {
            background: linear-gradient(135deg, #2c3b4e 0%, #37516d 100%);
          }

          /* Document Logo Styling */
          .logo-container {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
          }

          .logo-document {
            position: relative;
            width: 80px;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #eab308 0%, #facc15 100%);
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(234, 179, 8, 0.3);
            transform: rotate(-5deg);
            animation: pulseGentle 3s infinite;
          }

          .logo-document::before {
            content: "";
            position: absolute;
            width: 60px;
            height: 70px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
          }

          .logo-document::after {
            content: "";
            position: absolute;
            width: 50px;
            height: 6px;
            background: #2c3b4e;
            border-radius: 3px;
            top: 25px;
          }

          .logo-lines {
            position: absolute;
            width: 40px;
            height: 4px;
            background: #2c3b4e;
            border-radius: 2px;
            opacity: 0.7;
          }

          .logo-line-1 {
            top: 40px;
            width: 35px;
          }

          .logo-line-2 {
            top: 50px;
            width: 30px;
          }

          .logo-line-3 {
            top: 60px;
            width: 25px;
          }

          .input-field {
            transition: all 0.3s ease;
            border: 1px solid #d0dde8;
          }

          .input-field:focus {
            border-color: #9b2f2f;
            box-shadow: 0 0 0 3px rgba(155, 47, 47, 0.1);
          }

          .input-field.error {
            border-color: #dc2626;
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
          }

          .input-field.valid {
            border-color: #16a34a;
            box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.1);
          }

          .btn-primary {
            background: linear-gradient(135deg, #9b2f2f 0%, #b93d3d 100%);
            transition: all 0.3s ease;
          }

          .btn-primary:hover:not(:disabled) {
            background: linear-gradient(135deg, #802929 0%, #9b2f2f 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(155, 47, 47, 0.3);
          }

          .btn-primary:disabled {
            background: linear-gradient(135deg, #d1d5db 0%, #9ca3af 100%);
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
            opacity: 0.6;
          }

          .legal-border {
            border-left: 4px solid #9b2f2f;
          }

          .floating-label {
            transition: all 0.3s ease;
            pointer-events: none;
          }

          .input-field:focus + .floating-label,
          .input-field:not(:placeholder-shown) + .floating-label {
            transform: translateY(-24px) scale(0.85);
            color: #9b2f2f;
          }

          .material-icons.text-3xl {
            font-size: 3rem;
          }

          .text-legal-white-600 {
            color: rgba(255, 255, 255, 0.9);
          }

          /* Improved form styling */
          .form-group {
            position: relative;
            margin-bottom: 1.5rem;
          }

          .form-input {
            padding-top: 1.5rem;
            padding-bottom: 0.75rem;
          }

          .form-label {
            position: absolute;
            left: 1rem;
            top: 1rem;
            transition: all 0.3s ease;
            color: #6b7280;
          }

          .form-input:focus + .form-label,
          .form-input:not(:placeholder-shown) + .form-label {
            transform: translateY(-0.75rem) scale(0.85);
            color: #9b2f2f;
            left: 0.75rem;
          }

          /* Validation error styling */
          .validation-error {
            color: #dc2626;
            font-size: 0.75rem;
            margin-top: 0.25rem;
            display: block;
            opacity: 0;
            transform: translateY(-5px);
            transition: all 0.3s ease;
          }

          .validation-error.show {
            opacity: 1;
            transform: translateY(0);
          }

          .validation-success {
            color: #16a34a;
            font-size: 0.75rem;
            margin-top: 0.25rem;
            display: block;
            opacity: 0;
            transform: translateY(-5px);
            transition: all 0.3s ease;
          }

          .validation-success.show {
            opacity: 1;
            transform: translateY(0);
          }

          /* Name fields row */
          .name-row {
            display: flex;
            gap: 1rem;
          }

          .name-row .form-group {
            flex: 1;
          }
        </style>

        <div class="login-container p-4">
          <div class="login-card animate-fade-in">
            <!-- Header Section -->
            <div class="gradient-bg text-white p-8 text-center">
              <div class="flex justify-center mb-4">
                <div class="logo-container">
                  <div class="logo-document">
                    <div class="logo-lines logo-line-1"></div>
                    <div class="logo-lines logo-line-2"></div>
                    <div class="logo-lines logo-line-3"></div>
                  </div>
                </div>
              </div>
              <h1 class="text-3xl font-bold font-serif mb-2">LegisForge</h1>
              <p class="text-legal-navy-300">AI-Powered M&A Legal Platform</p>
            </div>

            <!-- Registration Form -->
            <div class="p-8">
              <h2
                class="text-2xl font-bold text-primary font-serif mb-2 text-center"
              >
                Create Account
              </h2>
              <p class="text-legal-navy-600 text-center mb-8">
                Join our legal platform
              </p>

              <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-6">
                <!-- Name Fields Row -->
                <div class="name-row">
                  <!-- First Name Field -->
                  <div class="form-group">
                    <input
                      tabindex="1"
                      id="firstName"
                      name="firstName"
                      value="${(register.formData.firstName!'')}"
                      type="text"
                      class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                      placeholder=" "
                      autofocus
                      aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                      required
                    />
                    <label for="firstName" class="form-label floating-label ${properties.kcLabelClass!}">
                      <i class="fas fa-user mr-2"></i>${msg("firstName")}
                    </label>

                    <#if messagesPerField.existsError('firstName')>
                      <span class="validation-error show">
                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                      </span>
                    </#if>
                  </div>

                  <!-- Last Name Field -->
                  <div class="form-group">
                    <input
                      tabindex="2"
                      id="lastName"
                      name="lastName"
                      value="${(register.formData.lastName!'')}"
                      type="text"
                      class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                      placeholder=" "
                      aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                      required
                    />
                    <label for="lastName" class="form-label floating-label ${properties.kcLabelClass!}">
                      <i class="fas fa-user mr-2"></i>${msg("lastName")}
                    </label>

                    <#if messagesPerField.existsError('lastName')>
                      <span class="validation-error show">
                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                      </span>
                    </#if>
                  </div>
                </div>

                <!-- Email Field -->
                <div class="form-group">
                  <input
                    tabindex="3"
                    id="email"
                    name="email"
                    value="${(register.formData.email!'')}"
                    type="email"
                    class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                    placeholder=" "
                    autocomplete="email"
                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    required
                  />
                  <label for="email" class="form-label floating-label ${properties.kcLabelClass!}">
                    <i class="fas fa-envelope mr-2"></i>${msg("email")}
                  </label>

                  <span id="email-error" class="validation-error">
                    Please enter a valid email address
                  </span>
                  <span id="email-success" class="validation-success">
                    <i class="fas fa-check mr-1"></i>Valid email address
                  </span>

                  <#if messagesPerField.existsError('email')>
                    <span class="validation-error show">
                      ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </span>
                  </#if>
                </div>

                <#if !realm.registrationEmailAsUsername>
                  <!-- Username Field -->
                  <div class="form-group">
                    <input
                      tabindex="4"
                      id="username"
                      name="username"
                      value="${(register.formData.username!'')}"
                      type="text"
                      class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                      placeholder=" "
                      autocomplete="username"
                      aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                      required
                    />
                    <label for="username" class="form-label floating-label ${properties.kcLabelClass!}">
                      <i class="fas fa-at mr-2"></i>${msg("username")}
                    </label>

                    <#if messagesPerField.existsError('username')>
                      <span class="validation-error show">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                      </span>
                    </#if>
                  </div>
                </#if>

                <!-- Password Field -->
                <div class="form-group">
                  <input
                    tabindex="5"
                    id="password"
                    name="password"
                    type="password"
                    class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                    placeholder=" "
                    autocomplete="new-password"
                    aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                    required
                  />
                  <label for="password" class="form-label floating-label ${properties.kcLabelClass!}">
                    <i class="fas fa-lock mr-2"></i>${msg("password")}
                  </label>
                  <button
                    type="button"
                    id="togglePassword"
                    class="absolute right-4 top-4 text-legal-navy-400 hover:text-legal-navy-600"
                    aria-label="Show password"
                    aria-controls="password"
                    tabindex="-1"
                  >
                    <i class="fas fa-eye"></i>
                  </button>

                  <span id="password-error" class="validation-error">
                    Password must be at least 8 characters with uppercase, lowercase, number and special character
                  </span>
                  <span id="password-success" class="validation-success">
                    <i class="fas fa-check mr-1"></i>Strong password
                  </span>

                  <#if messagesPerField.existsError('password')>
                    <span class="validation-error show">
                      ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </span>
                  </#if>
                </div>

                <!-- Confirm Password Field -->
                <div class="form-group">
                  <input
                    tabindex="6"
                    id="password-confirm"
                    name="password-confirm"
                    type="password"
                    class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                    placeholder=" "
                    autocomplete="new-password"
                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                    required
                  />
                  <label for="password-confirm" class="form-label floating-label ${properties.kcLabelClass!}">
                    <i class="fas fa-lock mr-2"></i>${msg("passwordConfirm")}
                  </label>
                  <button
                    type="button"
                    id="togglePasswordConfirm"
                    class="absolute right-4 top-4 text-legal-navy-400 hover:text-legal-navy-600"
                    aria-label="Show password"
                    aria-controls="password-confirm"
                    tabindex="-1"
                  >
                    <i class="fas fa-eye"></i>
                  </button>

                  <span id="password-confirm-error" class="validation-error">
                    Passwords do not match
                  </span>
                  <span id="password-confirm-success" class="validation-success">
                    <i class="fas fa-check mr-1"></i>Passwords match
                  </span>

                  <#if messagesPerField.existsError('password-confirm')>
                    <span class="validation-error show">
                      ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </span>
                  </#if>
                </div>

                <!-- Submit Button -->
                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                  <input
                    tabindex="7"
                    class="btn-primary w-full text-white py-3 rounded-lg font-medium text-lg transition-all duration-300 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                    name="register"
                    id="kc-register"
                    type="submit"
                    value="${msg("doRegister")}"
                    disabled
                  />
                </div>
              </form>

              <!-- Sign In Link -->
              <div class="text-center mt-4">
                <p class="text-legal-navy-600">
                  ${msg("alreadyHaveAccount")}
                  <a
                    tabindex="8"
                    href="${url.loginUrl}"
                    class="text-legal-burgundy-600 hover:text-legal-burgundy-800 font-medium transition-colors duration-200"
                  >
                    ${msg("doLogIn")}
                  </a>
                </p>
              </div>
            </div>
          </div>
        </div>

        <script>
          document.addEventListener("DOMContentLoaded", function () {
            const form = document.getElementById("kc-register-form");
            const submitButton = document.getElementById("kc-register");

            // Form fields
            const firstNameInput = document.getElementById("firstName");
            const lastNameInput = document.getElementById("lastName");
            const emailInput = document.getElementById("email");
            const usernameInput = document.getElementById("username");
            const passwordInput = document.getElementById("password");
            const passwordConfirmInput = document.getElementById("password-confirm");

            // Error/success elements
            const emailError = document.getElementById("email-error");
            const emailSuccess = document.getElementById("email-success");
            const passwordError = document.getElementById("password-error");
            const passwordSuccess = document.getElementById("password-success");
            const passwordConfirmError = document.getElementById("password-confirm-error");
            const passwordConfirmSuccess = document.getElementById("password-confirm-success");

            // Password toggle buttons
            const togglePassword = document.getElementById("togglePassword");
            const togglePasswordConfirm = document.getElementById("togglePasswordConfirm");

            // Validation state
            const validationState = {
              firstName: false,
              lastName: false,
              email: false,
              username: true, // Default to true if username field doesn't exist
              password: false,
              passwordConfirm: false
            };

            // Email validation
            function validateEmail(email) {
              const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
              return emailRegex.test(email);
            }

            // Password validation
            function validatePassword(password) {
              const minLength = password.length >= 8;
              const hasUpper = /[A-Z]/.test(password);
              const hasLower = /[a-z]/.test(password);
              const hasNumber = /\d/.test(password);
              const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(password);

              return minLength && hasUpper && hasLower && hasNumber && hasSpecial;
            }

            // Update submit button state
            function updateSubmitButton() {
              const allValid = Object.values(validationState).every(valid => valid);
              submitButton.disabled = !allValid;
            }

            // Email validation
            emailInput.addEventListener("input", function() {
              const email = this.value.trim();

              if (email === "") {
                this.classList.remove("error", "valid");
                emailError.classList.remove("show");
                emailSuccess.classList.remove("show");
                validationState.email = false;
              } else if (validateEmail(email)) {
                this.classList.remove("error");
                this.classList.add("valid");
                emailError.classList.remove("show");
                emailSuccess.classList.add("show");
                validationState.email = true;
              } else {
                this.classList.remove("valid");
                this.classList.add("error");
                emailError.classList.add("show");
                emailSuccess.classList.remove("show");
                validationState.email = false;
              }

              updateSubmitButton();
            });

            // Password validation
            passwordInput.addEventListener("input", function() {
              const password = this.value;

              if (password === "") {
                this.classList.remove("error", "valid");
                passwordError.classList.remove("show");
                passwordSuccess.classList.remove("show");
                validationState.password = false;
              } else if (validatePassword(password)) {
                this.classList.remove("error");
                this.classList.add("valid");
                passwordError.classList.remove("show");
                passwordSuccess.classList.add("show");
                validationState.password = true;
              } else {
                this.classList.remove("valid");
                this.classList.add("error");
                passwordError.classList.add("show");
                passwordSuccess.classList.remove("show");
                validationState.password = false;
              }

              // Re-validate password confirmation
              if (passwordConfirmInput.value) {
                passwordConfirmInput.dispatchEvent(new Event('input'));
              }

              updateSubmitButton();
            });

            // Password confirmation validation
            passwordConfirmInput.addEventListener("input", function() {
              const password = passwordInput.value;
              const confirmPassword = this.value;

              if (confirmPassword === "") {
                this.classList.remove("error", "valid");
                passwordConfirmError.classList.remove("show");
                passwordConfirmSuccess.classList.remove("show");
                validationState.passwordConfirm = false;
              } else if (password === confirmPassword && validatePassword(password)) {
                this.classList.remove("error");
                this.classList.add("valid");
                passwordConfirmError.classList.remove("show");
                passwordConfirmSuccess.classList.add("show");
                validationState.passwordConfirm = true;
              } else {
                this.classList.remove("valid");
                this.classList.add("error");
                passwordConfirmError.classList.add("show");
                passwordConfirmSuccess.classList.remove("show");
                validationState.passwordConfirm = false;
              }

              updateSubmitButton();
            });

            // First name validation
            firstNameInput.addEventListener("input", function() {
              validationState.firstName = this.value.trim().length > 0;
              updateSubmitButton();
            });

            // Last name validation
            lastNameInput.addEventListener("input", function() {
              validationState.lastName = this.value.trim().length > 0;
              updateSubmitButton();
            });

            // Username validation (if field exists)
            if (usernameInput) {
              usernameInput.addEventListener("input", function() {
                validationState.username = this.value.trim().length > 0;
                updateSubmitButton();
              });
              validationState.username = false; // Reset if field exists
            }

            // Password toggle functionality
            togglePassword.addEventListener("click", function () {
              const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
              passwordInput.setAttribute("type", type);
              this.innerHTML = type === "password"
                ? '<i class="fas fa-eye"></i>'
                : '<i class="fas fa-eye-slash"></i>';
            });

            togglePasswordConfirm.addEventListener("click", function () {
              const type = passwordConfirmInput.getAttribute("type") === "password" ? "text" : "password";
              passwordConfirmInput.setAttribute("type", type);
              this.innerHTML = type === "password"
                ? '<i class="fas fa-eye"></i>'
                : '<i class="fas fa-eye-slash"></i>';
            });

            // Form submission
            form.addEventListener("submit", function (e) {
              const allValid = Object.values(validationState).every(valid => valid);

              if (!allValid) {
                e.preventDefault();
                return;
              }

              submitButton.disabled = true;
              submitButton.value = "Creating account...";
            });

            // Add floating label functionality
            const inputs = document.querySelectorAll(".form-input");
            inputs.forEach((input) => {
              // Check if input has value on page load (for browser autofill)
              if (input.value) {
                input.nextElementSibling.classList.add(
                  "transform",
                  "-translate-y-3",
                  "scale-85",
                  "text-legal-burgundy-600"
                );
              }

              input.addEventListener("focus", function () {
                this.nextElementSibling.classList.add(
                  "transform",
                  "-translate-y-3",
                  "scale-85",
                  "text-legal-burgundy-600"
                );
              });

              input.addEventListener("blur", function () {
                if (!this.value) {
                  this.nextElementSibling.classList.remove(
                    "transform",
                    "-translate-y-3",
                    "scale-85",
                    "text-legal-burgundy-600"
                  );
                }
              });
            });

            // Initial validation check for pre-filled values
            if (firstNameInput.value.trim()) {
              validationState.firstName = true;
            }
            if (lastNameInput.value.trim()) {
              validationState.lastName = true;
            }
            if (emailInput.value.trim()) {
              emailInput.dispatchEvent(new Event('input'));
            }
            if (usernameInput && usernameInput.value.trim()) {
              validationState.username = true;
            }
            if (passwordInput.value) {
              passwordInput.dispatchEvent(new Event('input'));
            }
            if (passwordConfirmInput.value) {
              passwordConfirmInput.dispatchEvent(new Event('input'));
            }

            updateSubmitButton();
          });
        </script>

    <#elseif section = "info">
        <!-- Sign in link is now in the form section -->
    <#elseif section = "socialProviders">
        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>

                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a data-once-link data-disabled-class="${properties.kcFormSocialAccountListButtonDisabledClass!}" id="social-${p.alias}"
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
