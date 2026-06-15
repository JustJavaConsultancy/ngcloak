<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Just Java | Document Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&amp;family=JetBrains+Mono:wght@500&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">

    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              primary: "#b91c1c",
              "primary-container": "#dc2626",
              "on-primary": "#ffffff",
              secondary: "#b45a5a",
              "on-secondary": "#ffffff",
              background: "#fef6f5",
              "on-background": "#2d1a1a",
              surface: "#fef6f5",
              "on-surface": "#2d1a1a",
              "surface-variant": "#fde5e3",
              "on-surface-variant": "#5e3e3c",
              "surface-container-low": "#fff6f5",
              "surface-container": "#feeceb",
              "inverse-surface": "#2f1515",
              outline: "#b77e7a",
              "outline-variant": "#eccbc8",
            }
          }
        }
      }
    </script>

    <style>
        /* === AGGRESSIVE KEYCLOAK RESET === */
        html, body, #kc-page, .login-pf-page, #kc-content-wrapper, #kc-content, .card-pf, .login-pf {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            height: 100% !important;
            min-height: 100vh !important;
            background: transparent !important;
            overflow-x: hidden !important;
        }

        .login-pf-page-header,
        .login-pf-header,
        #kc-page-title,
        .kc-page-title,
        .login-pf-signup,
        .card-pf-title,
        .login-pf .container,
        .pf-c-page__header,
        .pf-c-brand,
        .pf-c-page {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        /* Force full takeover */
        #kc-content-wrapper {
            position: fixed !important;
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            bottom: 0 !important;
            z-index: 9999 !important;
        }

        /* Custom Layout */
        .custom-login-container {
            display: flex;
            width: 100vw;
            height: 100vh;
            min-height: 100vh;
        }

        /* Left Brand Panel - Crimson */
        .brand-section {
            flex: 1;
            background: radial-gradient(ellipse at 20% 30%, #3d1111, #1f0505);
            position: relative;
            overflow: hidden;
            color: white;
            padding: 4rem 3.5rem;
            display: none;
        }

        .brand-section::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: repeating-linear-gradient(45deg, #ff3a3a0c 0px, #ff3a3a0c 2px, transparent 2px, transparent 8px);
            pointer-events: none;
        }

        .brand-section > div {
            position: relative;
            z-index: 2;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* Right Login Panel */
        .login-section {
            flex: 1;
            background: linear-gradient(to bottom right, #fef6f5, #feeceb);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
        }

        .login-card {
            width: 100%;
            max-width: 440px;
        }

        .form-input {
            height: 52px;
            border: 1px solid #eccbc8;
            background: white;
        }

        .form-input:focus {
            border-color: #b91c1c;
            box-shadow: 0 0 0 4px rgba(185, 28, 28, 0.15);
            outline: none;
        }

        .login-button {
            height: 52px;
            background-color: #b91c1c;
            font-weight: 700;
            transition: all 0.2s;
        }

        .login-button:hover {
            background-color: #991b1b;
            transform: translateY(-1px);
        }

        .error-message {
            color: #b91c1c;
            font-size: 0.875rem;
            margin-top: 0.4rem;
        }

        /* Mobile */
        @media (max-width: 1024px) {
            .brand-section {
                display: none !important;
            }
            .custom-login-container {
                flex-direction: column;
            }
            .login-section {
                padding: 1.5rem 1rem;
            }
        }

        @media (min-width: 1025px) {
            .brand-section {
                display: flex !important;
            }
        }
    </style>
<#elseif section = "form">

<div class="custom-login-container">

    <!-- LEFT PANEL -->
    <section class="brand-section">
        <div>
            <div class="flex items-center gap-3 mb-8">
                <img src="${url.resourcesPath}/img/justjava-logo.svg" alt="Just Java" class="h-12">
                <span class="font-bold text-4xl tracking-tighter">JUST JAVA</span>
            </div>

            <div class="mb-12">
                <h2 class="text-4xl font-bold leading-tight">Document Management<br>System</h2>
                <p class="mt-4 text-red-100/90 text-lg">Secure. Organized. Enterprise-ready.</p>
            </div>

            <div class="flex-grow flex items-center justify-center">
                <div class="w-full max-w-md rounded-3xl overflow-hidden shadow-2xl relative">
                    <img src="https://images.unsplash.com/photo-1553413077-190dd305871c?w=900&q=85"
                         class="w-full h-96 object-cover" alt="DMS">
                    <div class="absolute inset-0 bg-gradient-to-t from-black/70 via-black/30 to-transparent"></div>
                </div>
            </div>

            <div class="mt-12 text-sm opacity-75">
                © 2025 Just Java Technologies
            </div>
        </div>
    </section>

    <!-- RIGHT PANEL -->
    <section class="login-section">
        <div class="login-card">

            <!-- Mobile Branding -->
            <div class="lg:hidden flex justify-center mb-10">
                <div class="flex items-center gap-3">
                    <img src="${url.resourcesPath}/img/justjava-logo.svg" alt="Just Java" class="h-10">
                    <span class="font-bold text-3xl tracking-tight text-primary">JUST JAVA</span>
                </div>
            </div>

            <header class="mb-10">
                <h1 class="text-4xl font-bold text-on-surface">Welcome back</h1>
                <p class="text-secondary mt-3">Sign in to your document vault</p>
            </header>

            <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-6">
                <div>
                    <label class="block text-sm font-medium mb-2 text-on-surface-variant" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                        <#else>${msg("email")}</#if>
                    </label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="text" id="username" name="username"
                               class="form-input w-full pl-11 rounded-2xl border border-outline-variant px-5"
                               value="${(login.username!'')}" placeholder="name@company.com" required>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div>
                    <div class="flex justify-between mb-2">
                        <label class="block text-sm font-medium text-on-surface-variant" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}" class="text-primary hover:underline text-sm">Forgot password?</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="password" id="password" name="password"
                               class="form-input w-full pl-11 pr-12 rounded-2xl border border-outline-variant px-5"
                               placeholder="••••••••" required>
                        <button type="button" id="togglePassword" class="absolute right-4 top-1/2 -translate-y-1/2 text-gray-500 hover:text-primary">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" id="submit-btn"
                        class="login-button w-full rounded-2xl text-white flex items-center justify-center gap-3 text-base">
                    <span id="btn-text">Sign In</span>
                    <span id="btn-loader" class="hidden w-5 h-5 border-2 border-white border-t-transparent rounded-full animate-spin"></span>
                </button>
            </form>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <p class="text-center mt-8 text-sm">
                    Don't have an account?
                    <a href="${url.registrationUrl}" class="text-primary font-medium hover:underline">Sign up</a>
                </p>
            </#if>
        </div>
    </section>
</div>

<script>
    // Password toggle
    document.getElementById("togglePassword").addEventListener("click", function() {
        const pwd = document.getElementById("password");
        if (pwd.type === "password") {
            pwd.type = "text";
            this.innerHTML = '<i class="fas fa-eye-slash"></i>';
        } else {
            pwd.type = "password";
            this.innerHTML = '<i class="fas fa-eye"></i>';
        }
    });

    // Loading state
    document.getElementById("kc-form-login").addEventListener("submit", function() {
        const btn = document.getElementById("submit-btn");
        document.getElementById("btn-text").classList.add("hidden");
        document.getElementById("btn-loader").classList.remove("hidden");
        btn.disabled = true;
    });

    // Auto focus
    window.addEventListener("load", () => {
        document.getElementById("username").focus();
    });
</script>

</#if>
</@layout.registrationLayout>