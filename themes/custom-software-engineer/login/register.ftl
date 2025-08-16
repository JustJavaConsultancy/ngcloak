<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Sign Up | The Software Engineer</title>
    <link crossorigin="" href="https://fonts.gstatic.com/" rel="preconnect" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
      rel="stylesheet"
    />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style type="text/tailwindcss">
      :root {
        --primary-color: #0d7ff2;
        --secondary-color: #f2f7ff;
        --background-color: #ffffff;
        --text-primary: #1e293b;
        --text-secondary: #64748b;
        --accent-color: #e0f2fe;
      }

      .login-pf-header, .login-pf-page-header {
        display: none !important;
      }

      .login-pf-page {
        padding-top: 0px;
      }

      body {
        @apply font-sans bg-[var(--background-color)] text-[var(--text-primary)];
      }
      .button_primary {
        @apply bg-[var(--primary-color)] text-white rounded-md px-4 py-2 hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 transition-all duration-300;
      }
      .button_primary:disabled {
        @apply bg-gray-400 cursor-not-allowed hover:bg-gray-400;
      }
      .button_secondary {
        @apply bg-[var(--secondary-color)] text-[var(--primary-color)] rounded-md px-4 py-2 hover:bg-blue-100 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-opacity-50 transition-all duration-300;
      }
      .input {
        @apply bg-white border border-gray-300 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all duration-200;
      }
      .input-error {
        @apply border-red-500 focus:ring-red-500 focus:border-red-500;
      }
      .input-success {
        @apply border-green-500 focus:ring-green-500 focus:border-green-500;
      }
      .typography_h1 {
        @apply text-3xl font-bold text-[var(--text-primary)];
      }
      .typography_h2 {
        @apply text-2xl font-semibold text-[var(--text-primary)];
      }
      .typography_body {
        @apply text-base text-[var(--text-secondary)];
      }
      .error-message {
        @apply text-red-600 text-sm mt-1;
      }
      .success-message {
        @apply text-green-600 text-sm mt-1;
      }
      .password-input-container {
        @apply relative;
      }
      .password-toggle {
        @apply absolute right-3 top-1/2 transform -translate-y-1/2 cursor-pointer text-gray-500 hover:text-gray-700;
      }

      /* Process animation container */
      .process-container {
        @apply w-full max-w-4xl mx-auto relative h-48;
      }

      /* Process track */
      .process-track {
        @apply absolute top-1/2 left-0 right-0 h-1 bg-white bg-opacity-20 transform -translate-y-1/2;
      }

      .process-step {
        @apply absolute top-1/2 flex flex-col items-center w-24 transform -translate-y-1/2 opacity-0;
        animation: flyIn 1.2s forwards cubic-bezier(0.175, 0.885, 0.32, 1.275);
      }
      .step-1 {
        left: 10%;
        animation-delay: 0.6s;
      }
      .step-2 {
        left: 30%;
        animation-delay: 1.2s;
      }
      .step-3 {
        left: 50%;
        animation-delay: 1.8s;
      }
      .step-4 {
        left: 70%;
        animation-delay: 2.4s;
      }
      .step-5 {
        left: 90%;
        animation-delay: 3s;
      }

      @keyframes flyIn {
        0% {
          opacity: 0;
          transform: translate(-50%, -50%) scale(0.5);
        }
        70% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1.1);
        }
        100% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1);
        }
      }

      /* Process icons */
      .process-icon {
        @apply relative w-16 h-16 mb-2;
      }
      .process-icon-outer {
        @apply absolute inset-0 rounded-full bg-white bg-opacity-10 border-2 border-white border-opacity-50;
        animation: pulse 2s infinite;
      }
      .process-icon-inner {
        @apply absolute inset-0 m-2 rounded-full bg-white bg-opacity-20 border border-white flex items-center justify-center z-10;
        transition: all 0.3s ease;
      }
      .process-step:hover .process-icon-inner {
        @apply bg-opacity-30 transform scale-110;
      }

      @keyframes pulse {
        0%,
        100% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.05);
        }
      }

      /* Process labels */
      .process-label {
        @apply text-white font-medium text-sm mt-2 whitespace-nowrap;
      }
    </style>

    <div class="min-h-screen grid grid-cols-1 md:grid-cols-2">
      <div
        class="hidden md:flex items-center justify-center p-12 flex-col relative bg-gradient-to-b from-blue-600 to-blue-800"
      >
        <!-- Background image -->
        <div
          class="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1622675363311-3e1904dc1885?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80')] bg-cover bg-center opacity-10"
        ></div>

        <!-- Header -->
        <div class="w-full max-w-md mb-12 z-10 text-white text-center">
          <h1 class="text-4xl font-bold mb-2">The Software Engineer</h1>
          <p class="text-lg opacity-90">Streamline your development workflow</p>
        </div>

        <!-- Process animation -->
        <div class="process-container z-10">
          <!-- Process steps -->
          <div class="process-step step-1">
            <div class="process-icon">
              <div class="process-icon-outer"></div>
              <div class="process-icon-inner">
                <span class="text-xl">📋</span>
              </div>
            </div>
            <span class="process-label">Requirement</span>
          </div>

          <div class="process-step step-2">
            <div class="process-icon">
              <div class="process-icon-outer"></div>
              <div class="process-icon-inner">
                <span class="text-xl">📝</span>
              </div>
            </div>
            <span class="process-label">Planning</span>
          </div>

          <div class="process-step step-3">
            <div class="process-icon">
              <div class="process-icon-outer"></div>
              <div class="process-icon-inner">
                <span class="text-xl">💻</span>
              </div>
            </div>
            <span class="process-label">Develop</span>
          </div>

          <div class="process-step step-4">
            <div class="process-icon">
              <div class="process-icon-outer"></div>
              <div class="process-icon-inner">
                <span class="text-xl">🔍</span>
              </div>
            </div>
            <span class="process-label">Testing</span>
          </div>

          <div class="process-step step-5">
            <div class="process-icon">
              <div class="process-icon-outer"></div>
              <div class="process-icon-inner">
                <span class="text-xl">🚀</span>
              </div>
            </div>
            <span class="process-label">Deliver</span>
          </div>
        </div>

        <div
          class="mt-12 text-white opacity-80 text-sm text-center max-w-md z-10"
        >
          <p>
            From concept to deployment - manage your entire software development
            lifecycle in one place
          </p>
        </div>
      </div>

      <!-- Signup Form -->
      <div
        class="flex flex-col justify-center items-center p-6 sm:p-12 bg-white"
      >
        <div class="w-full max-w-md space-y-8">
          <div class="text-center">
            <a class="inline-block mb-4" href="${url.loginUrl}">
              <svg
                class="h-10 w-auto text-[var(--primary-color)]"
                fill="none"
                viewBox="0 0 48 48"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M8 8h6v6H8V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zM8 16h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 24h6v6H8v-6zm8 0h6v6h-6v-6zm16 0h6v6h-6v-6zM8 32h6v6H8v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 40h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6z"
                  fill="currentColor"
                />
                <path
                  d="M20 20h8v8h-8v-8z"
                  fill="currentColor"
                  opacity="0.6"
                />
              </svg>
            </a>
            <h1 class="typography_h1">Create your account</h1>
            <p class="typography_body mt-2">
              Join our platform to manage your software development projects.
            </p>
          </div>

          <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="p-4 rounded-md mb-4 <#if message.type = 'error'>bg-red-50 text-red-800 border border-red-200<#elseif message.type = 'success'>bg-green-50 text-green-800 border border-green-200<#else>bg-blue-50 text-blue-800 border border-blue-200</#if>">
              ${kcSanitize(message.summary)?no_esc}
            </div>
          </#if>

          <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-6">
            <div>
              <label
                class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                for="firstName"
                >${msg("firstName")}</label
              >
              <input
                autocomplete="given-name"
                class="input w-full <#if messagesPerField.existsError('firstName')>input-error</#if>"
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
                class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                for="lastName"
                >${msg("lastName")}</label
              >
              <input
                autocomplete="family-name"
                class="input w-full <#if messagesPerField.existsError('lastName')>input-error</#if>"
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

            <div>
              <label
                class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                for="email"
                >${msg("email")}</label
              >
              <input
                autocomplete="email"
                class="input w-full <#if messagesPerField.existsError('email')>input-error</#if>"
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
                  class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                  for="username"
                  >${msg("username")}</label
                >
                <input
                  autocomplete="username"
                  class="input w-full <#if messagesPerField.existsError('username')>input-error</#if>"
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
                class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                for="password"
                >${msg("password")}</label
              >
              <div class="password-input-container">
                <input
                  autocomplete="new-password"
                  class="input w-full pr-10 <#if messagesPerField.existsError('password')>input-error</#if>"
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
                  <svg id="password-eye-open" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  <svg id="password-eye-closed" class="h-5 w-5 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21" />
                  </svg>
                </button>
              </div>
              <#if messagesPerField.existsError('password')>
                <div class="error-message">
                  ${kcSanitize(messagesPerField.get('password'))?no_esc}
                </div>
              </#if>
              <div id="password-requirements" class="mt-2 text-sm">
                <div id="password-length" class="flex items-center gap-2">
                  <span class="requirement-icon text-gray-400">○</span>
                  <span class="text-gray-500">At least 8 characters</span>
                </div>
                <div id="password-mix" class="flex items-center gap-2">
                  <span class="requirement-icon text-gray-400">○</span>
                  <span class="text-gray-500">Mix of letters and numbers</span>
                </div>
              </div>
            </div>

            <div>
              <label
                class="block text-sm font-medium text-[var(--text-primary)] mb-1"
                for="password-confirm"
                >${msg("passwordConfirm")}</label
              >
              <div class="password-input-container">
                <input
                  autocomplete="new-password"
                  class="input w-full pr-10 <#if messagesPerField.existsError('password-confirm')>input-error</#if>"
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
                  <svg id="password-confirm-eye-open" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                  </svg>
                  <svg id="password-confirm-eye-closed" class="h-5 w-5 hidden" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21" />
                  </svg>
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
              class="button_primary w-full py-3 flex items-center justify-center gap-2"
              type="submit"
              disabled
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fill-rule="evenodd"
                  d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z"
                  clip-rule="evenodd"
                />
              </svg>
              ${msg("doRegister")}
            </button>
          </form>

          <div class="relative">
            <div class="absolute inset-0 flex items-center">
              <div class="w-full border-t border-gray-300"></div>
            </div>
            <div class="relative flex justify-center text-sm">
              <span class="px-2 bg-white text-gray-500"
                >Already have an account?</span
              >
            </div>
          </div>

          <a
            class="button_secondary w-full py-3 flex items-center justify-center gap-2"
            href="${url.loginUrl}"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-5 w-5"
              viewBox="0 0 20 20"
              fill="currentColor"
            >
              <path
                fill-rule="evenodd"
                d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z"
                clip-rule="evenodd"
              />
            </svg>
            ${msg("backToLogin")}
          </a>
        </div>
      </div>
    </div>
    </#if>
<script src="${url.resourcesPath}/js/register.js"></script>
</@layout.registrationLayout>
