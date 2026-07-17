<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>JustJava FAMS | Fixed Asset Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Fonts + Material Symbols -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@400;500;600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>


    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary": "#98001a",
              "brand-primary-dark": "#8F0F1E",
              "primary-container": "#c0182a",
              "on-primary": "#ffffff",
              "secondary": "#5d5e65",
              "on-secondary": "#ffffff",
              "error": "#ba1a1a",
              "error-container": "#ffdad6",
              "on-error": "#ffffff",
              "background": "#F4F5F7",
              "surface-canvas": "#F4F5F7",
              "surface-card": "#FFFFFF",
              "surface-variant": "#dde2f5",
              "on-surface": "#151b29",
              "on-surface-variant": "#5b403e",
              "border-default": "#E4E6EA",
              "border-strong": "#CBD0D8",
              "status-success": "#1A7A4A",
              "status-warning": "#A05C00",
              "status-info": "#1558A8",
            },
            fontFamily: {
              "technical-data": ["JetBrains Mono", "monospace"],
              "body-default": ["Inter", "sans-serif"],
              "page-title": ["Inter", "sans-serif"],
              "card-header": ["Inter", "sans-serif"],
              "section-header": ["Inter", "sans-serif"],
            },
            fontSize: {
              "technical-data": ["12px", { lineHeight: "16px", fontWeight: "400" }],
              "body-default": ["13px", { lineHeight: "18px", fontWeight: "400" }],
              "page-title": ["28px", { lineHeight: "36px", letterSpacing: "-0.02em", fontWeight: "600" }],
              "card-header": ["15px", { lineHeight: "20px", fontWeight: "500" }],
              "section-header": ["18px", { lineHeight: "24px", fontWeight: "500" }],
            },
            borderRadius: {
              xl: "0.75rem",
              "2xl": "1rem",
            },
            spacing: {
              "container-padding": "1.25rem",
            }
          }
        }
      }
    </script>

    <style>
        /* === Keycloak Overrides – keep functionality but allow our layout === */
        html, body, #kc-page, .login-pf-page, #kc-content-wrapper, #kc-content, .card-pf, .login-pf {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            height: 100% !important;
            min-height: 100vh !important;
            background: transparent !important;
            overflow-x: hidden !important;
        }

        .login-pf-page-header, .login-pf-header, #kc-page-title, .kc-page-title,
        .login-pf-signup, .card-pf-title, .login-pf .container {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
        }

        #kc-content-wrapper {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            z-index: 9999 !important;
            overflow-y: auto !important;
        }

        /* Custom login container – matches dashboard layout */
        .custom-login-container {
            display: flex;
            min-height: 100vh;
            width: 100%;
            background-color: #F4F5F7;
        }

        /* Left Brand Panel – JustJava branded */
        .brand-section {
            flex: 1;
            background: linear-gradient(135deg, #1a0508 0%, #2c0a0f 100%);
            position: relative;
            overflow: hidden;
            color: white;
            padding: 3rem 2.5rem;
            display: none;
        }
        .brand-section::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: repeating-linear-gradient(45deg, #98001a15 0px, #98001a15 2px, transparent 2px, transparent 8px);
            pointer-events: none;
        }
        .brand-section > div {
            position: relative;
            z-index: 2;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        /* Right Login Panel – uses dashboard surface colour */
        .login-section {
            flex: 1;
            background: #F4F5F7;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            min-height: 100vh;
        }

        /* Login container – flat, no card styling */
        .login-container {
            width: 100%;
            max-width: 400px;
        }

        /* Form inputs – match dashboard height and styling */
        .form-input {
            height: 48px;
            border: 1px solid #E4E6EA;
            background: #FFFFFF;
            font-size: 0.875rem;
            border-radius: 0.5rem;
            transition: all 0.2s;
        }
        .form-input:focus {
            border-color: #98001a;
            box-shadow: 0 0 0 3px rgba(152, 0, 26, 0.15);
            outline: none;
            background: white;
        }

        .login-button {
            height: 48px;
            background-color: #98001a;
            font-weight: 600;
            border-radius: 0.5rem;
            transition: background 0.2s;
        }
        .login-button:hover {
            background-color: #8F0F1E;
        }

        .error-message {
            color: #ba1a1a;
            font-size: 0.75rem;
            margin-top: 0.5rem;
        }

        /* Mobile */
        @media (max-width: 1024px) {
            .brand-section { display: none !important; }
            .custom-login-container { flex-direction: column; }
            .login-section { padding: 1.5rem; min-height: auto; }
            .login-container { max-width: 100%; }
        }
        @media (min-width: 1025px) {
            .brand-section { display: flex !important; }
        }
    </style>
<#elseif section = "form">

<div class="custom-login-container">

    <!-- LEFT PANEL – JustJava FAMS branding -->
    <section class="brand-section">
        <div>
            <div class="mb-12">
                <div class="flex items-center gap-3">
                    <span class="material-symbols-outlined text-4xl text-white/90" style="font-variation-settings:'FILL'1;">inventory_2</span>
                    <span class="font-bold text-3xl tracking-tight">FAMS</span>
                </div>
                <span class="block text-white/60 text-xs tracking-[3px] uppercase font-technical-data mt-2">FIXED ASSET MANAGEMENT SYSTEM</span>
            </div>

            <div class="mb-12">
                <h2 class="text-3xl font-bold leading-tight">Full Lifecycle<br>Asset Control</h2>
                <p class="mt-4 text-white/80 text-base">Enterprise-grade tracking, depreciation, audit trails, and maintenance scheduling – all in one platform.</p>
            </div>

            <div class="flex-1 flex items-center justify-center py-8">
                <div class="w-full max-w-md rounded-2xl overflow-hidden shadow-2xl relative bg-white/5 backdrop-blur-sm border border-white/10">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/40 via-transparent to-transparent"></div>
                    <div class="absolute bottom-5 left-5 text-white/80">
                        <p class="text-xs uppercase tracking-wider font-technical-data">Real-time Asset Dashboard</p>
                    </div>
                </div>
            </div>

            <div class="text-xs text-white/40 mt-auto">
                © 2026 JustJava Technologies • All rights reserved
            </div>
        </div>
    </section>

    <!-- RIGHT PANEL – FLAT LOGIN FORM (no card background, border, or shadow) -->
    <section class="login-section">
        <div class="login-container">

            <!-- Mobile Branding (visible only on small screens) -->
            <div class="lg:hidden flex justify-center mb-8">
                <div class="text-center">
                    <div class="flex items-center justify-center gap-2">
                        <span class="material-symbols-outlined text-3xl text-primary" style="font-variation-settings:'FILL'1;">inventory_2</span>
                        <span class="font-bold text-2xl tracking-tight text-on-surface">FAMS</span>
                    </div>
                    <span class="block text-secondary text-[10px] tracking-widest uppercase font-technical-data mt-1">FIXED ASSET MANAGEMENT</span>
                </div>
            </div>

            <header class="mb-8 text-center lg:text-left">
                <h1 class="font-page-title text-page-title text-on-surface tracking-tight">Welcome back</h1>
                <p class="text-body-default text-secondary mt-2">Sign in to manage your organization's assets</p>
            </header>

            <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-5">
                <div>
                    <label class="block text-label-small font-label-small mb-1.5 text-secondary" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                        <#else>${msg("email")}</#if>
                    </label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-3 top-1/2 -translate-y-1/2 text-secondary text-sm"></i>
                        <input type="text" id="username" name="username"
                               class="form-input w-full pl-10 pr-3"
                               value="${(login.username!'')}" placeholder="name@justjava.com" required>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div>
                    <div class="flex justify-between mb-1.5">
                        <label class="block text-label-small font-label-small text-secondary" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}" class="text-primary hover:underline text-label-small">Forgot password?</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-3 top-1/2 -translate-y-1/2 text-secondary text-sm"></i>
                        <input type="password" id="password" name="password"
                               class="form-input w-full pl-10 pr-10"
                               placeholder="••••••••" required>
                        <button type="button" id="togglePassword" class="absolute right-3 top-1/2 -translate-y-1/2 text-secondary hover:text-primary transition-colors">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" id="submit-btn"
                        class="login-button w-full text-white font-body-medium flex items-center justify-center gap-2 mt-6">
                    <span id="btn-text">Sign In</span>
                    <span id="btn-loader" class="hidden w-4 h-4 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
                </button>
            </form>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <p class="text-center mt-6 text-label-small text-secondary">
                    Need access? Contact your system administrator.
                </p>
            </#if>

            <div class="mt-8 text-center text-label-small text-secondary/70">
                Secure access to JustJava FAMS
            </div>
        </div>
    </section>
</div>

<script>
    // Password toggle
    const toggleBtn = document.getElementById("togglePassword");
    const pwdField = document.getElementById("password");
    if (toggleBtn) {
        toggleBtn.addEventListener("click", function() {
            if (pwdField.type === "password") {
                pwdField.type = "text";
                this.innerHTML = '<i class="fas fa-eye-slash"></i>';
            } else {
                pwdField.type = "password";
                this.innerHTML = '<i class="fas fa-eye"></i>';
            }
        });
    }

    // Loading state on submit
    const loginForm = document.getElementById("kc-form-login");
    if (loginForm) {
        loginForm.addEventListener("submit", function() {
            const btn = document.getElementById("submit-btn");
            document.getElementById("btn-text").classList.add("hidden");
            document.getElementById("btn-loader").classList.remove("hidden");
            btn.disabled = true;
        });
    }

    // Auto-focus username field
    window.addEventListener("load", () => {
        const usernameField = document.getElementById("username");
        if (usernameField) usernameField.focus();
    });
</script>
</#if>
</@layout.registrationLayout>