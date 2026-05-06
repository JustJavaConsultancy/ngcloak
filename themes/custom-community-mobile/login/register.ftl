<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>Connect - Sign Up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&family=Be+Vietnam+Pro:wght@400;500;700;900&family=Noto+Sans:wght@400;500;700;900"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
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

        .general-error {
            color: #dc2626 !important;
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

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-3px); }
            75% { transform: translateX(3px); }
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

        .mobile-input-error {
            border-color: #dc2626;
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.1);
        }

        .mobile-glass-effect {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
        }

        .mobile-btn-active:active {
            transform: scale(0.98);
        }

        .mobile-shake {
            animation: shake 0.3s ease-in-out;
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

        /* Progress indicator */
        .progress-step {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: #e5e7eb;
            transition: background-color 0.3s ease;
        }

        .progress-step.active {
            background-color: #2a5dea;
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

<!-- Mobile registration container -->
<div class="relative z-10 min-h-screen flex flex-col">
    <!-- Header -->
    <div class="flex-shrink-0 pt-12 pb-6 px-6">
        <div class="text-center mobile-fade-in">
            <div class="inline-flex items-center justify-center mb-4">
                <div class="w-16 h-16">
                    <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                    </svg>
                </div>
            </div>
            <h1 class="text-4xl font-bold mobile-gradient-text mb-2">Clubknit</h1>
            <p class="text-gray-600 text-lg">Create your account</p>
        </div>
    </div>

    <!-- Progress indicator -->
    <div class="flex justify-center px-6 mb-6">
        <div class="flex space-x-2">
            <div class="progress-step active" id="step-1"></div>
            <div class="progress-step" id="step-2"></div>
            <div class="progress-step" id="step-3"></div>
            <div class="progress-step" id="step-4"></div>
        </div>
    </div>

    <!-- Main content -->
    <div class="flex-1 px-6 pb-8">
        <div class="max-w-sm mx-auto">
            <div class="mobile-glass-effect rounded-3xl shadow-xl p-8 mobile-fade-in" style="animation-delay: 0.2s">
                <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-6">
                    <!-- First Name -->
                    <div class="mobile-slide-down" style="animation-delay: 0.3s">
                        <label for="firstName" class="block text-sm font-semibold text-gray-700 mb-3">${msg("firstName")}</label>
                        <input type="text" id="firstName" name="firstName"
                               class="mobile-input-focus mobile-touch-target px-4 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                               placeholder="First name"
                               autocomplete="given-name"
                               required/>
                        <p id="firstName-error" class="text-red-600 text-sm mt-2 font-medium general-error hidden">Please enter your first name.</p>
                    </div>

                    <!-- Last Name -->
                    <div class="mobile-slide-down" style="animation-delay: 0.4s">
                        <label for="lastName" class="block text-sm font-semibold text-gray-700 mb-3">${msg("lastName")}</label>
                        <input type="text" id="lastName" name="lastName"
                               class="mobile-input-focus mobile-touch-target px-4 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                               placeholder="Last name"
                               autocomplete="family-name"
                               required/>
                        <p id="lastName-error" class="text-red-600 text-sm mt-2 font-medium general-error hidden">Please enter your last name.</p>
                    </div>

                    <!-- Email -->
                    <div class="mobile-slide-down" style="animation-delay: 0.5s">
                        <label for="email" class="block text-sm font-semibold text-gray-700 mb-3">${msg("email")}</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400 text-lg"></i>
                            </div>
                            <input type="email" id="email" name="email"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-4 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   placeholder="your@email.com"
                                   autocomplete="email"
                                   required/>
                        </div>
                        <p id="email-error" class="text-red-600 text-sm mt-2 font-medium general-error hidden">Please enter a valid email address.</p>
                    </div>

                    <!-- Password -->
                    <div class="mobile-slide-down" style="animation-delay: 0.6s">
                        <label for="password" class="block text-sm font-semibold text-gray-700 mb-3">${msg("password")}</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400 text-lg"></i>
                            </div>
                            <input type="password" id="password" name="password"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-14 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   placeholder="Create password"
                                   autocomplete="new-password"
                                   required/>
                            <button type="button" id="toggle-password" class="absolute inset-y-0 right-0 pr-4 flex items-center mobile-touch-target">
                                <i class="fas fa-eye text-gray-400 text-lg"></i>
                            </button>
                        </div>
                        <p id="password-error" class="text-red-600 text-sm mt-2 font-medium general-error hidden">
                            Password must be at least 8 characters with uppercase, lowercase, and special character.
                        </p>
                        <!-- Password strength indicator -->
                        <div class="mt-2">
                            <div class="flex space-x-1">
                                <div class="h-1 flex-1 bg-gray-200 rounded" id="strength-1"></div>
                                <div class="h-1 flex-1 bg-gray-200 rounded" id="strength-2"></div>
                                <div class="h-1 flex-1 bg-gray-200 rounded" id="strength-3"></div>
                                <div class="h-1 flex-1 bg-gray-200 rounded" id="strength-4"></div>
                            </div>
                            <p id="strength-text" class="text-xs text-gray-500 mt-1">Password strength</p>
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="mobile-slide-down" style="animation-delay: 0.7s">
                        <label for="password-confirm" class="block text-sm font-semibold text-gray-700 mb-3">${msg("passwordConfirm")}</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400 text-lg"></i>
                            </div>
                            <input type="password" id="password-confirm" name="password-confirm"
                                   class="mobile-input-focus mobile-touch-target pl-12 pr-14 py-4 rounded-2xl border-2 border-gray-200 focus:outline-none w-full text-lg transition-all duration-200"
                                   placeholder="Confirm password"
                                   autocomplete="new-password"
                                   required/>
                            <button type="button" id="toggle-password-confirm" class="absolute inset-y-0 right-0 pr-4 flex items-center mobile-touch-target">
                                <i class="fas fa-eye text-gray-400 text-lg"></i>
                            </button>
                        </div>
                        <p id="password-confirm-error" class="text-red-600 text-sm mt-2 font-medium general-error hidden">
                            Passwords do not match.
                        </p>
                    </div>

                    <!-- Submit Button -->
                    <div class="mobile-slide-down" style="animation-delay: 0.8s">
                        <button type="submit" id="register-btn"
                                class="mobile-gradient-btn mobile-btn-active mobile-touch-target w-full py-4 px-6 rounded-2xl text-white font-bold text-lg focus:outline-none focus:ring-4 focus:ring-blue-300 transition-all duration-200 opacity-50 cursor-not-allowed"
                                disabled>
                            ${msg("doRegister")}
                        </button>
                    </div>
                </form>
            </div>

            <!-- Login link -->
            <div class="text-center mt-8 mobile-slide-down" style="animation-delay: 0.9s">
                <p class="text-gray-600">
                    Already have an account?
                    <a href="${url.loginUrl}" class="text-blue-600 font-semibold">Sign in</a>
                </p>
            </div>

            <!-- Benefits -->
            <div class="mt-8 space-y-3 mobile-slide-down" style="animation-delay: 1s">
                <div class="flex items-center space-x-3 text-sm text-gray-600">
                    <i class="fas fa-check-circle text-green-500"></i>
                    <span>Connect with industry experts</span>
                </div>
                <div class="flex items-center space-x-3 text-sm text-gray-600">
                    <i class="fas fa-check-circle text-green-500"></i>
                    <span>Personalized coaching sessions</span>
                </div>
                <div class="flex items-center space-x-3 text-sm text-gray-600">
                    <i class="fas fa-check-circle text-green-500"></i>
                    <span>Career advancement opportunities</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Form elements
    const firstNameInput = document.getElementById('firstName');
    const lastNameInput = document.getElementById('lastName');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const confirmInput = document.getElementById('password-confirm');
    const registerBtn = document.getElementById('register-btn');

    // Error elements
    const firstNameError = document.getElementById('firstName-error');
    const lastNameError = document.getElementById('lastName-error');
    const emailError = document.getElementById('email-error');
    const passwordError = document.getElementById('password-error');
    const confirmError = document.getElementById('password-confirm-error');

    // Progress steps
    const steps = [
        document.getElementById('step-1'),
        document.getElementById('step-2'),
        document.getElementById('step-3'),
        document.getElementById('step-4')
    ];

    // Password toggle functionality
    document.getElementById('toggle-password').addEventListener('click', function() {
        togglePasswordVisibility('password', this);
    });

    document.getElementById('toggle-password-confirm').addEventListener('click', function() {
        togglePasswordVisibility('password-confirm', this);
    });

    function togglePasswordVisibility(inputId, button) {
        const input = document.getElementById(inputId);
        const icon = button.querySelector('i');

        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    // Validation functions
    function validateFirstName() {
        const valid = firstNameInput.value.trim().length > 0;
        toggleError(firstNameInput, firstNameError, valid);
        updateProgress(0, valid);
        return valid;
    }

    function validateLastName() {
        const valid = lastNameInput.value.trim().length > 0;
        toggleError(lastNameInput, lastNameError, valid);
        updateProgress(1, valid);
        return valid;
    }

    function validateEmail() {
        const valid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value);
        toggleError(emailInput, emailError, valid);
        updateProgress(2, valid);
        return valid;
    }

    function validatePassword() {
        const password = passwordInput.value;
        const valid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$/.test(password);
        toggleError(passwordInput, passwordError, valid);
        updatePasswordStrength(password);
        return valid;
    }

    function validateConfirmPassword() {
        const valid = confirmInput.value === passwordInput.value && passwordInput.value.length > 0;
        toggleError(confirmInput, confirmError, valid);
        updateProgress(3, valid);
        return valid;
    }

    function toggleError(input, errorElement, isValid) {
        if (isValid || input.value === '') {
            input.classList.remove('mobile-input-error');
            errorElement.classList.add('hidden');
        } else {
            input.classList.add('mobile-input-error', 'mobile-shake');
            errorElement.classList.remove('hidden');
            setTimeout(() => input.classList.remove('mobile-shake'), 300);
        }
    }

    function updateProgress(stepIndex, isValid) {
        if (isValid) {
            steps[stepIndex].classList.add('active');
        } else {
            steps[stepIndex].classList.remove('active');
        }
    }

    function updatePasswordStrength(password) {
        const strengthBars = [
            document.getElementById('strength-1'),
            document.getElementById('strength-2'),
            document.getElementById('strength-3'),
            document.getElementById('strength-4')
        ];
        const strengthText = document.getElementById('strength-text');

        let strength = 0;
        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password)) strength++;
        if (/[A-Z]/.test(password)) strength++;
        if (/[^a-zA-Z0-9]/.test(password)) strength++;

        const colors = ['bg-red-400', 'bg-orange-400', 'bg-yellow-400', 'bg-green-400'];
        const texts = ['Weak', 'Fair', 'Good', 'Strong'];

        strengthBars.forEach((bar, index) => {
            bar.className = 'h-1 flex-1 rounded ' + (index < strength ? colors[strength - 1] : 'bg-gray-200');
        });

        strengthText.textContent = password.length > 0 ? texts[strength - 1] || 'Too weak' : 'Password strength';
        strengthText.className = 'text-xs mt-1 ' + (strength >= 3 ? 'text-green-600' : strength >= 2 ? 'text-yellow-600' : 'text-red-600');
    }

    function validateForm() {
        const firstNameValid = validateFirstName();
        const lastNameValid = validateLastName();
        const emailValid = validateEmail();
        const passwordValid = validatePassword();
        const confirmValid = validateConfirmPassword();

        const formValid = firstNameValid && lastNameValid && emailValid && passwordValid && confirmValid;

        registerBtn.disabled = !formValid;
        registerBtn.classList.toggle('opacity-50', !formValid);
        registerBtn.classList.toggle('cursor-not-allowed', !formValid);

        return formValid;
    }

    // Event listeners
    firstNameInput.addEventListener('input', validateForm);
    lastNameInput.addEventListener('input', validateForm);
    emailInput.addEventListener('input', validateForm);
    passwordInput.addEventListener('input', validateForm);
    confirmInput.addEventListener('input', validateForm);

    // Form submission
    document.getElementById('kc-register-form').addEventListener('submit', function(e) {
        if (!validateForm()) {
            e.preventDefault();
            return;
        }

        registerBtn.disabled = true;
        registerBtn.innerHTML = '<i class="fas fa-spinner fa-spin mr-2"></i>Creating account...';
    });

    // Auto-focus first input on load
    window.addEventListener('load', function() {
        firstNameInput.focus();
    });
</script>

</#if>
</@layout.registrationLayout>
