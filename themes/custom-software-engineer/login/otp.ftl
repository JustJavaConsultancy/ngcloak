<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('totp'); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <title>DevFlow - Two-Factor Authentication</title>
        <script src="https://cdn.tailwindcss.com?plugins=forms,typography"></script>
        <link
                href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
                rel="stylesheet"
        />
        <link
                href="https://fonts.googleapis.com/icon?family=Material+Icons"
                rel="stylesheet"
        />
        <script>
            tailwind.config = {
                darkMode: "class",
                theme: {
                    extend: {
                        colors: {
                            primary: "#6366F1",
                            "background-light": "#F8FAFC",
                            "background-dark": "#0F172A",
                            "card-light": "#FFFFFF",
                            "card-dark": "#1E293B",
                            "text-light": "#0F172A",
                            "text-dark": "#F8FAFC",
                            "text-secondary-light": "#64748B",
                            "text-secondary-dark": "#94A3B8",
                        },
                        fontFamily: {
                            display: ["Inter", "sans-serif"],
                        },
                        borderRadius: {
                            DEFAULT: "0.75rem",
                        },
                    },
                },
            };
        </script>
        <style>
            body {
                font-family: "Inter", sans-serif;
            }

            .textt {
                color: white !important;
            }

            #kc-info-wrapper {
                display: none;
            }

            .login-pf-page .card-pf {
                padding: 0px;
                margin-bottom: 0;
            }

            .login-pf-header, .login-pf-page-header {
                display: none !important;
            }

            .login-pf-page {
                padding-top: 0px;
            }

            .card-pf {
                max-width: 15000px !important;
                padding: 0;
                border-top: 0px solid transparent;
            }

            @media (min-width: 768px) {
                .login-pf-page .card-pf {
                    padding: 0px;
                }
            }

            #kc-content-wrapper {
                margin-top: 0px;
            }

            #kc-info {
                margin: 0px;
            }

            html, body {
                overflow-x: hidden;
            }

            /* Custom responsive adjustments */
            @media (max-width: 640px) {
                .mobile-padding {
                    padding: 1.5rem 1rem;
                }
                .mobile-text-center {
                    text-align: center;
                }
            }

            @media (max-width: 768px) {
                .mobile-stack {
                    flex-direction: column;
                }
                .mobile-full-width {
                    width: 100%;
                }
            }

            .input-container {
                position: relative;
            }

            .input-icon {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: #64748b;
            }

            .input-with-icon {
                padding-left: 2.5rem;
            }
        </style>

        <div class="bg-background-light dark:bg-background-dark text-text-light dark:text-text-dark font-display min-h-screen">
            <div class="flex flex-col md:flex-row w-full min-h-screen">
                <!-- Info Section - Left Side on Desktop, Bottom on Mobile -->
                <div
                        class="w-full md:w-1/2 bg-primary p-6 sm:p-8 md:p-12 flex flex-col items-center justify-center text-white order-2 md:order-1 mobile-full-width"
                >
                    <div
                            class="max-w-sm sm:max-w-md mx-auto w-full flex flex-col items-center justify-center h-full py-4 md:py-0"
                    >
            <span
                    class="material-icons text-white"
                    style="font-size: clamp(64px, 15vw, 96px); opacity: 0.8"
            >security</span
            >
                        <h2 class="text-2xl sm:text-3xl font-bold mt-4 sm:mt-6 text-center">
                            Secure Authentication
                        </h2>
                        <p
                                class="mt-3 sm:mt-4 text-center text-indigo-200 text-sm sm:text-base textt"
                        >
                            Enter your two-factor authentication code to securely access your DevFlow account and continue your development journey.
                        </p>
                        <div class="flex justify-center space-x-2 mt-8">
                            <div
                                    class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                                    style="animation-delay: 0s"
                            ></div>
                            <div
                                    class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                                    style="animation-delay: 0.2s"
                            ></div>
                            <div
                                    class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                                    style="animation-delay: 0.4s"
                            ></div>
                        </div>
                    </div>
                </div>

                <!-- OTP Form Section - Right Side on Desktop, Top on Mobile -->
                <div
                        class="w-full md:w-1/2 p-6 sm:p-8 md:p-10 lg:p-12 flex flex-col justify-center bg-card-light dark:bg-card-dark order-1 md:order-2 mobile-full-width"
                >
                    <div class="max-w-xs sm:max-w-sm md:max-w-md mx-auto w-full">
                        <div class="mb-6 sm:mb-8 mobile-text-center md:text-left">
                            <div
                                    class="flex items-center space-x-2 justify-center md:justify-start"
                            >
                <span
                        class="material-icons text-primary"
                        style="font-size: 32px; font-size: 36px"
                >hub</span
                >
                                <h1
                                        class="text-2xl sm:text-3xl font-bold text-text-light dark:text-text-dark"
                                >
                                    DevFlow
                                </h1>
                            </div>
                            <p
                                    class="mt-2 text-text-secondary-light dark:text-text-secondary-dark text-sm sm:text-base"
                            >
                                Seamless development, powered by AI.
                            </p>
                        </div>

                        <h2
                                class="text-xl sm:text-2xl font-bold mb-3 sm:mb-4 mobile-text-center md:text-left"
                        >
                            Two-Factor Authentication
                        </h2>
                        <p
                                class="text-text-secondary-light dark:text-text-secondary-dark mb-6 sm:mb-8 text-sm sm:text-base mobile-text-center md:text-left"
                        >
                            Please enter your authentication code to continue securely.
                        </p>

                        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="p-4 rounded-lg mb-4 <#if message.type = 'error'>bg-red-50 text-red-800 border border-red-200<#elseif message.type = 'success'>bg-green-50 text-green-800 border border-green-200<#else>bg-blue-50 text-blue-800 border border-blue-200</#if>">
                                ${kcSanitize(message.summary)?no_esc}
                            </div>
                        </#if>

                        <form action="${url.loginAction}" method="post" class="space-y-4 sm:space-y-6">
                            <div>
                                <label
                                        class="block text-sm font-medium text-text-secondary-light dark:text-text-secondary-dark mb-1"
                                        for="otp"
                                >
                                    Authentication Code
                                </label>
                                <div class="input-container">
                                    <span class="material-icons input-icon text-lg">vpn_key</span>
                                    <input
                                            id="otp"
                                            name="otp"
                                            type="text"
                                            autofocus
                                            autocomplete="one-time-code"
                                            class="w-full px-3 py-2 sm:px-4 sm:py-3 rounded-lg bg-background-light dark:bg-background-dark border border-slate-300 dark:border-slate-700 focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent transition text-sm sm:text-base input-with-icon <#if messagesPerField.existsError('totp')>border-red-500 focus:ring-red-500</#if>"
                                            placeholder="Enter 6-digit code"
                                            maxlength="6"
                                            pattern="[0-9]{6}"
                                    />
                                </div>
                                <#if messagesPerField.existsError('totp')>
                                    <div class="text-red-600 text-sm mt-1">
                                        ${kcSanitize(messagesPerField.getFirstError('totp'))?no_esc}
                                    </div>
                                </#if>
                            </div>

                            <button
                                    class="w-full bg-primary text-white py-2 sm:py-3 px-4 rounded-lg font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary focus:ring-offset-background-light dark:focus:ring-offset-background-dark transition duration-300 flex items-center justify-center text-sm sm:text-base"
                                    type="submit"
                            >
                                <span>Verify Code</span>
                                <span class="material-icons ml-2 text-base sm:text-lg">verified_user</span>
                            </button>
                        </form>

                        <div
                                class="mt-6 sm:mt-8 text-center text-xs sm:text-sm text-text-secondary-light dark:text-text-secondary-dark"
                        >
                            <p>
                                Having trouble with your authentication code?
                            </p>
                            <p class="mt-1">
                                Contact your administrator for assistance.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
