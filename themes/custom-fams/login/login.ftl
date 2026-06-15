<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Just Java | Document Management System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- Tailwind + Fonts -->
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
              "on-primary-container": "#ffefef",
              secondary: "#b45a5a",
              "on-secondary": "#ffffff",
              "secondary-container": "#ffe3e3",
              "on-secondary-container": "#6e2e2e",
              background: "#fef6f5",
              "on-background": "#2d1a1a",
              surface: "#fef6f5",
              "on-surface": "#2d1a1a",
              "surface-variant": "#fde5e3",
              "on-surface-variant": "#5e3e3c",
              "surface-container-low": "#fff6f5",
              "surface-container": "#feeceb",
              "inverse-surface": "#2f1515",
              "inverse-on-surface": "#ffefef",
              outline: "#b77e7a",
              "outline-variant": "#eccbc8",
            },
            borderRadius: {
              DEFAULT: "0.25rem",
              lg: "10px",
              xl: "12px",
              full: "9999px"
            },
            fontFamily: {
              body: ["Inter"],
              mono: ["JetBrains Mono"]
            }
          }
        }
      }
    </script>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@500&display=swap');

        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-up { animation: fadeUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards; }

        .red-glow-overlay {
            background: linear-gradient(145deg, rgba(110, 0, 0, 0.45) 0%, rgba(45, 10, 10, 0.85) 90%);
        }

        .red-pattern-dots {
            background-image: radial-gradient(rgba(185, 28, 28, 0.04) 1.2px, transparent 1.2px);
            background-size: 24px 24px;
        }

        /* Aggressive hiding of default Keycloak elements */
        .login-pf-page-header, .login-pf-header, h1#kc-page-title, .login-pf-signup,
        #kc-page-title, .kc-page-title, .login-pf .container, .card-pf-title {
            display: none !important;
        }

        .login-pf-page, #kc-content-wrapper, #kc-content {
            padding: 0 !important;
            margin: 0 !important;
            background: none !important;
            min-height: 100vh !important;
        }

        .custom-login-container {
            display: flex;
            min-height: 100vh;
            width: 100%;
        }

        /* Left Brand Panel - Crimson Theme */
        .brand-section {
            flex: 1;
            background: radial-gradient(ellipse at 20% 30%, #3d1111, #1f0505);
            position: relative;
            overflow: hidden;
            color: white;
            display: none;
            lg:flex: flex-col;
            padding: 4rem 3.5rem;
            justify-content: space-between;
        }

        .brand-section::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: repeating-linear-gradient(45deg, #ff3a3a0c 0px, #ff3a3a0c 2px, transparent 2px, transparent 8px);
            opacity: 0.6;
            pointer-events: none;
        }

        .logo-container {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo {
            height: 48px;
            width: auto;
        }

        .tagline {
            font-size: 2.25rem;
            font-weight: 800;
            line-height: 1.1;
            letter-spacing: -0.02em;
            margin-top: 1rem;
        }

        .system-description p {
            opacity: 0.9;
            font-size: 1.1rem;
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
            max-width: 420px;
            width: 100%;
            animation: fadeUp 0.8s ease forwards;
        }

        .form-input {
            height: 52px;
            border: 1px solid #eccbc8;
            background: white;
            transition: all 0.2s;
        }

        .form-input:focus {
            border-color: #b91c1c;
            box-shadow: 0 0 0 3px rgba(185, 28, 28, 0.15);
            outline: none;
        }

        .login-button {
            height: 52px;
            background: #b91c1c;
            font-weight: 700;
        }

        .login-button:hover {
            background: #991b1b;
        }

        /* Mobile */
        @media (max-width: 1024px) {
            .brand-section {
                display: none;
            }
            .login-section {
                padding: 1.5rem;
            }
            .mobile-brand {
                display: flex;
            }
        }

        .error-message {
            color: #991b1b;
            font-size: 0.875rem;
            margin-top: 0.35rem;
        }
    </style>
<#elseif section = "form">
<div class="custom-login-container">

    <!-- LEFT PANEL (Desktop) -->
    <section class="brand-section hidden lg:flex">
        <div class="relative z-10 flex flex-col h-full justify-between">
            <div class="flex flex-col gap-1">
                <div class="flex items-center gap-3">
                    <img src="${url.resourcesPath}/img/justjava-logo.svg" alt="Just Java Logo" class="logo">
                    <span class="font-bold text-4xl tracking-tighter">JUST JAVA</span>
                </div>
                <span class="text-red-200/70 text-sm tracking-widest uppercase font-mono">Document Management System</span>
            </div>

            <div class="flex-grow flex items-center justify-center py-8">
                <div class="w-full max-w-md rounded-2xl overflow-hidden relative shadow-2xl">
                    <img src="https://images.unsplash.com/photo-1553413077-190dd305871c?w=900&q=85"
                         alt="Document Management"
                         class="w-full h-[380px] object-cover"
                         onerror="this.src='https://picsum.photos/id/1015/900/600'">
                    <div class="absolute inset-0 bg-gradient-to-t from-[#3b0a0aee] via-[#9e2a2a66] to-transparent mix-blend-multiply"></div>
                    <div class="absolute bottom-0 left-0 right-0 p-6 text-white">
                        <p class="uppercase text-xs tracking-widest text-red-200 mb-1">Secure • Scalable • Compliant</p>
                        <p class="font-semibold text-lg">Centralized document control with enterprise-grade security.</p>
                    </div>
                </div>
            </div>

            <div class="text-sm opacity-75">
                © 2025 Just Java Technologies. All rights reserved.
            </div>
        </div>
    </section>

    <!-- RIGHT PANEL -->
    <section class="login-section w-full lg:w-1/2 red-pattern-dots">
        <div class="login-card">

            <!-- Mobile Header -->
            <div class="lg:hidden mb-10 flex justify-center">
                <div class="flex flex-col items-center">
                    <div class="flex items-center gap-3">
                        <img src="${url.resourcesPath}/img/justjava-logo.svg" alt="Just Java" class="h-10">
                        <span class="font-bold text-3xl tracking-tight text-primary">JUST JAVA</span>
                    </div>
                    <span class="text-xs tracking-widest text-secondary mt-1">DOCUMENT MANAGEMENT</span>
                </div>
            </div>

            <header class="mb-10 text-center lg:text-left">
                <h1 class="text-4xl font-bold text-on-surface tracking-tight">Welcome back.</h1>
                <p class="text-secondary mt-2 text-lg">Sign in to access your secure document vault.</p>
            </header>

            <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-6">
                <div>
                    <label class="block text-sm font-medium text-on-surface-variant mb-2" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                        <#else>${msg("email")}</#if>
                    </label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input
                            type="text"
                            id="username"
                            name="username"
                            class="form-input w-full pl-11 rounded-xl border border-outline-variant px-4 text-on-surface"
                            value="${(login.username!'')}"
                            placeholder="name@company.com"
                            required
                            aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                    </#if>
                </div>

                <div>
                    <div class="flex justify-between items-end mb-2">
                        <label class="block text-sm font-medium text-on-surface-variant" for="password">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}" class="text-primary hover:underline text-sm font-medium">Forgot password?</a>
                        </#if>
                    </div>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-4 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input
                            type="password"
                            id="password"
                            name="password"
                            class="form-input w-full pl-11 pr-12 rounded-xl border border-outline-variant px-4 text-on-surface"
                            placeholder="••••••••"
                            required
                        />
                        <button type="button" id="togglePassword"
                                class="absolute right-4 top-1/2 -translate-y-1/2 text-secondary hover:text-primary">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>

                <button type="submit" id="submit-btn"
                        class="login-button w-full rounded-xl text-white flex items-center justify-center gap-2 text-base font-semibold shadow-md hover:shadow-lg transition-all active:scale-[0.985]">
                    <span id="btn-text">Sign In</span>
                    <span id="btn-loader" class="hidden animate-spin h-4 w-4 border-2 border-white border-t-transparent rounded-full"></span>
                </button>
            </form>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center mt-8 text-sm">
                    Don't have an account?
                    <a href="${url.registrationUrl}" class="text-primary font-semibold hover:underline">Sign up</a>
                </div>
            </#if>

            <div class="mt-10 pt-6 border-t border-red-200/60 text-center text-xs text-on-surface-variant">
                This system uses enterprise-grade encryption. Unauthorized access is prohibited.
            </div>
        </div>
    </section>
</div>

<script>
    // Password toggle
    const toggleBtn = document.getElementById("togglePassword");
    const pwdField = document.getElementById("password");

    toggleBtn.addEventListener("click", () => {
        if (pwdField.type === "password") {
            pwdField.type = "text";
            toggleBtn.innerHTML = '<i class="fas fa-eye-slash"></i>';
        } else {
            pwdField.type = "password";
            toggleBtn.innerHTML = '<i class="fas fa-eye"></i>';
        }
    });

    // Submit loading state
    document.getElementById("kc-form-login").addEventListener("submit", function() {
        const btn = document.getElementById("submit-btn");
        const text = document.getElementById("btn-text");
        const loader = document.getElementById("btn-loader");

        text.classList.add("hidden");
        loader.classList.remove("hidden");
        btn.disabled = true;
    });

    // Tailwind script already loaded in header
    window.addEventListener("load", () => {
        document.getElementById("username").focus();
    });
</script>
</#if>
</@layout.registrationLayout>