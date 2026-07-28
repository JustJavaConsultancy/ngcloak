<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}

        <style>

html,
body {
  overflow-x: hidden;
}

.login-pf body {
  background: var(--bs-primary) !important;
  padding: 0 !important;
  margin: 0 !important;
}

.login-pf-page {
  background: transparent !important;
  padding: 0 !important;
}

#kc-header,
#kc-content,
#kc-content-wrapper {
  background: transparent !important;
  padding: 0 !important;
  margin: 0 !important;
  max-width: 100% !important;
}

#kc-header-wrapper,
#kc-header,
#kc-form-options,
#kc-form-buttons,
#kc-info-wrapper,
#kc-feedback-wrapper,
.alert-warning,
.alert-error {
  display: none !important;
}

          :root {
            --bluepay-primary: #0c74b1;
            --bluepay-dark: #062c5a;
            --bluepay-text: #313957;
          }

          body {
            font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica,
              sans-serif;
          }

          .bg-bluepay-primary {
            background-color: var(--bluepay-primary) !important;
          }

          .text-bluepay-primary {
            color: var(--bluepay-primary) !important;
          }

          .text-bluepay-dark {
            color: var(--bluepay-dark) !important;
          }

          .text-bluepay-text {
            color: var(--bluepay-text) !important;
          }

          .verify-email-page {
            width: 100vw;
            height: 100vh;
          }

          .logo-container-desktop {
            top: 2.5rem;
            left: 3.6875rem;
            width: 10.5rem;
            height: 3.5625rem;
          }

          .logo-image {
            width: 10.125rem;
            height: 3.5625rem;
          }

          .back-icon-container {
            width: 1.5rem;
            height: 1.5rem;
            padding: 0.375rem;
            border: 1px solid #e4e7ec;
          }

          .back-arrow-icon {
            width: 0.75rem;
            height: 0.75rem;
          }

          .verification-card {
            height: 27.1875rem;
            border-radius: 0.375rem;
          }

          .card-content {
            width: 24.0625rem;
            max-width: 100%;
          }

          .email-icon {
            width: 5.54375rem;
            height: 3.928125rem;
          }

          .main-heading {
            font-size: 1.875rem;
            line-height: 1;
            letter-spacing: -0.05625rem;
          }

          .instruction-text,
          .resend-text {
            font-size: 0.875rem;
            line-height: 1.6;
          }

          .company-name {
            font-size: 1.125rem;
            line-height: 1.6;
          }

          .license-text {
            font-size: 1rem;
            line-height: 1.6;
          }

          @media (max-width: 991px) {
            .logo-container-desktop {
              position: relative !important;
              top: 0 !important;
              left: 0 !important;
            }
          }

          @media (max-width: 640px) {
            .verify-email-page {
              padding-top: 2.5rem !important;
              justify-content: flex-start !important;
            }

            .logo-image {
              width: 8.75rem;
              height: 3rem;
            }

            .main-heading {
              font-size: 1.5rem;
              letter-spacing: -0.0375rem;
            }

            .instruction-text,
            .resend-text {
              font-size: 0.8125rem;
              line-height: 1.5;
            }

            .company-name {
              font-size: 1rem;
            }

            .license-text {
              font-size: 0.875rem;
            }

            .verification-card {
              height: auto !important;
            }
          }
        </style>

        <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
        />
   <#elseif section = "form">
    <main class="verify-email-page bg-bluepay-primary d-flex flex-column align-items-center justify-content-center position-relative p-3 p-md-4">

    <header
        class="logo-container-desktop position-absolute d-lg-block d-none"
      >
        <img src="${url.resourcesPath}/img/logo.svg" alt="BluePay Logo" class="img-fluid" style="max-width: 168px"/>
      </header>

      <!-- Mobile logo -->
      <header class="d-lg-none align-self-start mb-4 mb-sm-5">
       <img src="${url.resourcesPath}/img/logo.svg" alt="BluePay Logo" class="img-fluid" style="max-width: 168px"/>
      </header>

    <section
        class="d-flex flex-column align-items-center gap-3 gap-sm-4 position-relative"
        style="width: 34.3125rem; max-width: 100%; z-index: 1"
      >
      <nav
          class="d-flex flex-column align-items-start align-self-stretch"
          style="gap: 2.125rem"
        >
          <a
            href="${properties.backToAppUrl!'https://bluepay-v0.onrender.com'}"
            class="d-flex align-items-center gap-3 gap-sm-2 text-decoration-none"
          >
              <img src="${url.resourcesPath}/img/back-arrow.png" alt="Back" width="24" height="24" class="me-2"/>
            <span
              class="text-white fw-medium"
              style="font-size: 0.875rem; line-height: 1.45"
              >Back</span
            >
          </a>
        </nav>
      <div class="verification-card bg-white p-4 shadow-sm d-flex flex-column align-items-center justify-content-center rounded">
     <img src= "${url.resourcesPath}/img/email-sent-icon.png"/>
        <div class="card-content text-center">
          <h1 class="main-heading text-bluepay-primary mb-3">Email verification</h1>
          
          <p class="instruction-text text-bluepay-text mb-4">
            <#if verifyEmail??>
              ${msg("emailVerifyInstruction1", verifyEmail)}
            <#else>
              ${msg("emailVerifyInstruction1", user.email)}
            </#if>
          </p>

          <p class="resend-text text-bluepay-text">
  Didn't get email? 
  <span id="countdown" class="text-bluepay-primary"></span>
  <a id="resend-link" href="${url.loginAction}" class="text-bluepay-primary text-decoration-underline" style="display:none;">Resend</a>
</p>

        </div>

        <#if isAppInitiatedAction??>
          <form id="kc-verify-email-form" class="${properties.kcFormClass!} mt-4" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
              <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <#if verifyEmail??>
                  <input
                    class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"
                    type="submit"
                    value="${msg("emailVerifyResend")}"
                  />
                <#else>
                  <input
                    class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}"
                    type="submit"
                    value="${msg("emailVerifySend")}"
                  />
                </#if>
                <button
                  class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}"
                  type="submit"
                  name="cancel-aia"
                  value="true"
                  formnovalidate
                >
                  ${msg("doCancel")}
                </button>
              </div>
            </div>
          </form>
        </#if>
      </div>
      </section>
    </main>

  <#elseif section = "info">

      <#if !isAppInitiatedAction??>
        <p class="instruction" style="color: white;">
          ${msg("emailVerifyInstruction2")}
          <br/>
          <a href="${url.loginAction}" style="color: white;">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
        </p>
      </#if>

      <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${url.resourcesPath}/js/login-verify-email.js"></script>
  </#if>
</@layout.registrationLayout>
