<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>BluePay Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css">
    <#elseif section = "form">
        <div class="container-fluid px-0">
            <div class="d-flex flex-row">
                <!-- Desktop Left Panel -->
                <div class="left-panel position-fixed top-0 vh-100 d-none d-lg-block">
                    <img src="${url.resourcesPath}/img/logo.svg" class="mt-5 ms-3" alt="BluePay Logo">
                </div>

                <div class="d-flex align-items-center right-panel">
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

                    <div class="form-container">
                        <div class="mb-5">
                            <h2 class="fw-bold darker-text">${msg("Create Your Account")}</h2>
                            <p class="text-muted dark-text input-small-text">${msg("Provide your basic information")}</p>
                        </div>

                        <form id="kc-register-form" action="${url.registrationAction}" method="post">
                            <div class="mb-3">
                                <label class="form-label input-small-text dark-text">${msg("Country")}<span class="text-danger">*</span></label>
                                <select class="form-select input-field select-field" id="country" name="user.attributes.country" required>
                                    <option selected>${msg("Nigeria")}</option>
                                    <option value="Ghana">Ghana</option>
                                    <option value="Kenya">Kenya</option>
                                    <option value="South Africa">South Africa</option>
                                </select>
                                <div id="country-error" class="text-danger d-none">
                                    Country not supported
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("Business Name")}<span class="text-danger">*</span></label>
                                <input type="text" class="form-control input-field" name="user.attributes.businessName" required>
                                <#if messagesPerField.exists('user.attributes.businessName')>
                                    <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessName')))?no_esc}</div>
                                </#if>
                            </div>

                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label dark-text input-small-text">${msg("firstName")}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control input-field" name="firstName" required>
                                    <#if messagesPerField.exists('firstName')>
                                        <div class="text-danger">${kcSanitize(msg(messagesPerField.get('firstName')))?no_esc}</div>
                                    </#if>
                                </div>
                                <div class="col">
                                    <label class="form-label dark-text input-small-text">${msg("lastName")}<span class="text-danger">*</span></label>
                                    <input type="text" class="form-control input-field" name="lastName" required>
                                    <#if messagesPerField.exists('lastName')>
                                        <div class="text-danger">${kcSanitize(msg(messagesPerField.get('lastName')))?no_esc}</div>
                                    </#if>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("phoneNumber")}<span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-field custom-span">+234</span>
                                    <input type="text"
                                        class="form-control input-field ms-3"
                                        id="phoneNumber"
                                        name="user.attributes.phoneNumber"
                                        maxlength="10"
                                        autocomplete="tel"
                                        inputmode="numeric"
                                        required />
                                </div>
                                <div class="text-secondary input-small-text mt-1 d-none" id="phone-error">Please enter the other 10 digits of your phone number</div>
                                <#if messagesPerField.exists('user.attributes.phoneNumber')>
                                    <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.phoneNumber')))?no_esc}</div>
                                </#if>
                            </div>

                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("email")}<span class="text-danger">*</span></label>
                                <input type="email" class="form-control input-field" id="email" name="email" required>
                                <div class="text-danger input-small-text mt-1 d-none" id="email-error">Please enter a valid email address.</div>
                                <#if messagesPerField.exists('email')>
                                    <div class="text-danger">${kcSanitize(msg(messagesPerField.get('email')))?no_esc}</div>
                                </#if>
                            </div>

                            <div class="mb-3">
                                <label class="form-label input-small-text dark-text">${msg("Business Type")}<span class="text-danger">*</span></label>
                                <select class="form-select select-field input-field" name="user.attributes.businessType" required>
                                    <option value="" disabled selected hidden>${msg("Select Business Type")}</option>
                                    <option value="Business Name Registration">${msg("Business Name Registration")}</option>
                                    <option value="Co-operative Societies">${msg("Co-operative Societies")}</option>
                                    <option value="MDAs(Ministries, Departments & Agencies">${msg("MDAs (Ministries, Departments & Agencies)")}</option>
                                    <option value="Non-Governmental Organizations(NGOs)">${msg("Non-Governmental Organizations (NGOs)")}</option>
                                    <option value="Partnership">${msg("Partnership")}</option>
                                    <option value="Private Limited Liability Company(Ltd)">${msg("Private Limited Liability Company (Ltd)")}</option>
                                    <option value="Public Limited Liability Company(PLC)">${msg("Public Limited Liability Company (PLC)")}</option>
                                </select>
                                <#if messagesPerField.exists('user.attributes.businessType')>
                                    <div class="text-danger">${kcSanitize(msg(messagesPerField.get('user.attributes.businessType')))?no_esc}</div>
                                </#if>
                            </div>

                            <!-- Password Field with Requirements -->
                            <div class="mb-3">
                                <label for="password" class="form-label dark-text input-small-text">${msg("password")}<span class="text-danger">*</span></label>
                                <div class="input-group position-relative">
                                    <input type="password" class="form-control input-field" id="password" name="password" autocomplete="new-password" required>
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="fa-regular fa-eye"></i>
                                    </span>
                                </div>
                                <!-- Password Requirements -->
                                <div class="password-requirements">
                                    <p class="text-dark mb-2 fw-medium">Your password must contain:</p>
                                    <div class="password-requirement" data-requirement="length">
                                        <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                        <span>At least 8 characters</span>
                                    </div>
                                    <div class="password-requirement" data-requirement="uppercase">
                                        <img src="${url.resourcesCommonPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                        <span>At least 1 Uppercase character (A-Z)</span>
                                    </div>
                                    <div class="password-requirement" data-requirement="lowercase">
                                        <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                        <span>At least 1 lower case character (a-z)</span>
                                    </div>
                                    <div class="password-requirement" data-requirement="digit">
                                        <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                        <span>At least 1 digit (0 - 9)</span>
                                    </div>
                                    <div class="password-requirement" data-requirement="special">
                                        <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                        <span>At least 1 special character (~!@#$)</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Confirm Password Field -->
                            <div class="mb-3">
                                <label for="password-confirm" class="form-label dark-text input-small-text">${msg("Confirm Password")}<span class="text-danger">*</span></label>
                                <div class="input-group position-relative">
                                    <input type="password" class="form-control input-field" id="password-confirm" name="password-confirm" autocomplete="new-password" required>
                                    <span class="password-toggle" id="toggleConfirmPassword">
                                        <i class="fa-regular fa-eye"></i>
                                    </span>
                                </div>
                                <div class="password-error">Passwords must match!</div>
                            </div>

                            <div class="mb-3 mt-4">
                                <button type="submit" class="btn btn-primary w-100" id="registerButton" disabled>
                                    ${msg("doRegisterSecurityKey")}
                                </button>
                            </div>

                            <div class="mt-3">
                                <p>By clicking the "Register" button, you agree to <a href="">BluePay's privacy policy</a> and <a href="">terms of acceptable use and data processing.</a></p>
                                <hr />
                                <p class="text-center">${msg("Already have an account?")} <a href="${url.loginUrl}">${msg("login")}</a></p>
                            </div>
                        </form>

                        <!-- Mobile Footer Links -->
                        <div class="mobile-footer-links d-lg-none">
                            <a href="${url.loginUrl}" class="mobile-footer-link">Sign in instead</a>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Pass the resource path to JavaScript
            window.resourcesPath = "${url.resourcesPath}";
        </script>
        <script src="${url.resourcesPath}/js/script.js"></script>
    </#if>
</@layout.registrationLayout>
