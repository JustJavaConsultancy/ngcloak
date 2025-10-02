<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Attorney AI - Two-Factor Authentication</title>
    <link href="data:image/x-icon;base64," rel="icon" type="image/x-icon" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link crossorigin="" href="https://fonts.gstatic.com/" rel="preconnect" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <style type="text/tailwindcss">
      :root {
        --primary-color: #2563eb;
        --secondary-color: #1e40af;
        --background-color: #f8fafc;
        --card-background: #ffffff;
        --text-primary: #1e293b;
        --text-secondary: #64748b;
        --input-border: #e2e8f0;
        --input-focus: #2563eb;
        --button-hover: #1d4ed8;
        --accent-color: #f59e0b;
        --error-color: #dc2626;
      }

      .login-pf-header, .login-pf-page-header {
        display: none !important;
      }

      .login-pf-page {
        padding-top: 0px;
      }

      html, body {
        @apply font-sans bg-[var(--background-color)] text-[var(--text-primary)] antialiased;
        overflow-x: hidden;
        overflow-y: hidden;
      }

      .card {
        @apply bg-[var(--card-background)] rounded-xl shadow-xl p-8 border border-gray-100;
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1),
          0 10px 10px -5px rgba(0, 0, 0, 0.04);
      }

      .button_primary {
        @apply bg-gradient-to-r from-[var(--primary-color)] to-[var(--secondary-color)] text-white rounded-lg px-4 py-3 text-base font-semibold hover:opacity-90 transition-all duration-300 w-full shadow-md hover:shadow-lg;
      }

      .input {
        @apply border border-[var(--input-border)] rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-[var(--input-focus)] w-full transition-all duration-300 bg-white hover:border-[var(--primary-color)];
      }

      .input-container {
        @apply relative;
      }

      .input-icon {
        @apply absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-5 w-5;
      }

      .input-with-icon {
        @apply pl-10;
      }

      .form_label {
        @apply block text-[var(--text-secondary)] text-sm font-medium mb-2;
      }

      .logo-text {
        font-family: "Playfair Display", serif;
      }

      .transition-slow {
        transition: all 0.5s ease;
      }

      .legal-icon {
        filter: drop-shadow(0 4px 6px rgba(37, 99, 235, 0.2));
      }

      .side-image {
        background-image: url("https://images.unsplash.com/photo-1589829545856-d10d557cf95f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
        background-size: cover;
        background-position: center;
        border-radius: 1rem 0 0 1rem;
      }

      .side-image-overlay {
        @apply h-full w-full bg-gradient-to-b from-blue-900/70 to-blue-900/30 flex items-center justify-center p-12;
      }

      .error-message {
        @apply text-sm text-[var(--error-color)] mt-1;
      }

      .attorney-text {
        color: white !important;
      }

      @media (max-width: 1023px) {
        .side-image {
          display: none;
        }
      }
    </style>

    <div class="flex min-h-screen items-center justify-center p-4 sm:p-6">
      <div
        class="flex w-full max-w-6xl bg-white rounded-xl shadow-2xl overflow-hidden animate_animated animate_fadeIn"
      >
        <!-- Side Image -->
        <div class="lg:block w-1/2 side-image">
          <div class="side-image-overlay">
            <div class="text-white text-center">
              <div class="relative inline-block mb-6">
                <div
                  class="absolute -inset-4 bg-blue-100/20 rounded-full opacity-60 animate-pulse"
                ></div>
                <div
                  class="relative flex items-center justify-center w-24 h-24 bg-white/10 backdrop-blur-sm rounded-2xl shadow-md legal-icon border border-white/20"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-12 w-12 text-white"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    stroke-width="1.5"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                    />
                  </svg>
                </div>
              </div>
              <h2 class="text-4xl font-bold mb-4 logo-text">AttorneyAI</h2>
              <p class="text-xl mb-6 max-w-md mx-auto leading-relaxed attorney-text">
                Secure access with two-factor authentication
              </p>
              <div class="flex justify-center space-x-2 mt-8">
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0s"
                ></div>
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0.2s"
                ></div>
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0.4s"
                ></div>
              </div>
            </div>
          </div>
        </div>

        <!-- OTP Form -->
        <div class="w-full lg:w-1/2 p-8 sm:p-12">
          <div class="text-center mb-8 lg:hidden">
            <div class="flex justify-center mb-6">
              <div class="relative">
                <div
                  class="absolute -inset-4 bg-blue-100 rounded-full opacity-60 animate-pulse"
                ></div>
                <div
                  class="relative flex items-center justify-center w-24 h-24 bg-white rounded-2xl shadow-md legal-icon"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-12 w-12 text-blue-600"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    stroke-width="1.5"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                    />
                  </svg>
                </div>
              </div>
            </div>
            <h1
              class="text-3xl font-bold text-[var(--text-primary)] logo-text mb-2"
            >
              AttorneyAI
            </h1>
            <p class="text-[var(--text-secondary)]">
              AI-powered legal intelligence
            </p>
          </div>

          <h2 class="text-2xl font-bold text-[var(--text-primary)] mb-1">
            Two-Factor Authentication
          </h2>
          <p class="text-[var(--text-secondary)] mb-8">
            Please enter your authentication code to continue
          </p>

          <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="alert alert-${message.type} mb-6">
              <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
              <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
              <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
              <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
              <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
            </div>
          </#if>

          <form action="${url.loginAction}" method="post" class="space-y-6">
            <div class="space-y-5">
              <div>
                <label class="form_label" for="otp">
                  Enter OTP Code
                </label>
                <div class="input-container">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="input-icon"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    stroke-width="1.5"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A1.994 1.994 0 013 12V7a4 4 0 014-4z"
                    />
                  </svg>
                  <input
                    class="input input-with-icon <#if messagesPerField.existsError('totp')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                    id="otp"
                    name="otp"
                    type="text"
                    placeholder="Enter 6-digit code"
                    autofocus
                    autocomplete="one-time-code"
                    aria-invalid="<#if messagesPerField.existsError('totp')>true</#if>"
                  />
                </div>
                <#if messagesPerField.existsError('totp')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.get('totp'))?no_esc}
                  </div>
                </#if>
              </div>
            </div>

            <button
              class="button_primary mt-6 flex items-center justify-center gap-2 hover:gap-3 transition-all"
              type="submit"
            >
              <span>Verify</span>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-5 w-5"
                viewBox="0 0 20 20"
                fill="currentColor"
              >
                <path
                  fill-rule="evenodd"
                  d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                />
              </svg>
            </button>
          </form>

          <div class="text-center mt-8">
            <p class="text-xs sm:text-sm text-[var(--text-secondary)]">
              Having trouble? Contact your administrator for assistance.
            </p>
          </div>
        </div>
      </div>
    </div>
    </#if>
</@layout.registrationLayout>