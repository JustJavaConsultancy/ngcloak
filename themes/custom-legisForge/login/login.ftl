<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
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

          .btn-primary {
            background: linear-gradient(135deg, #9b2f2f 0%, #b93d3d 100%);
            transition: all 0.3s ease;
          }

          .btn-primary:hover {
            background: linear-gradient(135deg, #802929 0%, #9b2f2f 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(155, 47, 47, 0.3);
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

            <!-- Login Form -->
            <div class="p-8">
              <h2
                class="text-2xl font-bold text-primary font-serif mb-2 text-center"
              >
                Welcome Back
              </h2>
              <p class="text-legal-navy-600 text-center mb-8">
                Sign in to your account
              </p>

              <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="space-y-6">
                  <#if !usernameHidden??>
                    <!-- Email Field -->
                    <div class="form-group">
                      <input
                        tabindex="2"
                        id="username"
                        name="username"
                        value="${(login.username!'')}"
                        type="text"
                        class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                        placeholder=" "
                        autofocus
                        autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        dir="ltr"
                        required
                      />
                      <label for="username" class="form-label floating-label ${properties.kcLabelClass!}">
                        <i class="fas fa-envelope mr-2"></i>
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                      </label>

                      <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                          ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </span>
                      </#if>
                    </div>
                  </#if>

                  <!-- Password Field -->
                  <div class="form-group">
                    <input
                      tabindex="3"
                      id="password"
                      name="password"
                      type="password"
                      class="input-field form-input w-full px-4 rounded-lg focus:outline-none ${properties.kcInputClass!}"
                      placeholder=" "
                      autocomplete="current-password"
                      aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                      required
                    />
                    <label for="password" class="form-label floating-label ${properties.kcLabelClass!}">
                      <i class="fas fa-lock mr-2"></i>${msg("password")}
                    </label>
                    <button
                      type="button"
                      id="togglePassword"
                      class="absolute right-4 top-4 text-legal-navy-400 hover:text-legal-navy-600 ${properties.kcFormPasswordVisibilityButtonClass!}"
                      aria-label="${msg("showPassword")}"
                      aria-controls="password"
                      tabindex="4"
                      data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}"
                      data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                      data-label-show="${msg('showPassword')}"
                      data-label-hide="${msg('hidePassword')}"
                    >
                      <i class="fas fa-eye"></i>
                    </button>

                    <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                      <span id="input-error" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                      </span>
                    </#if>
                  </div>

                  <!-- Remember Me & Forgot Password -->
                  <div class="flex justify-between items-center ${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options">
                      <#if realm.rememberMe && !usernameHidden??>
                        <div class="flex items-center">
                          <input
                            tabindex="5"
                            id="rememberMe"
                            name="rememberMe"
                            type="checkbox"
                            class="w-4 h-4 text-legal-burgundy-600 border-legal-navy-300 rounded focus:ring-legal-burgundy-500"
                            <#if login.rememberMe??>checked</#if>
                          />
                          <label for="rememberMe" class="ml-2 text-sm text-legal-navy-600">
                            ${msg("rememberMe")}
                          </label>
                        </div>
                      </#if>
                    </div>
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                      <#if realm.resetPasswordAllowed>
                        <a
                          tabindex="6"
                          href="${url.loginResetCredentialsUrl}"
                          class="text-sm text-legal-burgundy-600 hover:text-legal-burgundy-800 transition-colors duration-200"
                        >
                          ${msg("doForgotPassword")}
                        </a>
                      </#if>
                    </div>
                  </div>

                  <!-- Submit Button -->
                  <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input
                      tabindex="7"
                      class="btn-primary w-full text-white py-3 rounded-lg font-medium text-lg transition-all duration-300 ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                      name="login"
                      id="kc-login"
                      type="submit"
                      value="${msg("doLogIn")}"
                    />
                  </div>
                </form>
              </#if>

              <!-- Sign Up Link -->
              <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center mt-4">
                  <p class="text-legal-navy-600">
                    ${msg("noAccount")}
                    <a
                      tabindex="8"
                      href="${url.registrationUrl}"
                      class="text-legal-burgundy-600 hover:text-legal-burgundy-800 font-medium transition-colors duration-200"
                    >
                      ${msg("doRegister")}
                    </a>
                  </p>
                </div>
              </#if>
            </div>
          </div>
        </div>

        <@passkeys.conditionalUIData />
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>

        <script>
          document.addEventListener("DOMContentLoaded", function () {
            const loginForm = document.getElementById("kc-form-login");
            const togglePassword = document.getElementById("togglePassword");
            const passwordInput = document.getElementById("password");

            // Toggle password visibility
            togglePassword.addEventListener("click", function () {
              const type =
                passwordInput.getAttribute("type") === "password"
                  ? "text"
                  : "password";
              passwordInput.setAttribute("type", type);
              this.innerHTML =
                type === "password"
                  ? '<i class="fas fa-eye"></i>'
                  : '<i class="fas fa-eye-slash"></i>';
            });

            // Form submission
            loginForm.addEventListener("submit", function (e) {
              // Get form values
              const username = document.getElementById("username").value;
              const password = document.getElementById("password").value;
              const remember = document.getElementById("rememberMe") ? document.getElementById("rememberMe").checked : false;

              // Simple validation
              if (!username || !password) {
                e.preventDefault();
                return;
              }

              const submitButton = document.getElementById("kc-login");
              if (submitButton) {
                submitButton.disabled = true;
                submitButton.value = "Signing you in...";
              }
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
          });
        </script>

    <#elseif section = "info">
        <!-- Registration link is now in the form section -->
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
