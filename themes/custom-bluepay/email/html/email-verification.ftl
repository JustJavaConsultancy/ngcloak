<#import "template.ftl" as layout>
<@layout.emailLayout>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Verify your Bluepay Email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
      body {
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica, sans-serif;
        background-color: transparent;
        margin: 0;
        padding: 0;
      }
      .email-container {
        width: 100%;
        margin: 0 auto;
        background-color: transparent;
      }
      .bluepay-logo {
        width: 135px;
        height: 43px;
        object-fit: contain;
      }
      .email-body {
        border-radius: 4px 4px 0px 0px;
        background-color: #fff;
      }
      .welcome-message,
      .instructions-text,
      .closing-message,
      .copyright-text {
        color: #313957;
        font-feature-settings: "liga" off, "clig" off;
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica, sans-serif;
        font-weight: 400;
        line-height: 160%;
        font-size: 1rem;
      }
      .welcome-message {
        margin-bottom: 2rem;
      }
      .instructions-text {
        line-height: 1.4;
        margin-bottom: 1.5rem;
      }
      .closing-message {
        margin-bottom: 2rem;
      }
      .copyright-text {
        margin-bottom: 0;
      }
      .confirmation-button {
        height: 46px;
        border-radius: 10px;
        background-color: #0c74b1;
        border: none;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        width: 100%;
        margin-bottom: 2rem;
      }
      .confirmation-button:hover {
        background-color: #0a5d8a;
      }
      .button-text {
        font-family: Inter, -apple-system, Roboto, Helvetica, sans-serif;
        font-weight: 500;
        font-size: 0.875rem;
        line-height: 1.5rem;
        color: #fff;
        display: inline-block;
        padding: 10px 20px;
      }
      .confirmation-url {
        color: #0c74b1;
        text-decoration: none;
        word-break: break-all;
      }
      .email-footer {
        border-radius: 0px 0px 4px 4px;
        background-color: #f7f9fc;
      }
      .social-icon {
        width: 24px;
        height: 24px;
        object-fit: contain;
      }
      .header-section {
        background-color: #f2f5f8;
        padding: 24px 32px;
      }
      .main-content {
        background-color: #fff;
        padding: 32px;
      }
      .footer-section {
        background-color: #f7f9fc;
        padding: 32px;
      }
      .section-spacing {
        margin-bottom: 1.5rem;
      }
      .button-section {
        margin: 2rem 0;
      }
      @media (max-width: 600px) {
        .email-container {
          width: 100% !important;
          max-width: 100% !important;
        }
        .header-section,
        .main-content,
        .footer-section {
          padding: 20px !important;
        }
        .welcome-message {
          margin-bottom: 1.5rem;
        }
        .confirmation-button {
          margin-bottom: 1.5rem;
        }
        .closing-message {
          margin-bottom: 1.5rem;
        }
        .section-spacing {
          margin-bottom: 1rem;
        }
        .button-section {
          margin: 1.5rem 0;
        }
      }
    </style>
  </head>
  <body>
    <div class="email-container">
      <header class="header-section">
        <div style="width: 140px; height: 43px" class="position-relative">
          <img src="${url.resourcesPath}/img/blue-logo.svg" alt="BluePay" class="bluepay-logo">
        </div>
      </header>

      <main class="main-content">
        <section class="welcome-message">
          Dear ${user.firstName!"Customer"},
          <br /><br />
          Thanks for signing up with Bluepay! To create your account and get started with accepting payments, please confirm your email address.
          <br /><br />
          Click the button below to complete your signup.
        </section>

        <div class="button-section">
          <a href="${link}" class="confirmation-button d-flex justify-content-center align-items-center" target="_blank">
            <span class="button-text">Confirm your email</span>
          </a>
        </div>

        <section class="instructions-text section-spacing">
          If you're having trouble clicking the button, copy and paste the URL below into your browser:
          <br /><br />
          <a href="${link}" class="confirmation-url">${link}</a>
        </section>

        <section class="instructions-text section-spacing">
          This link will expire in ${linkExpirationFormatter(linkExpiration)}.
        </section>

        <section class="closing-message">
          Best regards,<br />
          The Bluepay Team
        </section>

        <section class="copyright-text">
          © Bluepay Ltd. 2026 | Modern Day Payment
        </section>
      </main>

      <footer class="footer-section">
        <div class="d-flex justify-content-start align-items-center" style="gap: 24px;">
          <img
            src="${url.resourcesPath}/img/facebook.svg"
            alt="Facebook"
            class="social-icon"
          />
          <img
            src="${url.resourcesPath}/img/twitter.svg"
            alt="Twitter"
            class="social-icon"
          />
          <img
            src="${url.resourcesPath}/img/linkedin.svg"
            alt="LinkedIn"
            class="social-icon"
          />
        </div>
      </footer>
    </div>
  </body>
</html>

</@layout.emailLayout>
