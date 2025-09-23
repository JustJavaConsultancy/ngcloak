<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>DevFlow - Sign Up</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <script>
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              primary: "#6366F1",
              "background-light": "#F8FAFC",
              "background-dark": "#0F172A",
              "card-light": "#FFFFFF",
              "card-dark": "#1E293B",
              "text-light": "#0F172A",
              "text-dark": "#F8FAFC",
              "text-secondary-light": "#64748B",
              "text-secondary-dark": "#94A3B8",
            },
            fontFamily: {
              display: ["Inter", "sans-serif"],
            },
            borderRadius: {
              DEFAULT: "0.75rem",
            },
          },
        },
      };
    </script>
    <style>
      body {
        font-family: "Inter", sans-serif;
      }

      .textt {
        color: white !important;
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

      /* Custom responsive adjustments */
      @media (max-width: 640px) {
        .mobile-padding {
          padding: 1.5rem 1rem;
        }
        .mobile-text-center {
          text-align: center;
        }
      }

      @media (max-width: 768px) {
        .mobile-stack {
          flex-direction: column;
        }
        .mobile-full-width {
          width: 100%;
        }
      }

      .password-input-container {
        position: relative;
      }
      .password-toggle {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: #64748b;
      }
      .password-toggle:hover {
        color: #374151;
      }

      .input-error {
        border-color: #ef4444 !important;
      }
      .input-success {
        border-color: #10b981 !important;
      }
      .error-message {
        color: #ef4444;
        font-size: 0.875rem;
        margin-top: 0.25rem;
      }
      .success-message {
        color: #10b981;
        font-size: 0.875rem;
        margin-top: 0.25rem;
      }
    </style>

    <div class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark font-display min-h-screen">
      <div class="flex flex-col md:flex-row w-full min-h-screen">
        <!-- Info Section - Left Side on Desktop, Bottom on Mobile -->
        <div
          class="w-full md:w-1/2 bg-primary p-6 sm:p-8 md:p-12 flex flex-col items-center justify-center text-white order-2 md:order-1 mobile-full-width"
        >
          <div
            class="max-w-sm sm:max-w-md mx-auto w-full flex flex-col items-center justify-center h-full py-4 md:py-0"
          >
            <span
              class="material-icons text-white"
              style="font-size: clamp(64px, 15vw, 96px); opacity: 0.8"
              >groups_3</span
            >
            <h2 class="text-2xl sm:text-3xl font-bold mt-4 sm:mt-6 text-center">
              Join Our Community
            </h2>
            <p
              class="mt-3 sm:mt-4 text-center text-indigo-200 text-sm sm:text-base textt"
            >
              Start your journey with our AI-powered development platform and
              transform the way you build software.
            </p>
          </div>
        </div>

        <!-- Register Section - Right Side on Desktop, Top on Mobile -->
        <div
          class="w-full md:w-1/2 p-6 sm:p-8 md:p-10 lg:p-12 flex flex-col justify-center bg-card-light dark:bg-card-dark order-1 md:order-2 mobile-full-width"
        >
          <div class="max-w-xs sm:max-w-sm md:max-w-md mx-auto w-full">
            <div class="mb-6 sm:mb-8 mobile-text-center md:text-left">
              <div
                class="flex items-center space-x-2 justify-center md:justify-start"
              >
                <span
                  class="material-icons text-primary"
                  style="font-size: 32px; font-size: 36px"
                  >hub</span
                >
                <h1
                  class="text-2xl sm:text-3xl font-bold text-text-light dark:text-text-dark"
                >
                  DevFlow
                </h1>
              </div>
              <p
                class="mt-2 text-text-secondary-light dark:text-text-secondary-dark text-sm sm:text-base"
              >
                Seamless development, powered by AI.
              </p>
            </div>
            <h2
              class="text-xl sm:text-2xl font-bold mb-3 sm:mb-4 mobile-text-center md:text-left"
            >
              Create Your Account
            </h2>
            <p
              class="text-text-secondary-light dark:text-text-secondary-dark mb-6 sm:mb-8 text-sm sm:text-base mobile-text-center md:text-left"
            >
              Join our platform to manage your software development projects.
            </p>

            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="p-4 rounded-lg mb-4 <#if message.type = 'error'>bg-red-50 text-red-800 border border-red-200<#elseif message.type = 'success'>bg-green-50 text-green-800 border border-green-200<#else>bg-blue-50 text-blue-800 border border-blue-200</#if>">
                ${kcSanitize(message.summary)?no_esc}
              </div>
            </#if>

            <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-4 sm:space-y-5">
              <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                  <label
                    class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                    for="firstName"
                  >${msg("firstName")}</label>
                  <input
                    autocomplete="given-name"
                    class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base <#if messagesPerField.existsError('firstName')>input-error</#if>"
                    id="firstName"
                    name="firstName"
                    placeholder="John"
                    required
                    type="text"
                    value="${(register.formData.firstName!'')}"
                  />
                  <#if messagesPerField.existsError('firstName')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                    </div>
                  </#if>
                </div>

                <div>
                  <label
                    class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                    for="lastName"
                  >${msg("lastName")}</label>
                  <input
                    autocomplete="family-name"
                    class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base <#if messagesPerField.existsError('lastName')>input-error</#if>"
                    id="lastName"
                    name="lastName"
                    placeholder="Doe"
                    required
                    type="text"
                    value="${(register.formData.lastName!'')}"
                  />
                  <#if messagesPerField.existsError('lastName')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                    </div>
                  </#if>
                </div>
              </div>

              <div>
                <label
                  class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                  for="email"
                >${msg("email")}</label>
                <input
                  autocomplete="email"
                  class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base <#if messagesPerField.existsError('email')>input-error</#if>"
                  id="email"
                  name="email"
                  placeholder="you@example.com"
                  required
                  type="email"
                  value="${(register.formData.email!'')}"
                />
                <#if messagesPerField.existsError('email')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                  </div>
                </#if>
              </div>

              <#if !realm.registrationEmailAsUsername>
                <div>
                  <label
                    class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                    for="username"
                  >${msg("username")}</label>
                  <input
                    autocomplete="username"
                    class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base <#if messagesPerField.existsError('username')>input-error</#if>"
                    id="username"
                    name="username"
                    placeholder="username"
                    required
                    type="text"
                    value="${(register.formData.username!'')}"
                  />
                  <#if messagesPerField.existsError('username')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('username'))?no_esc}
                    </div>
                  </#if>
                </div>
              </#if>

              <div>
                <label
                  class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                  for="password"
                >${msg("password")}</label>
                <div class="password-input-container">
                  <input
                    autocomplete="new-password"
                    class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base pr-10 <#if messagesPerField.existsError('password')>input-error</#if>"
                    id="password"
                    name="password"
                    placeholder="••••••••"
                    required
                    type="password"
                  />
                  <button
                    type="button"
                    class="password-toggle"
                    onclick="togglePasswordVisibility('password')"
                    aria-label="Toggle password visibility"
                  >
                    <span id="password-eye-open" class="material-icons text-lg">visibility</span>
                    <span id="password-eye-closed" class="material-icons text-lg hidden">visibility_off</span>
                  </button>
                </div>
                <#if messagesPerField.existsError('password')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                  </div>
                </#if>
                <div id="password-requirements" class="mt-2 text-sm space-y-1">
                  <div id="password-length" class="flex items-center gap-2">
                    <span class="requirement-icon text-slate-400">○</span>
                    <span class="text-slate-500">At least 8 characters</span>
                  </div>
                  <div id="password-mix" class="flex items-center gap-2">
                    <span class="requirement-icon text-slate-400">○</span>
                    <span class="text-slate-500">Mix of letters and numbers</span>
                  </div>
                  <div id="password-special" class="flex items-center gap-2">
                    <span class="requirement-icon text-slate-400">○</span>
                    <span class="text-slate-500">At least one special character</span>
                  </div>
                </div>
              </div>

              <div>
                <label
                  class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                  for="password-confirm"
                >${msg("passwordConfirm")}</label>
                <div class="password-input-container">
                  <input
                    autocomplete="new-password"
                    class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base pr-10 <#if messagesPerField.existsError('password-confirm')>input-error</#if>"
                    id="password-confirm"
                    name="password-confirm"
                    placeholder="••••••••"
                    required
                    type="password"
                  />
                  <button
                    type="button"
                    class="password-toggle"
                    onclick="togglePasswordVisibility('password-confirm')"
                    aria-label="Toggle password confirmation visibility"
                  >
                    <span id="confirm-eye-open" class="material-icons text-lg">visibility</span>
                    <span id="confirm-eye-closed" class="material-icons text-lg hidden">visibility_off</span>
                  </button>
                </div>
                <#if messagesPerField.existsError('password-confirm')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                  </div>
                </#if>
                <div id="password-match-message" class="error-message hidden">Passwords do not match</div>
                <div id="password-match-success" class="success-message hidden">Passwords match</div>
              </div>

              <#if recaptchaRequired??>
                <div class="form-group">
                  <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
              </#if>

              <button
                id="register-button"
                class="w-full bg-primary text-white py-2 sm:py-3 px-4 rounded-lg font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary focus:ring-offset-background-light dark:focus:ring-offset-background-dark transition duration-300 flex items-center justify-center text-sm sm:text-base disabled:bg-slate-400 disabled:cursor-not-allowed disabled:hover:bg-slate-400"
                type="submit"
                disabled
              >
                <span>${msg("doRegister")}</span>
                <span class="material-icons ml-2 text-base sm:text-lg">arrow_forward</span>
              </button>
            </form>

            <div
              class="mt-6 sm:mt-8 text-center text-xs sm:text-sm text-text-secondary-light dark:text-text-secondary-dark"
            >
              <p>
                Already have an account?
                <a class="font-medium text-primary hover:underline" href="${url.loginUrl}"
                  >Sign in</a
                >
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    </#if>
<script src="${url.resourcesPath}/js/register.js"></script>
</@layout.registrationLayout>
