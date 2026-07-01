<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>Login — RCN CMS</title>

        <meta name="description" content="Log in to the RCN CMS">
        <!-- Tailwind CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Google Fonts used by the theme -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">

        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            'rev-red': '#C0182A',
                            'rev-red-dark': '#8B0E1C',
                            'rev-red-light': '#F9E8EA',
                            'rev-black': '#111111',
                            'rev-ink': '#1E1E1E',
                            'rev-gold': '#A07800',
                            'rev-page': '#F7F4F0',
                            'rev-surface': '#FFFFFF',
                            'rev-border': '#E0DAD3',
                            'rev-muted': '#7A726A',
                            'rev-subtle': '#F0EBE4',
                        },
                        fontFamily: {
                            display: ['Bebas Neue', 'sans-serif'],
                            body: ['Inter', 'sans-serif'],
                            mono: ['JetBrains Mono', 'monospace'],
                        },
                    }
                }
            }
        </script>

        <style>
            /* === Keycloak Wrapper Overrides – eliminate black background === */
            html, body, #kc-page, #kc-page-title, .login-pf-page, #kc-content, #kc-content-wrapper, .card-pf, .login-pf, .pf-c-page {
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
                height: 100% !important;
                min-height: 100vh !important;
                background: transparent !important;
                background-color: #F7F4F0 !important;
                background-image: none !important;
                overflow-x: hidden !important;
            }

            /* Hide Keycloak page headers and titles that may have background */
            .login-pf-page-header, .login-pf-header, #kc-page-title, .kc-page-title, .login-pf-signup, .card-pf-title {
                display: none !important;
                visibility: hidden !important;
                height: 0 !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            /* Ensure content wrapper takes full screen */
            #kc-content-wrapper {
                position: fixed !important;
                top: 0 !important;
                left: 0 !important;
                right: 0 !important;
                bottom: 0 !important;
                z-index: 9999 !important;
                overflow-y: auto !important;
                background-color: #F7F4F0 !important;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: #F7F4F0;
                color: #1E1E1E;
                overflow-x: hidden;
            }
            /* subtle dot pattern on background */
            .bg-dot-pattern {
                background-image: radial-gradient(circle, rgba(192,24,42,0.08) 1px, transparent 1px);
                background-size: 24px 24px;
            }
            .mono-label {
                font-family: 'JetBrains Mono', monospace;
                font-size: 0.625rem;
                text-transform: uppercase;
                letter-spacing: 0.15em;
                color: #7A726A;
            }
            button.red-btn {
                background-color: #C0182A;
                color: white;
                font-family: 'JetBrains Mono', monospace;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 0.15em;
                font-size: 0.875rem;
                padding: 0.75rem 1.5rem;
                transition: background 0.2s;
                border: none;
                cursor: pointer;
            }
            button.red-btn:hover {
                background-color: #8B0E1C;
            }
            .red-link {
                color: #C0182A;
                text-decoration: none;
                position: relative;
            }
            .red-link::after {
                content: '';
                position: absolute;
                bottom: -2px;
                left: 0;
                width: 0;
                height: 1px;
                background: #C0182A;
                transition: width 0.3s ease;
            }
            .red-link:hover::after {
                width: 100%;
            }
            /* Form input styling consistent with dashboard */
            input.form-input {
                background-color: #F0EBE4;
                border: 1px solid #E0DAD3;
                padding: 0.75rem 1rem;
                font-size: 0.875rem;
                color: #1E1E1E;
                outline: none;
                width: 100%;
                border-radius: 0.375rem;
                transition: border-color 0.2s, background-color 0.2s;
            }
            input.form-input:hover {
                border-color: #C0182A;
            }
            input.form-input:focus {
                border-color: #C0182A;
                background-color: #FFFFFF;
            }
            /* Card shadow soft */
            .login-card {
                box-shadow: 0 8px 30px rgba(0,0,0,0.06);
            }
            @media (prefers-reduced-motion: reduce) {
                *, *::before, *::after {
                    animation: none !important;
                    transition: none !important;
                }
            }
        </style>

        <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
    <#elseif section = "form">

        <div class="bg-rev-page bg-dot-pattern flex items-center justify-center min-h-screen p-4">
            <!-- Red top strip – subtle branding -->
            <div class="fixed top-0 left-0 right-0 h-1 bg-rev-red z-50"></div>

            <!-- Login Card -->
            <div class="w-full max-w-md">
                <div class="login-card bg-rev-surface rounded-xl border border-rev-border p-8 md:p-10">

                    <!-- Logo -->
                    <div class="flex justify-center mb-6">
                        <img src="https://res.cloudinary.com/dsyqibqxg/image/upload/v1782735910/rcn/homepage/aquajdc38jvnghzduquo.png" alt="RCN Logo" class="h-12 w-auto">
                    </div>

                    <!-- Headings -->
                    <h1 class="font-display text-3xl md:text-4xl text-rev-ink uppercase text-center tracking-tight">
                        Editor Login
                    </h1>
                    <p class="text-sm text-rev-muted text-center mt-2 mb-8">
                        Access the revolutionary press management system
                    </p>

                    <!-- Keycloak Login Form -->
                    <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-5">
                        <!-- Username / Email -->
                        <div>
                            <label for="username" class="mono-label block mb-2">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>${msg("email")}</#if>
                            </label>
                            <input type="text" id="username" name="username" placeholder="you@example.com" class="form-input" autocomplete="username" required value="${(login.username!'')}">
                        </div>

                        <!-- Password -->
                        <div>
                            <label for="password" class="mono-label block mb-2">${msg("password")}</label>
                            <input type="password" id="password" name="password" placeholder="••••••••" class="form-input" autocomplete="current-password" required>
                        </div>

                        <!-- Submit -->
                        <button type="submit" class="red-btn w-full mt-2" id="kc-login">
                            Sign In →
                        </button>
                    </form>

                    <!-- Security note -->
                    <p class="text-center text-[11px] text-rev-muted mt-6 leading-relaxed">
                        This area is restricted to RCN editorial collective members.
                        All access is logged.
                    </p>
                </div>

                <!-- Footer note -->
                <p class="text-center text-xs text-rev-muted mt-6">
                    &copy; 2026 Revolutionary Communists of Nigeria
                </p>
            </div>
        </div>

        <script src="${url.resourcesPath}/js/login.js"></script>

    </#if>
</@layout.registrationLayout>

