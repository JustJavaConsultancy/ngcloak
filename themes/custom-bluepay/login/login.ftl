<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>BluePay - Login</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome for eye icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
    <#elseif section = "form">
        <div class="container-fluid p-0 vh-100">
            <div class="row g-0 h-100">
                <!-- Left Panel -->
                <div class="col-lg-5 d-none d-lg-block position-relative left-panel">
                    <div class="left-content">
                        <img src="${url.resourcesPath}/img/man.png" class="img-cover">
                        <div class="content">
                            <h1 class="text-white mb-3">Enjoy Seamless Payment</h1>
                            <p class="text-white mb-5">Effortlessly work together with your<br>team in real-time.</p>

                            <!-- Dots indicator -->
                            <div class="dots-indicator">
                                <span class="dot active"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Panel -->
                <div class="col-lg-7 right-panel d-flex align-items-center justify-content-center">
                    <!-- Mobile Header (visible only on mobile) -->
                    <div class="mobile-header d-lg-none">
                        <div class="mobile-logo">
                            <div class="mobile-logo-icon">
                                <i class="fas fa-shield-alt"></i>
                            </div>
                            BluePay
                        </div>
                        <div class="mobile-tagline">Secure payments made simple</div>
                    </div>

                    <div class="login-container">
                        <!-- Desktop Logo (hidden on mobile) -->
                        <div class="mb-5 d-none d-lg-block">
                            <img src="${url.resourcesPath}/img/blue-logo.svg" alt="BluePay" class="logo">
                        </div>

                        <h2 class="fw-bold mb-2 login-header">Log in to your account</h2>
                        <p class="text-muted mb-4 login-p">Enter your details to login</p>

                        <!-- Keycloak Login Form -->
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <!-- Username/Email Field -->
                            <div class="mb-4">
                                <label for="username" class="form-label">
                                    <#if !realm.loginWithEmailAllowed>${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                    <#else>${msg("email")}</#if>
                                </label>
                                <input type="text" class="form-control custom-input " id="username" name="username" value="${(login.username!'')}" autofocus autocomplete="username"
                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="form-error" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-3">
                                <label for="password" class="form-label">${msg("password")}</label>
                                <div class="position-relative">
                                    <input type="password" class="form-control custom-input" id="password" name="password" autocomplete="current-password"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="fa-regular fa-eye"></i>
                                    </span>
                                </div>
                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="form-error" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <!-- Remember Me and Forgot Password (Mobile Layout) -->
                            <div class="mobile-remember-forgot d-lg-none">
                                <label class="mobile-remember-me">
                                    <input type="checkbox" id="remember-mobile" />
                                    Remember me
                                </label>
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>

                            <!-- Forgot Password Link (Desktop) -->
                            <div class="mb-4 d-none d-lg-block">
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>


                            <!-- Login Button -->
                            <button type="submit" class="btn btn-login w-100 mb-4" id="kc-login">${msg("doLogIn")}</button>

                            <!-- Registration Link -->
                            <div class="text-center">
                                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                    <span class="text-muted">${msg("noAccount")}</span>
                                    <a href="${url.registrationUrl}" class="signup-link">${msg("doRegister")}</a>
                                </#if>
                            </div>
                        </form>

                        <!-- Mobile Footer Links -->
                        <div class="mobile-footer-links d-lg-none">
                            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                <a href="${url.registrationUrl}" class="mobile-footer-link">Create account</a>
                            </#if>
                            <a href="#" class="mobile-footer-link">Help Center</a>
                        </div>

                        <!-- Mobile Security Note -->
                        <div class="mobile-security-note d-lg-none">
                            <i class="fas fa-lock"></i>
                            Your information is securely encrypted
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${url.resourcesPath}/js/login.js"></script>

    </#if>
</@layout.registrationLayout>
