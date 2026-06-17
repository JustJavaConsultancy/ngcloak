<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>AMS - Secure Login</title>
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            sans: ['Inter', 'sans-serif'],
          },
          colors: {
            'enterprise-bg': '#f7f9fb',
            'enterprise-primary': '#0f172a',
            'enterprise-border': '#d8dadc',
          },
          borderRadius: {
            'custom': '4px',
          }
        }
      }
    }
  </script>
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background-color: #f7f9fb;
    }
    .login-card {
      box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05), 0 2px 4px -2px rgb(0 0 0 / 0.05);
      border: 1px solid #e5e7eb;
    }
  </style>
</head>
<body class="min-h-screen flex flex-col">

  <!-- Navigation -->
  <nav class="w-full bg-white border-b border-enterprise-border px-8 py-4 flex justify-between items-center">
    <div class="flex items-center gap-2">
      <svg class="text-enterprise-primary" fill="none" height="20" stroke="currentColor"
           stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
           viewBox="0 0 24 24" width="20" xmlns="http://www.w3.org/2000/svg">
        <path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
        <polyline points="9 22 9 12 15 12 15 22"></polyline>
      </svg>
      <span class="font-bold text-lg tracking-tight text-enterprise-primary">Accounting Management System</span>
    </div>
    <div class="flex items-center gap-8 text-sm font-medium text-slate-500">
      <a class="hover:text-enterprise-primary transition-colors" href="#">Help Center</a>
      <a class="hover:text-enterprise-primary transition-colors" href="#">System Status</a>
    </div>
  </nav>

  <!-- Main Content -->
  <main class="flex-grow flex items-center justify-center p-6">
    <div class="w-full max-w-md bg-white login-card p-10 rounded-custom">

      <!-- Branding -->
      <div class="text-center mb-8">
        <div class="inline-flex items-center justify-center w-12 h-12 mb-4">
          <!--
            Replace the src below with your own logo.
            To use a local file, place it at:
              themes/ams/login/resources/img/logo.png
            Then reference it as:
              src="${url.resourcesPath}/img/logo.png"
          -->
          <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuAcP6EQ1xBSBNJsRxmG01Eb5wIp5dehpgqk8W7VoSVospBkGDTHEIqtvaGV_mTIwxjcwrnnJROFDuCvj4wIbMr2b118Q_qmE9aEJnY6K9Z5KR9qdRLafpQ7Q4Uk2Ng9ATjmu_3gQtzOKP8m6QC_ylXDQQRVKhtKaD5sPcHe7cYqxX26tuiTv8Q64ZSYSzbPSrOL9RM786YMdOlgGIeY80o9FhKOqg-LCDY7Ca43qBTmQq2mIf-u_LW5zgtjmcNEy_p4zDkEXvAETYk"
               alt="AMS Logo" class="w-full h-full object-contain">
        </div>
        <h1 class="text-2xl font-bold text-enterprise-primary tracking-tight">AMS</h1>
        <p class="text-2xl font-bold text-enterprise-primary mt-1">Financial Governance</p>
      </div>

      <!-- Alert: errors, warnings, info from Keycloak (wrong password, account locked, etc.) -->
      <#if message?has_content>
        <div class="rounded-custom px-4 py-3 text-sm mb-5 flex items-start gap-2
          <#if message.type == 'error'>bg-red-50 text-red-700 border border-red-200
          <#elseif message.type == 'warning'>bg-yellow-50 text-yellow-700 border border-yellow-200
          <#elseif message.type == 'success'>bg-green-50 text-green-700 border border-green-200
          <#else>bg-blue-50 text-blue-700 border border-blue-200</#if>">
          <span>${message.summary}</span>
        </div>
      </#if>

      <!-- Login Form -->
      <form action="${url.loginAction}" class="space-y-5" method="POST">

        <!-- Email / Username Field -->
        <div class="space-y-1.5">
          <label class="text-xs font-semibold text-slate-600" for="username">Email</label>
          <div class="relative">
            <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-slate-400">
              <svg fill="none" height="16" stroke="currentColor" stroke-linecap="round"
                   stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="16"
                   xmlns="http://www.w3.org/2000/svg">
                <rect height="16" rx="2" width="20" x="2" y="4"></rect>
                <path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path>
              </svg>
            </span>
            <input
              class="block w-full pl-10 pr-3 py-2.5 border border-slate-300 rounded-custom text-sm focus:ring-1 focus:ring-enterprise-primary focus:border-enterprise-primary placeholder:text-slate-400 bg-slate-50/30"
              id="username"
              name="username"
              placeholder="name@company.com"
              type="email"
              value="${login.username!''}"
              autocomplete="email"
              autofocus
            >
          </div>
        </div>

        <!-- Password Field -->
        <div class="space-y-1.5">
          <div class="flex justify-between items-center">
            <label class="text-xs font-semibold text-slate-600" for="password">Password</label>
            <#if realm.resetPasswordAllowed>
              <a class="text-[11px] font-medium text-blue-600 hover:underline"
                 href="${url.loginResetCredentialsUrl}">Forgot Password?</a>
            </#if>
          </div>
          <div class="relative">
            <span class="absolute inset-y-0 left-0 pl-3 flex items-center text-slate-400">
              <svg fill="none" height="16" stroke="currentColor" stroke-linecap="round"
                   stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="16"
                   xmlns="http://www.w3.org/2000/svg">
                <rect height="11" rx="2" ry="2" width="18" x="3" y="11"></rect>
                <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
              </svg>
            </span>
            <input
              class="block w-full pl-10 pr-10 py-2.5 border border-slate-300 rounded-custom text-sm focus:ring-1 focus:ring-enterprise-primary focus:border-enterprise-primary placeholder:text-slate-400 bg-slate-50/30"
              id="password"
              name="password"
              placeholder="••••••••"
              type="password"
              autocomplete="current-password"
            >
            <button class="absolute inset-y-0 right-0 pr-3 flex items-center text-slate-400 hover:text-slate-600"
                    id="togglePassword" type="button" aria-label="Toggle password visibility">
              <svg fill="none" height="16" id="eyeIcon" stroke="currentColor" stroke-linecap="round"
                   stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="16"
                   xmlns="http://www.w3.org/2000/svg">
                <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"></path>
                <circle cx="12" cy="12" r="3"></circle>
              </svg>
            </button>
          </div>
        </div>

        <!-- Remember Me — only rendered if enabled in the Keycloak realm settings -->
        <#if realm.rememberMe>
          <div class="flex items-center">
            <input
              class="h-4 w-4 text-enterprise-primary focus:ring-enterprise-primary border-slate-300 rounded-custom"
              id="rememberMe"
              name="rememberMe"
              type="checkbox"
              <#if login.rememberMe?? && login.rememberMe>checked</#if>
            >
            <label class="ml-2 block text-xs font-medium text-slate-600" for="rememberMe">
              Remember this device
            </label>
          </div>
        </#if>

        <!-- Sign In Button -->
        <button
          class="w-full bg-black text-white py-3 px-4 rounded-custom text-lg font-semibold flex items-center justify-center gap-2 hover:bg-slate-900 transition-all"
          type="submit"
          name="login"
        >
          Sign In
          <svg fill="none" height="20" stroke="currentColor" stroke-linecap="round"
               stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="20"
               xmlns="http://www.w3.org/2000/svg">
            <path d="M5 12h14"></path>
            <path d="m12 5 7 7-7 7"></path>
          </svg>
        </button>

      </form>

    </div>
  </main>

  <!-- Footer -->
  <footer class="w-full bg-enterprise-bg border-t border-enterprise-border px-8 py-4 text-[11px] font-medium text-slate-500 flex justify-between items-center">
    <div class="flex gap-6">
      <span>© 2026 AMS</span>
      <a class="hover:text-enterprise-primary" href="#">Privacy Policy</a>
      <a class="hover:text-enterprise-primary" href="#">Terms of Service</a>
    </div>
    <div class="flex items-center gap-2">
      <svg fill="none" height="14" stroke="currentColor" stroke-linecap="round"
           stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" width="14"
           xmlns="http://www.w3.org/2000/svg">
        <circle cx="12" cy="12" r="10"></circle>
        <line x1="2" x2="22" y1="12" y2="12"></line>
        <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
      </svg>
      <span>EN-US | Global Instance</span>
    </div>
  </footer>

  <!-- Password Toggle Script -->
  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const passwordInput = document.getElementById('password');
      const toggleButton  = document.getElementById('togglePassword');
      const eyeIcon       = document.getElementById('eyeIcon');

      toggleButton.addEventListener('click', () => {
        const isPassword = passwordInput.getAttribute('type') === 'password';
        passwordInput.setAttribute('type', isPassword ? 'text' : 'password');

        if (isPassword) {
          // Eye-off icon
          eyeIcon.innerHTML = `
            <path d="M9.88 9.88a3 3 0 1 0 4.24 4.24"/>
            <path d="M10.73 5.08A10.43 10.43 0 0 1 12 5c7 0 10 7 10 7a13.16 13.16 0 0 1-1.67 2.68"/>
            <path d="M6.61 6.61A13.52 13.52 0 0 0 2 12s3 7 10 7a9.74 9.74 0 0 0 5.39-1.61"/>
            <line x1="2" y1="2" x2="22" y2="22"/>
          `;
        } else {
          // Eye icon
          eyeIcon.innerHTML = `
            <path d="M2 12s3-7 10-7 10 7 10 7-3 7-10 7-10-7-10-7Z"/>
            <circle cx="12" cy="12" r="3"/>
          `;
        }
      });
    });
  </script>

</body>
</html>
