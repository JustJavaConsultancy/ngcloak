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
            background: linear-gradient(135deg, #f0f4ff 0%, #e0e7ff 100%);
            font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif;
            min-height: 100vh;
        }

        .login-pf-page .card-pf {
            padding: 0;
            margin-bottom: 0;
            border: none;
            max-width: none;
            background: transparent;
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

        .fade-in {
            animation: fadeInUp 0.5s ease-out forwards;
        }

        .slide-down {
            animation: slideDown 0.3s ease-out forwards;
        }

        .gradient-btn {
            background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
            background-size: 400% 400%;
            animation: gradientShift 6s ease infinite;
        }

        .input-focus:focus {
            box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
            border-color: #2a5dea;
        }

        .glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        .btn-active:active {
            transform: scale(0.98);
        }

        .touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        .gradient-text {
            background: linear-gradient(90deg, #2a5dea, #8a3ffc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Responsive design */
        @media (min-width: 1024px) {
            .desktop-layout {
                display: flex !important;
            }
            .mobile-layout {
                display: none !important;
            }
        }

        @media (max-width: 1023px) {
            .desktop-layout {
                display: none !important;
            }
            .mobile-layout {
                display: block !important;
            }
            input[type="text"],
            input[type="email"],
            input[type="password"] {
                font-size: 1rem;
            }
        }

        /* Background elements */
        .bg-element {
            position: fixed;
            border-radius: 50%;
            opacity: 0.2;
            z-index: 0;
        }

        .bg-element-1 {
            top: -2.5rem;
            left: -2.5rem;
            width: 10rem;
            height: 10rem;
            background-color: #dbeafe;
            animation: float 4s infinite ease-in-out;
        }

        .bg-element-2 {
            top: 25%;
            right: -2.5rem;
            width: 8rem;
            height: 8rem;
            background-color: #e9d5ff;
            animation: float 4s infinite ease-in-out;
            animation-delay: 1s;
        }

        .bg-element-3 {
            bottom: 5rem;
            left: 25%;
            width: 7rem;
            height: 7rem;
            background-color: #c7d2fe;
            animation: float 4s infinite ease-in-out;
            animation-delay: 2s;
        }

        @media (min-width: 1024px) {
            .bg-element-1 {
                top: -5rem;
                left: -5rem;
                width: 18rem;
                height: 18rem;
            }
            .bg-element-2 {
                width: 16rem;
                height: 16rem;
            }
            .bg-element-3 {
                width: 14rem;
                height: 14rem;
            }
        }
    </style>
<#elseif section = "form">

<!-- Background elements -->
<div class="bg-element bg-element-1"></div>
<div class="bg-element bg-element-2"></div>
<div class="bg-element bg-element-3"></div>

<!-- Desktop layout -->
<div class="desktop-layout min-h-screen relative z-10">
    <!-- Left branding panel -->
    <div class="w-1/2 p-12 bg-gradient-to-br from-blue-600 to-purple-600 text-white flex flex-col justify-between">
        <div class="flex items-center gap-3 mb-12 fade-in">
            <div class="w-10 h-10">
                <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/>
                </svg>
            </div>
            <h1 class="text-2xl font-bold">Connect</h1>
        </div>
        <div class="max-w-md fade-in" style="animation-delay: 0.3s">
            <h2 class="text-4xl font-bold mb-6">Join our community of professionals</h2>
            <p class="text-lg opacity-90 mb-8">Connect with coaches, expand your network, and accelerate your career growth with our platform.</p>
            <div class="space-y-6">
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-users text-white"></i>
                    </div>
                    <p class="text-lg">Connect with industry experts</p>
                </div>
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-graduation-cap text-white"></i>
                    </div>
                    <p class="text-lg">Personalized coaching sessions</p>
                </div>
                <div class="flex items-center">
                    <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                        <i class="fas fa-briefcase text-white"></i>
                    </div>
                    <p class="text-lg">Career advancement opportunities</p>
                </div>
            </div>
        </div>
        <div class="fade-in" style="animation-delay: 0.6s">
            <div class="flex items-center space-x-2 mb-4">
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
                <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
                    <img src="https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
                </div>
            </div>
            <p class="text-sm opacity-80">
                Join thousands of professionals who are already growing their careers with Connect
            </p>
        </div>
    </div>

    <!-- Right login form -->
    <div class="w-1/2 flex items-center justify-center p-8">
        <div class="w-full max-w-md">
            <div class="glass-effect rounded-2xl shadow-xl p-8 fade-in" style="animation-delay: 0.2s">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Welcome back</h2>
                <p class="text-gray-600 mb-6 text-sm">Sign in to your account to continue</p>

                <#if realm.password>
                    <form id="kc-form-login" class="space-y-5" action="${url.loginAction}" method="post" onsubmit="login.disabled = true; return true;">
                        <div>
                            <label for="username" class="block text-sm font-medium text-gray-700 mb-1">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>${msg("email")}</#if>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </div>
                                <input type="text" id="username" name="username"
                                       value="${(login.username!'')}"
                                       class="input-focus pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                       autocomplete="username"
                                       placeholder="you@example.com"
                                       autofocus
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                            </div>
                            <#if messagesPerField.existsError('username','password')>
                                <p class="text-red-600 text-sm mt-1">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                            </#if>
                        </div>

                        <div>
                            <div class="flex justify-between items-center mb-1">
                                <label for="password" class="block text-sm font-medium text-gray-700">${msg("password")}</label>
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 hover:text-blue-800 transition-colors">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input type="password" id="password" name="password"
                                       class="input-focus pl-10 pr-12 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                       placeholder="••••••••"
                                       autocomplete="current-password"/>
                                <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                    <i class="fas fa-eye text-gray-400 hover:text-gray-600"></i>
                                </button>
                            </div>
                        </div>

                        <#if realm.rememberMe>
                            <div class="flex items-center">
                                <input type="checkbox" id="rememberMe" name="rememberMe"
                                       class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                       <#if login.rememberMe??>checked</#if>/>
                                <label for="rememberMe" class="ml-2 block text-sm text-gray-700">${msg("rememberMe")}</label>
                            </div>
                        </#if>

                        <div>
                            <input type="hidden" name="credentialId" id="id-hidden-input"
                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button type="submit" id="kc-login" name="login"
                                    class="gradient-btn w-full py-3 px-4 rounded-lg text-white font-medium transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                ${msg("doLogIn")}
                            </button>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    </div>
</div>

<!-- Mobile layout -->
<div class="mobile-layout relative z-10 min-h-screen flex flex-col">
    <div class="flex-shrink-0 pt-12 pb-8 px-6">
        <div class="text-center fade-in">
            <div class="inline-flex items-center justify-center mb-4">
                <div class="w-16 h-16">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                    </svg>
                </div>
            </div>
            <h1 class="text-4xl font-bold gradient-text mb-2">Connect</h1>
            <p class="text-gray-600 text-lg">Welcome back</p>
        </div>
    </div>

    <div class="flex-1 px-6 pb-8">
        <div class="max-w-sm mx-auto">
            <div class="glass-effect rounded-3xl shadow-xl p-8 fade-in" style="animation-delay: 0.2s">
                <#if realm.password>
                    <form id="kc-form-login-mobile" action="${url.loginAction}" method="post" class="space-y-6" onsubmit="login.disabled = true; return true;">
                        <div class="slide-down" style="animation-delay: 0.3s">
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
                                       class="input-focus touch-target pl-12 pr-4 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                       autocomplete="username"
                                       placeholder="Enter your email"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                            </div>
                            <#if messagesPerField.existsError('username','password')>
                                <p class="text-red-600 text-sm mt-2 font-medium">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                            </#if>
                        </div>

                        <div class="slide-down" style="animation-delay: 0.4s">
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
                                       class="input-focus touch-target pl-12 pr-14 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                       placeholder="Enter your password"
                                       autocomplete="current-password"/>
                                <button type="button" id="togglePasswordMobile" class="absolute inset-y-0 right-0 pr-4 flex items-center touch-target">
                                    <i class="fas fa-eye text-gray-400 text-lg"></i>
                                </button>
                            </div>
                        </div>

                        <#if realm.rememberMe>
                            <div class="flex items-center slide-down" style="animation-delay: 0.5s">
                                <input type="checkbox" id="rememberMe-mobile" name="rememberMe"
                                       class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                       <#if login.rememberMe??>checked</#if>/>
                                <label for="rememberMe-mobile" class="ml-3 block text-sm text-gray-700 font-medium">${msg("rememberMe")}</label>
                            </div>
                        </#if>

                        <div class="slide-down" style="animation-delay: 0.6s">
                            <input type="hidden" name="credentialId" id="id-hidden-input-mobile"
                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button type="submit" id="kc-login-mobile" name="login"
                                    class="gradient-btn btn-active touch-target w-full py-4 px-6 rounded-2xl text-white font-bold text-lg focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200">
                                ${msg("doLogIn")}
                            </button>
                        </div>
                    </form>
                </#if>
            </div>

            <div class="mt-8 text-center slide-down" style="animation-delay: 0.8s">
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
        // Password toggle for desktop
        const togglePassword = document.getElementById("togglePassword");
        if (togglePassword) {
            togglePassword.addEventListener("click", function () {
                const pwd = document.getElementById("password");
                const icon = this.querySelector("i");
                if (pwd && icon) {
                    if (pwd.type === "password") {
                        pwd.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        pwd.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                }
            });
        }

        // Password toggle for mobile
        const togglePasswordMobile = document.getElementById("togglePasswordMobile");
        if (togglePasswordMobile) {
            togglePasswordMobile.addEventListener("click", function () {
                const pwd = document.getElementById("password-mobile");
                const icon = this.querySelector("i");
                if (pwd && icon) {
                    if (pwd.type === "password") {
                        pwd.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");
                    } else {
                        pwd.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                }
            });
        }

        // Form submission handling
        const forms = ["kc-form-login", "kc-form-login-mobile"];
        const buttons = ["kc-login", "kc-login-mobile"];

        forms.forEach(function(formId, index) {
            const form = document.getElementById(formId);
            const button = document.getElementById(buttons[index]);
            if (form && button) {
                form.addEventListener("submit", function() {
                    button.disabled = true;
                    button.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Signing in...';
                });
            }
        });

        // Auto-focus
        const isDesktop = window.innerWidth >= 1024;
        const usernameInput = document.getElementById(isDesktop ? "username" : "username-mobile");
        if (usernameInput && !usernameInput.value) {
            usernameInput.focus();
        }
    });
</script>

<#elseif section = "info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <div class="desktop-layout">
            <div class="w-1/2"></div>
            <div class="w-1/2 flex items-center justify-center">
                <div class="w-full max-w-md">
                    <p class="text-center text-sm text-gray-600 mt-4">
                        Don't have an account?
                        <a href="${url.registrationUrl}" class="text-blue-600 hover:underline">Create one</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="mobile-layout">
            <div class="text-center mt-8 slide-down" style="animation-delay: 0.7s">
                <p class="text-gray-600">
                    Don't have an account?
                    <a href="${url.registrationUrl}" class="text-blue-600 font-semibold">Sign up</a>
                </p>
            </div>
        </div>
    </#if>
</#if>
</@layout.registrationLayout>
