<#import "template.ftl" as layout>

<@layout.registrationLayout
    displayMessage=!messagesPerField.existsError('username','password')
    displayInfo=realm.password && realm.registrationAllowed && (!registrationDisabled!false)
    ; section
>

    <#-- ============================================================ -->
    <#-- HEADER: all meta, fonts, Tailwind, custom styles go here   -->
    <#-- ============================================================ -->
    <#if section = "header">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAMS | Crimson Vault · Institutional Login</title>

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
                            "outline-variant": "#eccbc8"
                        },
                        borderRadius: {
                            DEFAULT: "0.25rem",
                            lg: "10px",
                            xl: "12px",
                            full: "9999px"
                        },
                        spacing: {
                            "margin-desktop": "64px",
                            "gutter": "24px",
                            "margin-mobile": "16px",
                            "navbar-height": "72px",
                            "section-padding": "80px"
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

        <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">

        <style>
            /* Override Keycloak default chrome */
            .login-pf-header,
            .login-pf-page-header,
            #kc-header,
            #kc-header-wrapper { display: none !important; }
            .login-pf-page { padding-top: 0 !important; }
            html, body {
                margin: 0;
                padding: 0;
                overflow-x: hidden;
                background: #fef6f5;
            }
        </style>
    </#if>

    <#-- ============================================================ -->
    <#-- FORM SECTION: main UI (left panel + right panel)            -->
    <#-- ============================================================ -->
    <#if section = "form">
        <main class="flex min-h-screen red-pattern-dots">

            <!-- LEFT PANEL (desktop only) -->
            <section class="hidden lg:flex flex-col w-1/2 relative overflow-hidden p-margin-desktop left-panel">
                <div class="absolute inset-0 opacity-20 pointer-events-none hatch-overlay"></div>
                <div class="relative z-10 flex flex-col h-full justify-between">
                    <div class="flex flex-col gap-1">
                        <div class="flex items-center gap-3">
                            <span class="font-hero-display text-white font-black text-[32px] tracking-tighter drop-shadow-md">FAMS</span>
                            <div class="h-6 w-[1px] bg-red-400/40"></div>
                            <span class="font-asset-code text-red-200/70 text-[10px] tracking-widest uppercase">Institutional Hub</span>
                        </div>
                        <span class="font-label-sm text-red-300/50 tracking-wider">by JustJava Technologies</span>
                    </div>
                    <div class="flex-grow flex items-center justify-center py-8">
                        <div class="w-full rounded-2xl overflow-hidden relative shadow-2xl shadow-black/30" style="height: 420px;">
                            <img src="https://images.unsplash.com/photo-1553413077-190dd305871c?w=900&q=85"
                                 alt="Warehouse asset scanning"
                                 class="w-full h-full object-cover"
                                 onerror="this.onerror=null; this.src='${url.resourcesPath}/img/fallback-asset.jpg'">
                            <div class="absolute inset-0 image-gradient-overlay"></div>
                            <div class="absolute inset-0 image-vignette"></div>
                            <div class="absolute bottom-0 left-0 right-0 p-5">
                                <p class="font-asset-code text-red-200/80 text-[10px] tracking-widest uppercase mb-1.5">Asset Verification · RED SECURE</p>
                                <p class="text-white font-semibold text-[15px] leading-snug drop-shadow-md">
                                    Every asset tagged, scanned,<br>and accounted for — red standard.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="max-w-[440px] animate-fade-up" style="animation-delay: 400ms;">
                        <div id="testimonial-container">
                            <div class="testimonial-slide">
                                <span class="material-symbols-outlined text-red-300 text-4xl mb-4 drop-shadow quote-icon">format_quote</span>
                                <p class="text-white text-[20px] font-medium leading-relaxed mb-6 drop-shadow">
                                    "The single source of truth for our entire infrastructure fleet. FAMS has redefined our asset reliability metrics."
                                </p>
                                <div class="flex items-center gap-3">
                                    <div class="testimonial-avatar">ED</div>
                                    <div>
                                        <p class="text-white font-bold text-sm">Executive Director</p>
                                        <p class="text-red-200/80 text-xs font-asset-code uppercase tracking-tighter">Federal Infrastructure Agency</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- RIGHT PANEL (form) -->
            <section class="w-full lg:w-1/2 flex flex-col justify-center items-center px-margin-mobile md:px-margin-desktop py-12 relative right-panel">
                <div class="max-w-[420px] w-full animate-fade-up">

                    <!-- Mobile branding -->
                    <div class="lg:hidden mb-12 flex justify-center">
                        <div class="flex flex-col items-center gap-2">
                            <span class="font-hero-display text-primary font-black text-[40px] tracking-tighter">FAMS</span>
                            <span class="font-label-sm text-secondary tracking-widest uppercase text-[10px]">by JustJava Technologies</span>
                        </div>
                    </div>

                    <!-- Keycloak messages -->
                    <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="kc-alert kc-alert-${message.type} mb-6">
                            <#if message.type = 'success'>
                                <span class="material-symbols-outlined text-[18px]">check_circle</span>
                            <#elseif message.type = 'warning'>
                                <span class="material-symbols-outlined text-[18px]">warning</span>
                            <#elseif message.type = 'error'>
                                <span class="material-symbols-outlined text-[18px]">error</span>
                            <#else>
                                <span class="material-symbols-outlined text-[18px]">info</span>
                            </#if>
                            <span>${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>

                    <!-- Flip card container -->
                    <div class="form-container">
                        <div class="form-flip-inner relative" id="form-inner">

                            <!-- LOGIN FORM (front) -->
                            <div class="form-front">
                                <header class="mb-10">
                                    <h1 class="font-section-headline text-[32px] text-on-surface mb-2">Welcome back.</h1>
                                    <p class="text-secondary text-body-md">
                                        Sign in to your organization's <span class="text-primary font-semibold">FAMS</span> workspace.
                                    </p>
                                </header>

                                <form id="kc-form-login" class="space-y-6" action="${url.loginAction}" method="post">
                                    <!-- Username / Email -->
                                    <div>
                                        <label class="block font-label-sm text-on-surface-variant mb-2" for="username">
                                            <#if !realm.loginWithEmailAllowed>
                                                ${msg("username")}
                                            <#elseif !realm.registrationEmailAsUsername>
                                                ${msg("usernameOrEmail")}
                                            <#else>
                                                Work Email
                                            </#if>
                                        </label>
                                        <input class="fams-input <#if messagesPerField.existsError('username')>fams-input-error</#if>"
                                               id="username" name="username" value="${(login.username!'')}"
                                               placeholder="name@company.com" type="text" autofocus autocomplete="off"
                                               aria-invalid="<#if messagesPerField.existsError('username')>true</#if>">
                                        <#if messagesPerField.existsError('username')>
                                            <p class="fams-field-error">
                                                <span class="material-symbols-outlined text-[14px]">error</span>
                                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                            </p>
                                        </#if>
                                    </div>

                                    <!-- Password -->
                                    <div>
                                        <div class="flex justify-between items-end mb-2">
                                            <label class="font-label-sm text-on-surface-variant" for="password">${msg("password")}</label>
                                            <#if realm.resetPasswordAllowed>
                                                <button class="text-primary font-label-sm hover:underline hover:text-red-700 transition" onclick="flipForm()" type="button">
                                                    ${msg("doForgotPassword")}
                                                </button>
                                            </#if>
                                        </div>
                                        <div class="relative">
                                            <input class="fams-input <#if messagesPerField.existsError('password')>fams-input-error</#if>"
                                                   id="password" name="password" placeholder="••••••••" type="password" autocomplete="off"
                                                   aria-invalid="<#if messagesPerField.existsError('password')>true</#if>">
                                            <button class="absolute right-4 top-1/2 -translate-y-1/2 text-secondary hover:text-primary transition-colors"
                                                    onclick="togglePassword()" type="button" aria-label="Toggle password visibility">
                                                <span class="material-symbols-outlined text-[20px]" id="eye-icon">visibility</span>
                                            </button>
                                        </div>
                                        <#if messagesPerField.existsError('password')>
                                            <p class="fams-field-error">
                                                <span class="material-symbols-outlined text-[14px]">error</span>
                                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                            </p>
                                        </#if>
                                    </div>

                                    <!-- Remember Me -->
                                    <#if realm.rememberMe && !usernameEditDisabled??>
                                        <div class="flex items-center gap-3">
                                            <input class="custom-checkbox w-5 h-5 rounded border-outline-variant text-primary focus:ring-primary focus:ring-1"
                                                   id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                                            <label class="font-body-md text-secondary select-none" for="rememberMe">${msg("rememberMe")}</label>
                                        </div>
                                    </#if>

                                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>>

                                    <button class="fams-btn-primary mt-2" id="kc-login" name="login" type="submit">
                                        <span id="btn-text">${msg("doLogIn")} →</span>
                                        <div class="hidden loader-dots flex gap-1" id="btn-loader">
                                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                                            <span class="w-1.5 h-1.5 bg-white rounded-full"></span>
                                        </div>
                                    </button>
                                </form>

                                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                    <p class="text-center text-xs text-secondary mt-8">
                                        ${msg("noAccount")}
                                        <a class="font-medium text-primary hover:underline" href="${url.registrationUrl}">${msg("doRegister")}</a>
                                    </p>
                                </#if>
                            </div>

                            <!-- FORGOT PASSWORD FORM (back) - FIXED: POST method with stateChecker -->
                            <div class="form-back">
                                <header class="mb-10">
                                    <h1 class="font-section-headline text-[32px] text-on-surface mb-2">Password Recovery.</h1>
                                    <p class="text-secondary text-body-md">
                                        Enter your work email and we'll send a secure link to reset your password.
                                    </p>
                                </header>

                                <form class="space-y-6" action="${url.loginResetCredentialsUrl}" method="post">
                                    <div>
                                        <label class="block font-label-sm text-on-surface-variant mb-2" for="reset-email">Work Email</label>
                                        <input class="fams-input" id="reset-email" name="username" placeholder="name@company.com" required type="email">
                                    </div>
                                    <!-- CRITICAL: include the stateChecker for Keycloak -->
                                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker!}">
                                    <button class="fams-btn-primary" type="submit">
                                        <span class="material-symbols-outlined text-[18px]">lock_reset</span>
                                        Send Recovery Link
                                    </button>
                                    <button class="w-full flex items-center justify-center gap-2 text-secondary hover:text-primary transition-colors font-label-sm py-2"
                                            onclick="flipForm()" type="button">
                                        <span class="material-symbols-outlined text-[18px]">arrow_back</span>
                                        Back to sign in
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Bottom access note -->
                    <div class="mt-16 text-center border-t border-red-200/40 pt-8">
                        <p class="text-secondary font-body-md mb-2">Don't have access?</p>
                        <p class="text-on-surface-variant font-body-md mb-6 leading-relaxed">
                            Access to FAMS is restricted to authorized institutional personnel. Contact your IT administrator for credentials.
                        </p>
                        <a class="inline-flex items-center gap-2 text-primary font-bold hover:gap-3 transition-all hover:text-red-800" href="#">
                            Book a Demo
                            <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                        </a>
                    </div>
                </div>

                <footer class="absolute bottom-6 w-full px-margin-desktop flex flex-col md:flex-row justify-between items-center text-[11px] font-asset-code text-secondary/80 tracking-tight">
                    <p>© 2024 FAMS (Fixed Asset Management System) · Crimson Edition</p>
                    <div class="flex gap-4 mt-2 md:mt-0">
                        <a class="hover:text-primary transition-colors" href="#">PRIVACY POLICY</a>
                        <a class="hover:text-primary transition-colors" href="#">SECURITY PROTOCOL</a>
                        <a class="hover:text-primary transition-colors" href="#">COMPLIANCE</a>
                    </div>
                </footer>
            </section>
        </main>

        <!-- Custom JavaScript helpers (flip, toggle password) - safe fallbacks -->
        <script>
            function flipForm() {
                const inner = document.getElementById('form-inner');
                if (inner) {
                    inner.classList.toggle('flipped');
                }
            }
            function togglePassword() {
                const pwdField = document.getElementById('password');
                const eyeIcon = document.getElementById('eye-icon');
                if (pwdField && eyeIcon) {
                    const type = pwdField.getAttribute('type') === 'password' ? 'text' : 'password';
                    pwdField.setAttribute('type', type);
                    eyeIcon.textContent = type === 'password' ? 'visibility' : 'visibility_off';
                }
            }
            // Ensure that the form submission is never blocked (no preventDefault)
            document.getElementById('kc-form-login')?.addEventListener('submit', function(e) {
                // optional client-side validation here if needed, but don't break Keycloak
                return true;
            });
        </script>

        <script src="${url.resourcesPath}/js/login.js"></script>
    </#if>
</@layout.registrationLayout>