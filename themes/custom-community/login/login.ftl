<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Connect - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&family=Be+Vietnam+Pro:wght@400;500;700;900&family=Noto+Sans:wght@400;500;700;900"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>
        /* Hide default Keycloak elements */
        .login-pf-page-header,
        .login-pf-header,
        h1#kc-page-title,
        .login-pf-signup {
            display: none !important;
        }

        .login-pf-page {
            padding-top: 0;
            border: none;
        }

        .login-pf-page .card-pf {
            padding: 0;
            margin-bottom: 0;
            border: none;
            max-width: none;
        }

        #kc-content-wrapper {
            margin-top: 0;
        }

        .comtext {
            color: white !important;
        }

        /* Base animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideIn {
            from {
                transform: translateX(-20px);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
            100% { transform: translateY(0px); }
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Animation classes */
        .animate-fade-in {
            animation: fadeIn 0.6s ease-out forwards;
        }

        .animate-slide-in {
            animation: slideIn 0.5s ease-out forwards;
        }

        .animate-pulse-slow {
            animation: pulse 3s infinite ease-in-out;
        }

        .animate-float {
            animation: float 4s infinite ease-in-out;
        }

        .animate-gradient {
            background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
        }

        /* Mobile-specific animations */
        .mobile-fade-in {
            animation: fadeInUp 0.5s ease-out forwards;
        }

        .mobile-slide-down {
            animation: slideDown 0.3s ease-out forwards;
        }

        /* Button transitions */
        .btn-transition {
            transition: all 0.2s ease;
        }

        .btn-transition:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .mobile-btn-active:active {
            transform: scale(0.98);
        }

        /* Text effects */
        .gradient-text {
            background: linear-gradient(90deg, #2a5dea, #8a3ffc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Glass effects */
        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        .mobile-glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        /* Input focus states */
        .input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
        }

        .mobile-input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
            border-color: #2a5dea;
        }

        /* Checkbox styling */
        input[type="checkbox"]:checked {
            background-color: #2a5dea;
            border-color: #2a5dea;
        }

        /* Mobile touch targets */
        .mobile-touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        /* Prevent zoom on input focus for mobile */
        @media (max-width: 1023px) {
            input[type="text"],
            input[type="email"],
            input[type="password"] {
                font-size: 16px;
            }
        }

        /* Desktop layout (1024px and up) */
        .desktop-layout {
            display: none;
        }

        .mobile-layout {
            display: block;
        }

        @media (min-width: 1024px) {
            .desktop-layout {
                display: flex !important;
            }

            .mobile-layout {
                display: none !important;
            }

            .desktop-left-panel {
                display: flex !important;
                flex-direction: column;
                justify-content: space-between;
            }

            .responsive-right-panel {
                width: 50% !important;
            }

            .desktop-background {
                display: block;
            }
            .mobile-background {
                display: none;
            }
        }

        /* Mobile layout (below 1024px) */
        @media (max-width: 1023px) {
            .desktop-layout {
                display: none !important;
            }

            .mobile-layout {
                display: block !important;
            }

            .desktop-background {
                display: none;
            }
            .mobile-background {
                display: block;
            }

            .mobile-container {
                min-height: 100vh;
                display: flex;
                flex-direction: column;
            }

            .mobile-header {
                flex-shrink: 0;
                padding-top: 3rem;
                padding-bottom: 2rem;
                padding-left: 1.5rem;
                padding-right: 1.5rem;
            }

            .mobile-content {
                flex: 1;
                padding-left: 1.5rem;
                padding-right: 1.5rem;
                padding-bottom: 2rem;
            }

            .mobile-form-container {
                max-width: 20rem;
                margin: 0 auto;
            }

            .mobile-form-card {
                border-radius: 1.5rem;
                padding: 2rem;
            }

            .mobile-input {
                padding: 1rem;
                border-radius: 1rem;
                border-width: 2px;
                font-size: 1.125rem;
            }

            .mobile-input-with-icon {
                padding-left: 3rem;
            }

            .mobile-button {
                padding: 1rem 1.5rem;
                border-radius: 1rem;
                font-size: 1.125rem;
                font-weight: 700;
            }

            .mobile-icon-container {
                padding-left: 1rem;
            }

            .mobile-icon {
                font-size: 1.125rem;
            }
        }
    </style>
<#elseif section = "form">

<div style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif; background: linear-gradient(to bottom right, #eff6ff, #eef2ff); min-height: 100vh;">

    <!-- Desktop background -->
    <div class="desktop-background" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden; z-index: 0;">
        <div style="position: absolute; top: -5rem; left: -5rem; width: 18rem; height: 18rem; background-color: #bfdbfe; border-radius: 9999px; opacity: 0.2;" class="animate-float"></div>
        <div style="position: absolute; top: 25%; right: -5rem; width: 16rem; height: 16rem; background-color: #e9d5ff; border-radius: 9999px; opacity: 0.2; animation-delay: 1s;" class="animate-float"></div>
        <div style="position: absolute; bottom: 5rem; left: 25%; width: 14rem; height: 14rem; background-color: #c7d2fe; border-radius: 9999px; opacity: 0.2; animation-delay: 2s;" class="animate-float"></div>
        <div style="position: absolute; bottom: 0; right: 25%; width: 12rem; height: 12rem; background-color: #93c5fd; border-radius: 9999px; opacity: 0.2; animation-delay: 3s;" class="animate-float"></div>
    </div>

    <!-- Mobile background -->
    <div class="mobile-background" style="position: fixed; top: 0; left: 0; right: 0; bottom: 0; overflow: hidden; z-index: 0;">
        <div style="position: absolute; top: -2.5rem; left: -2.5rem; width: 10rem; height: 10rem; background-color: #bfdbfe; border-radius: 9999px; opacity: 0.2;"></div>
        <div style="position: absolute; top: 25%; right: -2.5rem; width: 8rem; height: 8rem; background-color: #e9d5ff; border-radius: 9999px; opacity: 0.2;"></div>
        <div style="position: absolute; bottom: 5rem; left: 25%; width: 7rem; height: 7rem; background-color: #c7d2fe; border-radius: 9999px; opacity: 0.2;"></div>
    </div>

    <!-- Desktop layout -->
    <div class="desktop-layout" style="min-height: 100vh; position: relative; z-index: 10;">
        <!-- Left branding panel -->
        <div class="desktop-left-panel" style="width: 50%; padding: 3rem; background: linear-gradient(to bottom right, #2563eb, #9333ea); color: white;">
            <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 3rem;" class="animate-fade-in">
                <div style="width: 2.5rem; height: 2.5rem;" class="animate-pulse-slow">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/>
                    </svg>
                </div>
                <h1 style="font-size: 1.5rem; font-weight: 700;">Connect</h1>
            </div>
            <div style="max-width: 28rem; animation-delay: 0.3s;" class="animate-fade-in">
                <h2 style="font-size: 2.25rem; font-weight: 700; margin-bottom: 1.5rem;">Join our community of professionals</h2>
                <p style="font-size: 1.125rem; opacity: 0.9; margin-bottom: 2rem;" class="comtext">Connect with coaches, expand your network, and accelerate your career growth with our platform.</p>
                <div style="display: flex; flex-direction: column; gap: 1.5rem;">
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-users" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;" class="comtext">Connect with industry experts</p>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-graduation-cap" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;" class="comtext">Personalized coaching sessions</p>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-briefcase" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;" class="comtext">Career advancement opportunities</p>
                    </div>
                </div>
            </div>
            <div style="animation-delay: 0.6s;" class="animate-fade-in">
                <div style="display: flex; align-items: center; gap: 0.5rem; margin-bottom: 1rem;">
                    <div style="width: 2rem; height: 2rem; border-radius: 9999px; border: 2px solid white; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&q=80" alt="User" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <div style="width: 2rem; height: 2rem; border-radius: 9999px; border: 2px solid white; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&q=80" alt="User" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <div style="width: 2rem; height: 2rem; border-radius: 9999px; border: 2px solid white; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&q=80" alt="User" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    <div style="width: 2rem; height: 2rem; border-radius: 9999px; border: 2px solid white; overflow: hidden;">
                        <img src="https://images.unsplash.com/photo-1519345182560-3f2917c472ef?w=100&q=80" alt="User" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                </div>
                <p style="font-size: 0.875rem; opacity: 0.8;" class="comtext">
                    Join thousands of professionals who are already growing their careers with Connect
                </p>
            </div>
        </div>

        <!-- Desktop login form -->
        <div class="responsive-right-panel" style="width: 50%; display: flex; align-items: center; justify-content: center; padding: 2rem;">
            <div style="width: 100%; max-width: 28rem;">
                <div class="glass-effect animate-fade-in" style="border-radius: 1rem; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25); padding: 2rem; animation-delay: 0.2s;">
                    <h2 style="font-size: 1.5rem; font-weight: 700; color: #1f2937; margin-bottom: 0.5rem;">Welcome back</h2>
                    <p style="color: #4b5563; margin-bottom: 1.5rem; font-size: 0.875rem;">Sign in to your account to continue</p>

                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="document.getElementById('kc-login').disabled = true; return true;" action="${url.loginAction}" method="post" style="display: flex; flex-direction: column; gap: 1.25rem;">
                            <#if !usernameHidden??>
                                <div>
                                    <label for="username" style="display: block; font-size: 0.875rem; font-weight: 500; color: #374151; margin-bottom: 0.25rem;">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}</#if>
                                    </label>
                                    <div style="position: relative;">
                                        <div style="position: absolute; top: 0; bottom: 0; left: 0; padding-left: 0.75rem; display: flex; align-items: center; pointer-events: none;">
                                            <i class="fas fa-envelope" style="color: #9ca3af;"></i>
                                        </div>
                                        <input type="text" id="username" name="username" value="${(login.username!'')}"
                                               class="input-focus"
                                               style="padding: 0.75rem 1rem 0.75rem 2.5rem; border-radius: 0.5rem; border: 1px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s;"
                                               autocomplete="username"
                                               placeholder="you@example.com"
                                               autofocus
                                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                    </div>
                                    <#if messagesPerField.existsError('username','password')>
                                        <p style="color: #dc2626; font-size: 0.875rem; margin-top: 0.25rem;">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                                    </#if>
                                </div>
                            </#if>

                            <div>
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.25rem;">
                                    <label for="password" style="display: block; font-size: 0.875rem; font-weight: 500; color: #374151;">${msg("password")}</label>
                                    <#if realm.resetPasswordAllowed>
                                        <a href="${url.loginResetCredentialsUrl}" style="font-size: 0.875rem; color: #2563eb; transition: color 0.2s;" onmouseover="this.style.color='#1e40af'" onmouseout="this.style.color='#2563eb'">${msg("doForgotPassword")}</a>
                                    </#if>
                                </div>
                                <div style="position: relative;">
                                    <div style="position: absolute; top: 0; bottom: 0; left: 0; padding-left: 0.75rem; display: flex; align-items: center; pointer-events: none;">
                                        <i class="fas fa-lock" style="color: #9ca3af;"></i>
                                    </div>
                                    <input type="password" id="password" name="password"
                                           class="input-focus"
                                           style="padding: 0.75rem 1rem 0.75rem 2.5rem; border-radius: 0.5rem; border: 1px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s;"
                                           placeholder="••••••••"
                                           autocomplete="current-password"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                    <button type="button" id="togglePassword" style="position: absolute; top: 0; bottom: 0; right: 0; padding-right: 0.75rem; display: flex; align-items: center; background: none; border: none; cursor: pointer;">
                                        <i class="fas fa-eye" style="color: #9ca3af;"></i>
                                    </button>
                                </div>
                                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                    <p style="color: #dc2626; font-size: 0.875rem; margin-top: 0.25rem;">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                                </#if>
                            </div>

                            <#if realm.rememberMe && !usernameHidden??>
                                <div style="display: flex; align-items: center;">
                                    <input type="checkbox" id="rememberMe" name="rememberMe"
                                           style="height: 1rem; width: 1rem; border-radius: 0.25rem; border: 1px solid #d1d5db;"
                                           <#if login.rememberMe??>checked</#if>/>
                                    <label for="rememberMe" style="margin-left: 0.5rem; display: block; font-size: 0.875rem; color: #374151;">${msg("rememberMe")}</label>
                                </div>
                            </#if>

                            <div>
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <button type="submit" id="kc-login"
                                        class="animate-gradient btn-transition"
                                        style="width: 100%; padding: 0.75rem 1rem; border-radius: 0.5rem; color: white; font-weight: 500; outline: none; border: none; cursor: pointer;">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                        </form>
                    </#if>
                </div>

                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <p style="text-align: center; font-size: 0.875rem; color: #4b5563; margin-top: 1rem;">
                        Don't have an account?
                        <a href="${url.registrationUrl}" style="color: #2563eb; text-decoration: underline;">Create one</a>
                    </p>
                </#if>
            </div>
        </div>
    </div>

    <!-- Mobile layout -->
    <div class="mobile-layout mobile-container" style="position: relative; z-index: 10;">
        <!-- Mobile header -->
        <div class="mobile-header">
            <div class="mobile-fade-in" style="text-align: center;">
                <div style="display: inline-flex; align-items: center; justify-content: center; margin-bottom: 1rem;">
                    <div style="width: 4rem; height: 4rem;">
                        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                        </svg>
                    </div>
                </div>
                <h1 class="gradient-text" style="font-size: 2.25rem; font-weight: 700; margin-bottom: 0.5rem;">Connect</h1>
                <p style="color: #4b5563; font-size: 1.125rem;">Welcome back</p>
            </div>
        </div>

        <!-- Mobile content -->
        <div class="mobile-content">
            <div class="mobile-form-container">
                <div class="mobile-glass-effect mobile-form-card mobile-fade-in" style="animation-delay: 0.2s;">
                    <#if realm.password>
                        <form id="kc-form-login-mobile" onsubmit="document.getElementById('kc-login-mobile').disabled = true; return true;" action="${url.loginAction}" method="post" style="display: flex; flex-direction: column; gap: 1.5rem;">
                            <#if !usernameHidden??>
                                <div class="mobile-slide-down" style="animation-delay: 0.3s;">
                                    <label for="username-mobile" style="display: block; font-size: 0.875rem; font-weight: 600; color: #374151; margin-bottom: 0.75rem;">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}</#if>
                                    </label>
                                    <div style="position: relative;">
                                        <div class="mobile-icon-container" style="position: absolute; top: 0; bottom: 0; display: flex; align-items: center; pointer-events: none;">
                                            <i class="fas fa-envelope mobile-icon" style="color: #9ca3af;"></i>
                                        </div>
                                        <input type="text" id="username-mobile" name="username" value="${(login.username!'')}"
                                               class="mobile-input-focus mobile-touch-target mobile-input mobile-input-with-icon"
                                               style="border: 2px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s;"
                                               autocomplete="username"
                                               placeholder="Enter your email"
                                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                    </div>
                                    <#if messagesPerField.existsError('username','password')>
                                        <p style="color: #dc2626; font-size: 0.875rem; margin-top: 0.5rem; font-weight: 500;">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                                    </#if>
                                </div>
                            </#if>

                            <div class="mobile-slide-down" style="animation-delay: 0.4s;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.75rem;">
                                    <label for="password-mobile" style="display: block; font-size: 0.875rem; font-weight: 600; color: #374151;">${msg("password")}</label>
                                    <#if realm.resetPasswordAllowed>
                                        <a href="${url.loginResetCredentialsUrl}" style="font-size: 0.875rem; color: #2563eb; font-weight: 500;">Forgot?</a>
                                    </#if>
                                </div>
                                <div style="position: relative;">
                                    <div class="mobile-icon-container" style="position: absolute; top: 0; bottom: 0; display: flex; align-items: center; pointer-events: none;">
                                        <i class="fas fa-lock mobile-icon" style="color: #9ca3af;"></i>
                                    </div>
                                    <input type="password" id="password-mobile" name="password"
                                           class="mobile-input-focus mobile-touch-target mobile-input mobile-input-with-icon"
                                           style="padding-right: 3.5rem; border: 2px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s;"
                                           placeholder="Enter your password"
                                           autocomplete="current-password"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                                    <button type="button" id="togglePasswordMobile" class="mobile-touch-target" style="position: absolute; top: 0; bottom: 0; right: 0; padding-right: 1rem; display: flex; align-items: center; background: none; border: none; cursor: pointer;">
                                        <i class="fas fa-eye mobile-icon" style="color: #9ca3af;"></i>
                                    </button>
                                </div>
                                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                    <p style="color: #dc2626; font-size: 0.875rem; margin-top: 0.5rem; font-weight: 500;">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                                </#if>
                            </div>

                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="mobile-slide-down" style="display: flex; align-items: center; animation-delay: 0.5s;">
                                    <input type="checkbox" id="rememberMe-mobile" name="rememberMe"
                                           style="height: 1.25rem; width: 1.25rem; border-radius: 0.25rem; border: 1px solid #d1d5db;"
                                           <#if login.rememberMe??>checked</#if>/>
                                    <label for="rememberMe-mobile" style="margin-left: 0.75rem; display: block; font-size: 0.875rem; color: #374151; font-weight: 500;">${msg("rememberMe")}</label>
                                </div>
                            </#if>

                            <div class="mobile-slide-down" style="animation-delay: 0.6s;">
                                <input type="hidden" name="credentialId" id="id-hidden-input-mobile"
                                       <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <button type="submit" id="kc-login-mobile"
                                        class="animate-gradient mobile-btn-active mobile-touch-target mobile-button"
                                        style="width: 100%; color: white; outline: none; border: none; cursor: pointer; transition: all 0.2s;">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                        </form>
                    </#if>
                </div>

                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div class="mobile-slide-down" style="text-align: center; margin-top: 2rem; animation-delay: 0.7s;">
                        <p style="color: #4b5563;">
                            Don't have an account?
                            <a href="${url.registrationUrl}" style="color: #2563eb; font-weight: 600;">Sign up</a>
                        </p>
                    </div>
                </#if>

                <div class="mobile-slide-down" style="margin-top: 2rem; text-align: center; animation-delay: 0.8s;">
                    <div style="display: flex; justify-content: center; align-items: center; gap: 1rem; margin-bottom: 1rem;">
                        <div style="display: flex; align-items: center; gap: 0.25rem;">
                            <i class="fas fa-shield-alt" style="color: #10b981;"></i>
                            <span style="font-size: 0.75rem; color: #4b5563; font-weight: 500;">Secure</span>
                        </div>
                        <div style="display: flex; align-items: center; gap: 0.25rem;">
                            <i class="fas fa-lock" style="color: #2563eb;"></i>
                            <span style="font-size: 0.75rem; color: #4b5563; font-weight: 500;">Encrypted</span>
                        </div>
                        <div style="display: flex; align-items: center; gap: 0.25rem;">
                            <i class="fas fa-users" style="color: #9333ea;"></i>
                            <span style="font-size: 0.75rem; color: #4b5563; font-weight: 500;">Trusted</span>
                        </div>
                    </div>
                    <p style="font-size: 0.75rem; color: #6b7280;">
                        Join thousands of professionals growing their careers
                    </p>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    // Password toggle functionality
    function initPasswordToggle() {
        var togglePassword = document.getElementById("togglePassword");
        var togglePasswordMobile = document.getElementById("togglePasswordMobile");

        if (togglePassword) {
            togglePassword.addEventListener("click", function () {
                var pwd = document.getElementById("password");
                var icon = this.querySelector("i");

                if (pwd && pwd.type === "password") {
                    pwd.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else if (pwd) {
                    pwd.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            });
        }

        if (togglePasswordMobile) {
            togglePasswordMobile.addEventListener("click", function () {
                var pwd = document.getElementById("password-mobile");
                var icon = this.querySelector("i");

                if (pwd && pwd.type === "password") {
                    pwd.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else if (pwd) {
                    pwd.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            });
        }
    }

    // Enhanced form validation
    function initFormHandling() {
        var form = document.getElementById("kc-form-login");
        var formMobile = document.getElementById("kc-form-login-mobile");
        var submitBtn = document.getElementById("kc-login");
        var submitBtnMobile = document.getElementById("kc-login-mobile");

        if (form && submitBtn) {
            form.addEventListener("submit", function(e) {
                submitBtn.disabled = true;
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin" style="margin-right: 0.5rem;"></i>Signing in...';
            });
        }

        if (formMobile && submitBtnMobile) {
            formMobile.addEventListener("submit", function(e) {
                submitBtnMobile.disabled = true;
                submitBtnMobile.innerHTML = '<i class="fas fa-spinner fa-spin" style="margin-right: 0.5rem;"></i>Signing in...';
            });
        }
    }

    // Initialize when DOM is ready
    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", function() {
            initPasswordToggle();
            initFormHandling();
        });
    } else {
        initPasswordToggle();
        initFormHandling();
    }
</script>

</#if>
</@layout.registrationLayout>
