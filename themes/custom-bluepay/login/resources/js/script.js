document.addEventListener("DOMContentLoaded", function () {
  // Initialize both desktop and mobile forms
  initializeForm('desktop');
  initializeForm('mobile');

  function initializeForm(layout) {
    const suffix = layout === 'mobile' ? '-mobile' : '';

    // Form elements
    const registerForm = document.getElementById(`kc-register-form${suffix}`);
    const passwordInput = document.getElementById(`password${suffix}`);
    const confirmPasswordInput = document.getElementById(`password-confirm${suffix}`);
    const registerButton = document.getElementById(`registerButton${suffix}`);
    const passwordRequirements = layout === 'mobile'
      ? document.getElementById('password-requirements-mobile')
      : document.querySelector(".password-requirements");
    const passwordError = layout === 'mobile'
      ? document.getElementById('password-error-mobile')
      : document.querySelector(".password-error");
    const emailInput = document.getElementById(`email${suffix}`);
    const emailError = document.getElementById(`email-error${suffix}`);
    const phoneInput = document.getElementById(`phoneNumber${suffix}`);
    const phoneError = document.getElementById(`phone-error${suffix}`);
    const countrySelect = document.getElementById(`country${suffix}`);
    const countryError = document.getElementById(`country-error${suffix}`);

    // Skip if elements don't exist for this layout
    if (!registerForm || !passwordInput || !confirmPasswordInput || !registerButton) {
      return;
    }

    // Requirement rules for this layout
    const requirements = {
      length: {
        regex: /.{8,}/,
        element: passwordRequirements?.querySelector('[data-requirement="length"]'),
      },
      uppercase: {
        regex: /[A-Z]/,
        element: passwordRequirements?.querySelector('[data-requirement="uppercase"]'),
      },
      lowercase: {
        regex: /[a-z]/,
        element: passwordRequirements?.querySelector('[data-requirement="lowercase"]'),
      },
      digit: {
        regex: /[0-9]/,
        element: passwordRequirements?.querySelector('[data-requirement="digit"]'),
      },
      special: {
        regex: /[~!@#$]/,
        element: passwordRequirements?.querySelector('[data-requirement="special"]'),
      },
    };

    // Password visibility toggle
    const togglePasswordBtn = document.getElementById(`togglePassword${suffix}`);
    const toggleConfirmPasswordBtn = document.getElementById(`toggleConfirmPassword${suffix}`);

    if (togglePasswordBtn) {
      togglePasswordBtn.addEventListener("click", function () {
        togglePasswordVisibility(passwordInput, this);
      });
    }

    if (toggleConfirmPasswordBtn) {
      toggleConfirmPasswordBtn.addEventListener("click", function () {
        togglePasswordVisibility(confirmPasswordInput, this);
      });
    }

    function togglePasswordVisibility(input, button) {
      const icon = button.querySelector("i");
      if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    }

    // Show password requirements when user starts typing
    passwordInput.addEventListener("input", function () {
      if (passwordRequirements) {
        if (this.value.length > 0) {
          passwordRequirements.classList.add("visible");
        } else {
          passwordRequirements.classList.remove("visible");
        }
      }
      validateForm();
    });

    // Add validation on confirm password input
    confirmPasswordInput.addEventListener("input", validateForm);

    // Email validation
    if (emailInput && emailError) {
      emailInput.addEventListener("input", function () {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (this.value.trim() !== "" && !emailPattern.test(this.value)) {
          emailError.classList.remove("d-none");
        } else {
          emailError.classList.add("d-none");
        }
        validateForm();
      });
    }

    // Phone validation
    if (phoneInput && phoneError) {
      phoneInput.addEventListener("keydown", function (e) {
        const allowedKeys = [
          "Backspace",
          "ArrowLeft",
          "ArrowRight",
          "Tab",
          "Delete"
        ];

        // Allow only digits and allowed control keys
        if (
          !/^\d$/.test(e.key) && // Not a digit
          !allowedKeys.includes(e.key)
        ) {
          e.preventDefault(); // Block it
        }
      });

      phoneInput.addEventListener("input", function () {
        // Trim anything that somehow slips through (pasting, etc.)
        this.value = this.value.replace(/\D/g, "");

        const value = this.value;

        if (value.length === 0) {
          phoneError.textContent = "Phone number is required.";
          phoneError.classList.remove("d-none");
          validateForm();
          return;
        }

        if (value.length !== 10) {
          phoneError.textContent = "Phone number must be 10 digits (e.g., 8031234567)";
          phoneError.classList.remove("d-none");
          validateForm();
          return;
        }

        const prefix = value.substring(0, 2);
        const validPrefixes = ["70", "80", "81", "90", "91"];
        if (!validPrefixes.includes(prefix)) {
          phoneError.textContent = "Invalid prefix. Use 70, 80, 81, 90, or 91.";
          phoneError.classList.remove("d-none");
          validateForm();
          return;
        }

        phoneError.classList.add("d-none");
        validateForm();
      });
    }

    // Country validation
    if (countrySelect && countryError) {
      countrySelect.addEventListener("change", function () {
        if (countrySelect.value && countrySelect.value !== "Nigeria") {
          countryError.classList.remove("d-none");
        } else {
          countryError.classList.add("d-none");
        }
        validateForm();
      });
    }

    // Comprehensive form validation
    function validateForm() {
      let isValid = true;

      // Password validation
      const password = passwordInput.value;
      const confirmPassword = confirmPasswordInput.value;
      let validCount = 0;

      // Check password requirements
      Object.entries(requirements).forEach(([key, requirement]) => {
        if (requirement.element) {
          const isRequirementValid = requirement.regex.test(password);
          requirement.element.classList.toggle("valid", isRequirementValid);
          requirement.element.classList.toggle("invalid", !isRequirementValid);
          const img = requirement.element.querySelector("img");
          if (img) {
            img.src = isRequirementValid
              ? `${window.resourcesPath}/img/icon-valid.svg`
              : `${window.resourcesPath}/img/icon-invalid.svg`;
          }
          if (isRequirementValid) validCount++;
        }
      });

      // Check if passwords match
      const passwordsMatch = password === confirmPassword && confirmPassword !== "";

      // Show/hide password error message
      if (passwordError) {
        if (confirmPassword && !passwordsMatch) {
          passwordError.classList.add("visible");
        } else {
          passwordError.classList.remove("visible");
        }
      }

      // Password requirements check
      const passwordValid = validCount === 5 && passwordsMatch;
      if (!passwordValid) isValid = false;

      // Email validation
      if (emailInput) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const emailValid = emailInput.value.trim() === "" || emailPattern.test(emailInput.value);
        if (!emailValid) isValid = false;
      }

      // Phone validation
      if (phoneInput) {
        const phoneValue = phoneInput.value;
        const phoneValid = phoneValue.length === 10 && /^(70|80|81|90|91)/.test(phoneValue);
        if (!phoneValid) isValid = false;
      }

      // Country validation
      if (countrySelect) {
        const countryValid = countrySelect.value === "Nigeria";
        if (!countryValid) isValid = false;
      }

      // Check all required fields
      const requiredFields = registerForm.querySelectorAll('[required]');
      requiredFields.forEach(field => {
        if (!field.value.trim()) {
          isValid = false;
        }
      });

      // Update button state
      registerButton.disabled = !isValid;
      if (isValid) {
        registerButton.classList.add("active");
        registerButton.classList.remove("disabled");
      } else {
        registerButton.classList.remove("active");
        registerButton.classList.add("disabled");
      }
    }

    // Add event listeners to all required fields for real-time validation
    const allInputs = registerForm.querySelectorAll('input, select');
    allInputs.forEach(input => {
      input.addEventListener('input', validateForm);
      input.addEventListener('change', validateForm);
    });

    // Initial validation
    validateForm();

    // Form submission
    if (registerForm) {
      registerForm.addEventListener("submit", function (e) {
        // Check country first
        if (countrySelect && countrySelect.value !== "Nigeria") {
          e.preventDefault();
          if (countryError) {
            countryError.classList.remove("d-none");
          }
          countrySelect.focus();
          return;
        }

        // Check if button is disabled
        if (registerButton.disabled) {
          e.preventDefault();
          return;
        }

        // Show loading state
        registerButton.innerHTML =
          '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Creating account...';
        registerButton.disabled = true;
      });
    }
  }
});
