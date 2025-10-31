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

        /* Mobile-optimized animations */
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

        /* Mobile-specific touch targets */
        .mobile-touch-target {
            min-height: 48px;
            min-width: 48px;
        }

        /* Prevent zoom on input focus */
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            font-size: 16px;
        }

        /* Mobile gradient text */
        .mobile-gradient-text {
            background: linear-gradient(90deg, #2a5dea, #8a3ffc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
    </style>
<#elseif section = "form">

<body class="bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen"
      style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif">

<!-- Mobile-optimized background -->
<div class="fixed inset-0 overflow-hidden z-0">
    <div class="absolute -top-10 -left-10 w-40 h-40 bg-blue-200 rounded-full opacity-20"></div>
    <div class="absolute top-1/4 -right-10 w-32 h-32 bg-purple-200 rounded-full opacity-20"></div>
    <div class="absolute bottom-20 left-1/4 w-28 h-28 bg-indigo-200 rounded-full opacity-20"></div>
</div>

<!-- Mobile login container -->
<div class="relative z-10 min-h-screen flex flex-col">
    <!-- Header -->
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

    <!-- Main content -->
    <div class="flex-1 px-6 pb-8">
        <div class="max-w-sm mx-auto">
            <div class="mobile-glass-effect rounded-3xl shadow-xl p-8 mobile-fade-in" style="animation-delay: 0.2s">
                <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-6">
                    <!-- Username/Email -->
                    <div class="mobile-slide-down" style="animation-delay: 0.3s">
                        <label for="username" class="block text-sm font-semibold text-gray-700 mb-3">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400 text-lg"></i>
                            </div>
                            <input type="text" id="username" name="username"
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

                    <!-- Password -->
                    <div class="mobile-slide-down" style="animation-delay: 0.4s">
                        <div class="flex justify-between items-center mb-3">
                            <label for="password" class="block text-sm font-semibold text-gray-700">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 font-medium">Forgot?</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400 text-lg"></i>
                            </div>
                            <input type="password" id="password" name="password"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-14 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   placeholder="Enter your password"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-4 flex items-center mobile-touch-target">
                                <i class="fas fa-eye text-gray-400 text-lg"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <#if realm.rememberMe>
                        <div class="flex items-center mobile-slide-down" style="animation-delay: 0.5s">
                            <input type="checkbox" id="rememberMe" name="rememberMe"
                                   class="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe" class="ml-3 block text-sm text-gray-700 font-medium">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <!-- Submit Button -->
                    <div class="mobile-slide-down" style="animation-delay: 0.6s">
                        <input type="hidden" name="credentialId" id="id-hidden-input"
                               <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login"
                                class="mobile-gradient-btn mobile-btn-active mobile-touch-target w-full py-4 px-6 rounded-2xl text-white font-bold text-lg focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
            </div>

            <!-- Sign up link -->
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div class="text-center mt-8 mobile-slide-down" style="animation-delay: 0.7s">
                    <p class="text-gray-600">
                        Don't have an account?
                        <a href="${url.registrationUrl}" class="text-blue-600 font-semibold">Sign up</a>
                    </p>
                </div>
            </#if>

            <!-- Trust indicators -->
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
    // Password toggle functionality
    document.getElementById("togglePassword").addEventListener("click", function () {
        const pwd = document.getElementById("password");
        const icon = this.querySelector("i");

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

    // Enhanced mobile form validation
    const form = document.getElementById("kc-form-login");
    const submitBtn = document.getElementById("kc-login");

    form.addEventListener("submit", function(e) {
        submitBtn.disabled = true;
        submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Signing in...';
    });

    // Auto-focus first input on load
    window.addEventListener("load", function() {
        document.getElementById("username").focus();
    });
</script>

</#if>
</@layout.registrationLayout>
