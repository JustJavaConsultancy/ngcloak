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

        /* Animations */
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

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
            100% { transform: translateY(0px); }
        }

        .mobile-fade-in {
            animation: fadeInUp 0.5s ease-out forwards;
        }

        .mobile-slide-down {
            animation: slideDown 0.3s ease-out forwards;
        }

        .mobile-gradient-btn {
            background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
            background-size: 400% 400%;
            animation: gradientShift 6s ease infinite;
        }

        .mobile-input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
            border-color: #2a5dea;
        }

        .mobile-glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        .mobile-btn-active:active {
            transform: scale(0.98);
        }

        .mobile-touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            font-size: 16px;
        }

        .mobile-gradient-text {
            background: linear-gradient(90deg, #2a5dea, #8a3ffc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Desktop styles */
        @media (min-width: 1024px) {
            .desktop-only {
                display: block !important;
            }
            .mobile-only {
                display: none !important;
            }
            .desktop-layout {
                display: flex !important;
                min-height: 100vh;
            }
            .desktop-left {
                width: 50%;
                background: linear-gradient(to bottom right, #2563eb, #9333ea);
                color: white;
                padding: 3rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .desktop-right {
                width: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 2rem;
            }
            .glass-card {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.18);
                border-radius: 1rem;
                padding: 2rem;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            }
            .animate-float {
                animation: float 4s infinite ease-in-out;
            }
        }

        @media (max-width: 1023px) {
            .desktop-only {
                display: none !important;
            }
            .mobile-only {
                display: block !important;
            }
        }
    </style>
<#elseif section = "form">

<!-- Desktop Layout -->
<div class="desktop-only desktop-layout" style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif;">
    <!-- Desktop Background -->
    <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; overflow: hidden; z-index: 0;">
        <div style="position: absolute; top: -5rem; left: -5rem; width: 18rem; height: 18rem; background-color: #bfdbfe; border-radius: 9999px; opacity: 0.2;" class="animate-float"></div>
        <div style="position: absolute; top: 25%; right: -5rem; width: 16rem; height: 16rem; background-color: #e9d5ff; border-radius: 9999px; opacity: 0.2; animation-delay: 1s;" class="animate-float"></div>
        <div style="position: absolute; bottom: 5rem; left: 25%; width: 14rem; height: 14rem; background-color: #c7d2fe; border-radius: 9999px; opacity: 0.2; animation-delay: 2s;" class="animate-float"></div>
    </div>

    <!-- Left Panel -->
    <div class="desktop-left" style="position: relative; z-index: 10;">
        <div>
            <div style="display: flex; align-items: center; gap: 0.75rem; margin-bottom: 3rem;">
                <div style="width: 2.5rem; height: 2.5rem;">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/>
                    </svg>
                </div>
                <h1 style="font-size: 1.5rem; font-weight: 700;">Connect</h1>
            </div>
            <div style="max-width: 28rem;">
                <h2 style="font-size: 2.25rem; font-weight: 700; margin-bottom: 1.5rem;">Join our community of professionals</h2>
                <p style="font-size: 1.125rem; opacity: 0.9; margin-bottom: 2rem;">Connect with coaches, expand your network, and accelerate your career growth with our platform.</p>
                <div style="display: flex; flex-direction: column; gap: 1.5rem;">
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-users" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;">Connect with industry experts</p>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-graduation-cap" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;">Personalized coaching sessions</p>
                    </div>
                    <div style="display: flex; align-items: center;">
                        <div style="flex-shrink: 0; height: 2.5rem; width: 2.5rem; border-radius: 9999px; background-color: rgba(255, 255, 255, 0.2); display: flex; align-items: center; justify-content: center; margin-right: 1rem;">
                            <i class="fas fa-briefcase" style="color: white;"></i>
                        </div>
                        <p style="font-size: 1.125rem;">Career advancement opportunities</p>
                    </div>
                </div>
            </div>
        </div>
        <div>
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
            <p style="font-size: 0.875rem; opacity: 0.8;">
                Join thousands of professionals who are already growing their careers with Connect
            </p>
        </div>
    </div>

    <!-- Right Panel -->
    <div class="desktop-right" style="position: relative; z-index: 10;">
        <div style="width: 100%; max-width: 28rem;">
            <div class="glass-card">
                <h2 style="font-size: 1.5rem; font-weight: 700; color: #1f2937; margin-bottom: 0.5rem;">Welcome back</h2>
                <p style="color: #4b5563; margin-bottom: 1.5rem; font-size: 0.875rem;">Sign in to your account to continue</p>

                <form id="kc-form-login" action="${url.loginAction}" method="post" style="display: flex; flex-direction: column; gap: 1.25rem;">
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
                                   style="padding: 0.75rem 1rem 0.75rem 2.5rem; border-radius: 0.5rem; border: 1px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s; font-size: 16px;"
                                   autocomplete="username"
                                   placeholder="you@example.com"
                                   autofocus
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                            <p style="color: #dc2626; font-size: 0.875rem; margin-top: 0.25rem;">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                        </#if>
                    </div>

                    <div>
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.25rem;">
                            <label for="password" style="display: block; font-size: 0.875rem; font-weight: 500; color: #374151;">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" style="font-size: 0.875rem; color: #2563eb;">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>
                        <div style="position: relative;">
                            <div style="position: absolute; top: 0; bottom: 0; left: 0; padding-left: 0.75rem; display: flex; align-items: center; pointer-events: none;">
                                <i class="fas fa-lock" style="color: #9ca3af;"></i>
                            </div>
                            <input type="password" id="password" name="password"
                                   style="padding: 0.75rem 1rem 0.75rem 2.5rem; border-radius: 0.5rem; border: 1px solid #e5e7eb; outline: none; width: 100%; transition: all 0.2s; font-size: 16px;"
                                   placeholder="••••••••"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePassword" style="position: absolute; top: 0; bottom: 0; right: 0; padding-right: 0.75rem; display: flex; align-items: center; background: none; border: none; cursor: pointer;">
                                <i class="fas fa-eye" style="color: #9ca3af;"></i>
                            </button>
                        </div>
                    </div>

                    <#if realm.rememberMe>
                        <div style="display: flex; align-items: center;">
                            <input type="checkbox" id="rememberMe" name="rememberMe"
                                   style="height: 1rem; width: 1rem; border-radius: 0.25rem; border: 1px solid #d1d5db;"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe" style="margin-left: 0.5rem; display: block; font-size: 0.875rem; color: #374151;">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <div>
                        <input type="hidden" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login"
                                class="mobile-gradient-btn"
                                style="width: 100%; padding: 0.75rem 1rem; border-radius: 0.5rem; color: white; font-weight: 500; outline: none; border: none; cursor: pointer;">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
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

<!-- Mobile Layout -->
<body class="mobile-only bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen"
      style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif">

<div class="fixed inset-0 overflow-hidden z-0">
    <div class="absolute -top-10 -left-10 w-40 h-40 bg-blue-200 rounded-full opacity-20"></div>
    <div class="absolute top-1/4 -right-10 w-32 h-32 bg-purple-200 rounded-full opacity-20"></div>
    <div class="absolute bottom-20 left-1/4 w-28 h-28 bg-indigo-200 rounded-full opacity-20"></div>
</div>

<div class="relative z-10 min-h-screen flex flex-col">
    <div class="flex-shrink-0 pt-12 pb-8 px-6">
        <div class="text-center mobile-fade-in">
            <div class="inline-flex items-center justify-center mb-4">
                <div class="w-16 h-16">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                    </svg>
                </div>
            </div>
            <h1 class="text-4xl font-bold mobile-gradient-text mb-2">Connect</h1>
            <p class="text-gray-600 text-lg">Welcome back</p>
        </div>
    </div>

    <div class="flex-1 px-6 pb-8">
        <div class="max-w-sm mx-auto">
            <div class="mobile-glass-effect rounded-3xl shadow-xl p-8 mobile-fade-in" style="animation-delay: 0.2s">
                <form id="kc-form-login-mobile" action="${url.loginAction}" method="post" class="space-y-6">
                    <div class="mobile-slide-down" style="animation-delay: 0.3s">
                        <label for="username-mobile" class="block text-sm font-semibold text-gray-700 mb-3">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400 text-lg"></i>
                            </div>
                            <input type="text" id="username-mobile" name="username"
                                   value="${(login.username!'')}"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-4 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   autocomplete="username"
                                   placeholder="Enter your email"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                            <p class="text-red-600 text-sm mt-2 font-medium">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                        </#if>
                    </div>

                    <div class="mobile-slide-down" style="animation-delay: 0.4s">
                        <div class="flex justify-between items-center mb-3">
                            <label for="password-mobile" class="block text-sm font-semibold text-gray-700">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 font-medium">Forgot?</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400 text-lg"></i>
                            </div>
                            <input type="password" id="password-mobile" name="password"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-14 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   placeholder="Enter your password"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePasswordMobile" class="absolute inset-y-0 right-0 pr-4 flex items-center mobile-touch-target">
                                <i class="fas fa-eye text-gray-400 text-lg"></i>
                            </button>
                        </div>
                    </div>

                    <#if realm.rememberMe>
                        <div class="flex items-center mobile-slide-down" style="animation-delay: 0.5s">
                            <input type="checkbox" id="rememberMe-mobile" name="rememberMe"
                                   class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe-mobile" class="ml-3 block text-sm text-gray-700 font-medium">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <div class="mobile-slide-down" style="animation-delay: 0.6s">
                        <input type="hidden" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login-mobile"
                                class="mobile-gradient-btn mobile-btn-active mobile-touch-target w-full py-4 px-6 rounded-2xl text-white font-bold text-lg focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
            </div>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center mt-8 mobile-slide-down" style="animation-delay: 0.7s">
                    <p class="text-gray-600">
                        Don't have an account?
                        <a href="${url.registrationUrl}" class="text-blue-600 font-semibold">Sign up</a>
                    </p>
                </div>
            </#if>

            <div class="mt-8 text-center mobile-slide-down" style="animation-delay: 0.8s">
                <div class="flex justify-center items-center space-x-4 mb-4">
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-shield-alt text-green-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Secure</span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-lock text-blue-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Encrypted</span>
                    </div>
                    <div class="flex items-center space-x-1">
                        <i class="fas fa-users text-purple-500"></i>
                        <span class="text-xs text-gray-600 font-medium">Trusted</span>
                    </div>
                </div>
                <p class="text-xs text-gray-500">
                    Join thousands of professionals growing their careers
                </p>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var togglePassword = document.getElementById("togglePassword");
        var togglePasswordMobile = document.getElementById("togglePasswordMobile");

        if (togglePassword) {
            togglePassword.addEventListener("click", function () {
                var pwd = document.getElementById("password");
                var icon = this.querySelector("i");

                if (pwd.type === "password") {
                    pwd.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
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

                if (pwd.type === "password") {
                    pwd.type = "text";
                    icon.classList.remove("fa-eye");
                    icon.classList.add("fa-eye-slash");
                } else {
                    pwd.type = "password";
                    icon.classList.remove("fa-eye-slash");
                    icon.classList.add("fa-eye");
                }
            });
        }

        var form = document.getElementById("kc-form-login");
        var formMobile = document.getElementById("kc-form-login-mobile");
        var submitBtn = document.getElementById("kc-login");
        var submitBtnMobile = document.getElementById("kc-login-mobile");

        if (form && submitBtn) {
            form.addEventListener("submit", function() {
                submitBtn.disabled = true;
                submitBtn.innerHTML = 'Signing in...';
            });
        }

        if (formMobile && submitBtnMobile) {
            formMobile.addEventListener("submit", function() {
                submitBtnMobile.disabled = true;
                submitBtnMobile.innerHTML = 'Signing in...';
            });
        }
    });
</script>

</#if>
</@layout.registrationLayout>
