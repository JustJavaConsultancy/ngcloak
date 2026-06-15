<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Just Java DMS · Institutional Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&family=JetBrains+Mono:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    <script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            colors: {
              "primary": "#b91c1c",
              "primary-container": "#dc2626",
              "on-primary": "#ffffff",
              "on-primary-container": "#ffefef",
              "primary-fixed": "#ffdad8",
              "primary-fixed-dim": "#faa8a2",
              "surface-tint": "#c62828",
              "secondary": "#b45a5a",
              "on-secondary": "#ffffff",
              "secondary-container": "#ffe3e3",
              "on-secondary-container": "#6e2e2e",
              "secondary-fixed": "#ffdbd9",
              "secondary-fixed-dim": "#efb0ae",
              "tertiary": "#d32f2f",
              "on-tertiary": "#ffffff",
              "tertiary-container": "#ffcdcd",
              "on-tertiary-container": "#6e0000",
              "tertiary-fixed": "#ffdad8",
              "tertiary-fixed-dim": "#fbb5b0",
              "error": "#c62828",
              "error-container": "#ffd6d6",
              "on-error": "#ffffff",
              "on-error-container": "#8b0000",
              "background": "#fef6f5",
              "on-background": "#2d1a1a",
              "surface": "#fef6f5",
              "on-surface": "#2d1a1a",
              "surface-variant": "#fde5e3",
              "on-surface-variant": "#5e3e3c",
              "surface-container-lowest": "#ffffff",
              "surface-container-low": "#fff6f5",
              "surface-container": "#feeceb",
              "surface-container-high": "#fde2e0",
              "surface-container-highest": "#fcd8d6",
              "surface-dim": "#efdad8",
              "surface-bright": "#fef6f5",
              "inverse-surface": "#2f1515",
              "inverse-on-surface": "#ffefef",
              "inverse-primary": "#ffb4ab",
              "outline": "#b77e7a",
              "outline-variant": "#eccbc8",
              "on-primary-fixed": "#410006",
              "on-primary-fixed-variant": "#930019",
              "on-secondary-fixed": "#2e1515",
              "on-secondary-fixed-variant": "#5e2e2e",
              "on-tertiary-fixed": "#410006",
              "on-tertiary-fixed-variant": "#8f0f1e",
            },
            borderRadius: {
              DEFAULT: "0.25rem",
              lg: "10px",
              xl: "12px",
              full: "9999px"
            },
            fontFamily: {
              "body-md": ["Inter"],
              "section-headline": ["Inter"],
              "hero-display": ["Inter"],
              "asset-code": ["JetBrains Mono"],
              "label-sm": ["Inter"]
            },
            fontSize: {
              "body-md": ["16px", {"lineHeight": "1.6", "fontWeight": "400"}],
              "section-headline": ["42px", {"lineHeight": "1.3", "fontWeight": "700"}],
              "body-lg": ["18px", {"lineHeight": "1.6", "fontWeight": "400"}],
              "hero-display": ["64px", {"lineHeight": "1.1", "letterSpacing": "-0.02em", "fontWeight": "800"}],
              "asset-code": ["14px", {"lineHeight": "1.4", "letterSpacing": "0.05em", "fontWeight": "500"}],
              "label-sm": ["12px", {"lineHeight": "1.2", "fontWeight": "600"}]
            }
          }
        }
      }
    </script>
    <style>
        /* Hide ALL default Keycloak chrome */
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .kc-page-title,
        .login-pf-signup,
        .card-pf-title,
        .login-pf-page .card-pf .card-pf-title,
        #kc-header,
        .kc-header,
        #kc-content-wrapper > .row,
        .login-pf-page .card-pf {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        .login-pf-page {
            padding: 0 !important;
            margin: 0 !important;
            background: none !important;
        }

        #kc-content {
            padding: 0 !important;
            margin: 0 !important;
        }

        #kc-content-wrapper {
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
            background: transparent !important;
            overflow: visible !important;
        }

        body, html {
            background-color: #fef6f5 !important;
            font-family: 'Inter', sans-serif;
        }

        /* animation */
        @keyframes fadeUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-fade-up { animation: fadeUp 0.8s cubic-bezier(0.16, 1, 0.3, 1) forwards; }

        .red-pattern-dots {
            background-image: radial-gradient(rgba(185, 28, 28, 0.04) 1.2px, transparent 1.2px);
            background-size: 24px 24px;
        }

        .custom-checkbox:checked {
            background-color: #b91c1c;
            border-color: #b91c1c;
        }

        .loader-dots span {
            animation: blink 1.4s infinite both;
        }
        .loader-dots span:nth-child(2) { animation-delay: 0.2s; }
        .loader-dots span:nth-child(3) { animation-delay: 0.4s; }
        @keyframes blink {
            0%, 100% { opacity: 0.2; }
            20% { opacity: 1; }
        }
    </style>
<#elseif section = "form">

<main class="flex min-h-screen red-pattern-dots">
    <!-- LEFT PANEL: Crimson/Dark Red Immersive (hidden on mobile) -->
    <section class="hidden lg:flex flex-col w-1/2 relative overflow-hidden p-margin-desktop" style="background: radial-gradient(ellipse at 20% 30%, #3d1111, #1f0505); box-shadow: inset 0 0 0 1000px rgba(0,0,0,0.15);">
        <div class="absolute inset-0 opacity-20 pointer-events-none" style="background-image: repeating-linear-gradient(45deg, #ff3a3a0c 0px, #ff3a3a0c 2px, transparent 2px, transparent 8px);"></div>

        <div class="relative z-10 flex flex-col h-full justify-between">
            <!-- Branding -->
            <div class="flex flex-col gap-1">
                <div class="flex items-center gap-3">
                    <span class="font-hero-display text-white font-black text-[32px] tracking-tighter drop-shadow-md">Just Java DMS</span>
                    <div class="h-6 w-[1px] bg-red-400/40"></div>
                    <span class="font-asset-code text-red-200/70 text-[10px] tracking-widest uppercase">Document Management</span>
                </div>
                <span class="font-label-sm text-red-300/50 tracking-wider">by JustJava Technologies</span>
            </div>

            <!-- Central Image Overlay -->
            <div class="flex-grow flex items-center justify-center py-8">
                <div class="w-full rounded-2xl overflow-hidden relative shadow-2xl shadow-black/30" style="height: 420px;">
                    <img src="https://images.unsplash.com/photo-1553413077-190dd305871c?w=900&q=85" alt="Secure document management" class="w-full h-full object-cover" onerror="this.src='https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=900&q=85'">
                    <div class="absolute inset-0" style="background: linear-gradient(to top, #3b0a0aee 0%, #9e2a2a66 50%, #b91c1c33 100%); mix-blend-mode: multiply;"></div>
                    <div class="absolute inset-0" style="background: radial-gradient(transparent 30%, rgba(90, 0, 0, 0.4));"></div>
                    <div class="absolute bottom-0 left-0 right-0 p-5">
                        <p class="font-asset-code text-red-200/80 text-[10px] tracking-widest uppercase mb-1.5">Zero-trust · Enterprise Ready</p>
                        <p class="text-white font-semibold text-[15px] leading-snug drop-shadow-md">Secure, scalable, and compliant document orchestration.</p>
                    </div>
                </div>
            </div>

            <!-- Feature Teasers (red-themed) -->
            <div class="max-w-[440px] animate-fade-up" style="animation-delay: 200ms;">
                <div class="grid grid-cols-2 gap-4 text-white/80">
                    <div class="flex items-center gap-2"><span class="material-symbols-outlined text-red-300 text-xl">shield_lock</span><span class="text-sm font-medium">Encrypted Vault</span></div>
                    <div class="flex items-center gap-2"><span class="material-symbols-outlined text-red-300 text-xl">search</span><span class="text-sm font-medium">Advanced Discovery</span></div>
                    <div class="flex items-center gap-2"><span class="material-symbols-outlined text-red-300 text-xl">inventory_2</span><span class="text-sm font-medium">Smart Tagging</span></div>
                    <div class="flex items-center gap-2"><span class="material-symbols-outlined text-red-300 text-xl">trending_up</span><span class="text-sm font-medium">Scalable</span></div>
                </div>
            </div>
            <div class="mt-4 text-red-200/40 text-[10px] font-asset-code">© 2025 Just Java. All rights reserved.</div>
        </div>
    </section>

    <!-- RIGHT PANEL: Login Form (Red-theme, no flip, standard forgot password link) -->
    <section class="w-full lg:w-1/2 flex flex-col justify-center items-center px-6 md:px-12 py-12 relative bg-gradient-to-br from-background via-surface-container-low to-background">
        <div class="max-w-[420px] w-full animate-fade-up">
            <!-- Mobile Branding -->
            <div class="lg:hidden mb-12 flex justify-center">
                <div class="flex flex-col items-center gap-2">
                    <span class="font-hero-display text-primary font-black text-[40px] tracking-tighter">Just Java</span>
                    <span class="font-label-sm text-secondary tracking-widest uppercase text-[10px]">Document Management System</span>
                </div>
            </div>

            <!-- error alert (global) -->
            <#if message?has_content && message.type = 'error' && !messagesPerField.existsError('username','password')>
                <div class="mb-6 p-3 rounded-lg bg-error-container text-on-error-container text-sm border-l-4 border-error flex items-start gap-2">
                    <span class="material-symbols-outlined text-error text-base">error</span>
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <div>
                <header class="mb-10">
                    <h1 class="font-section-headline text-[32px] text-on-surface mb-2">Secure Access</h1>
                    <p class="text-secondary text-body-md">Sign in to your <span class="text-primary font-semibold">Just Java DMS</span> workspace.</p>
                </header>

                <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-6">
                    <div>
                        <label class="block font-label-sm text-on-surface-variant mb-2" for="username">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <input type="text" id="username" name="username"
                               class="w-full h-[52px] rounded-lg border border-outline-variant px-4 bg-white focus:outline-none focus:ring-2 focus:ring-primary/30 focus:border-primary transition-all font-body-md text-on-surface"
                               value="${(login.username!'')}" placeholder="name@company.com" autocomplete="username" required />
                        <#if messagesPerField.existsError('username','password')>
                            <div class="mt-1 text-sm text-error flex items-center gap-1">
                                <span class="material-symbols-outlined text-base">warning</span>
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <div class="relative">
                        <div class="flex justify-between items-end mb-2">
                            <label class="font-label-sm text-on-surface-variant" for="password">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-primary font-label-sm hover:underline hover:text-red-700 transition">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <input type="password" id="password" name="password"
                                   class="w-full h-[52px] rounded-lg border border-outline-variant px-4 bg-white focus:outline-none focus:ring-2 focus:ring-primary/30 focus:border-primary transition-all font-body-md text-on-surface"
                                   placeholder="••••••••" autocomplete="current-password" required />
                            <button type="button" class="absolute right-4 top-1/2 -translate-y-1/2 text-secondary hover:text-primary transition-colors" onclick="togglePassword()">
                                <span class="material-symbols-outlined text-[20px]" id="eye-icon">visibility</span>
                            </button>
                        </div>
                    </div>

                    <#if realm.rememberMe>
                        <div class="flex items-center gap-3">
                            <input type="checkbox" id="rememberMe" name="rememberMe" class="custom-checkbox w-5 h-5 rounded border-outline-variant text-primary focus:ring-primary focus:ring-1" <#if login.rememberMe??>checked</#if>>
                            <label class="font-body-md text-secondary select-none" for="rememberMe">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <input type="hidden" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />

                    <button type="submit" id="submit-btn" class="w-full h-[52px] bg-primary text-white font-bold rounded-lg shadow-md hover:bg-red-800 transition-all active:scale-[0.98] flex items-center justify-center gap-2 overflow-hidden focus:ring-2 focus:ring-red-300">
                        <span id="btn-text">${msg("doLogIn")} →</span>
                        <div class="hidden loader-dots flex gap-1" id="btn-loader">
                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                        </div>
                    </button>
                </form>

                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div class="mt-8 text-center border-t border-red-200/40 pt-6">
                        <p class="text-secondary font-body-md">${msg("noAccount")} <a href="${url.registrationUrl}" class="text-primary font-bold hover:underline">${msg("doRegister")}</a></p>
                    </div>
                </#if>

                <div class="mt-6 p-4 rounded-lg bg-primary/5 border-l-4 border-primary text-sm text-secondary">
                    <div class="flex items-start gap-2">
                        <span class="material-symbols-outlined text-primary text-sm">info</span>
                        <span>This system is protected by advanced security measures. Your data is encrypted and audited.</span>
                    </div>
                </div>
            </div>
        </div>

        <footer class="absolute bottom-6 w-full px-6 md:px-12 flex flex-col md:flex-row justify-between items-center text-[11px] font-asset-code text-secondary/80 tracking-tight">
            <p>© 2025 Just Java · Crimson Secure Edition</p>
            <div class="flex gap-4 mt-2 md:mt-0">
                <a href="#" class="hover:text-primary transition-colors">PRIVACY</a>
                <a href="#" class="hover:text-primary transition-colors">SECURITY</a>
                <a href="#" class="hover:text-primary transition-colors">COMPLIANCE</a>
            </div>
        </footer>
    </section>
</main>

<script>
    function togglePassword() {
        const pwdField = document.getElementById('password');
        const eyeIcon = document.getElementById('eye-icon');
        if (pwdField.type === 'password') {
            pwdField.type = 'text';
            eyeIcon.textContent = 'visibility_off';
        } else {
            pwdField.type = 'password';
            eyeIcon.textContent = 'visibility';
        }
    }

    // loader effect on submit without breaking actual form submission
    const loginForm = document.getElementById('kc-form-login');
    const submitBtn = document.getElementById('submit-btn');
    const btnText = document.getElementById('btn-text');
    const btnLoader = document.getElementById('btn-loader');

    if (loginForm) {
        loginForm.addEventListener('submit', function() {
            btnText.classList.add('hidden');
            btnLoader.classList.remove('hidden');
            submitBtn.disabled = true;
            submitBtn.classList.add('opacity-80', 'cursor-not-allowed');
            // form submits naturally — browser will navigate
        });
    }

    // auto-focus
    window.addEventListener('load', function() {
        const usernameField = document.getElementById('username');
        if (usernameField && !usernameField.value) {
            usernameField.focus();
        }
    });
</script>

</#if>
</@layout.registrationLayout>