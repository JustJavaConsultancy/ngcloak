document.addEventListener("DOMContentLoaded", function () {
  // Initialize both desktop and mobile forms
  initializeForm("desktop");
  initializeForm("mobile");

  function initializeForm(layout) {
    const suffix = layout === "mobile" ? "-mobile" : "";

    // Form elements
    const registerForm = document.getElementById(`kc-register-form${suffix}`);
    const passwordInput = document.getElementById(`password${suffix}`);
    const confirmPasswordInput = document.getElementById(
      `password-confirm${suffix}`,
    );
    const registerButton = document.getElementById(`registerButton${suffix}`);
    const passwordRequirements =
      layout === "mobile"
        ? document.getElementById("password-requirements-mobile")
        : document.querySelector(".password-requirements");
    const passwordError =
      layout === "mobile"
        ? document.getElementById("password-error-mobile")
        : document.querySelector(".password-error");
    const emailInput = document.getElementById(`email${suffix}`);
    const emailError = document.getElementById(`email-error${suffix}`);

    // Skip if elements don't exist for this layout
    if (
      !registerForm ||
      !passwordInput ||
      !confirmPasswordInput ||
      !registerButton
    ) {
      return;
    }

    // Requirement rules for this layout
    const requirements = {
      length: {
        regex: /.{8,}/,
        element: passwordRequirements?.querySelector(
          '[data-requirement="length"]',
        ),
      },
      uppercase: {
        regex: /[A-Z]/,
        element: passwordRequirements?.querySelector(
          '[data-requirement="uppercase"]',
        ),
      },
      lowercase: {
        regex: /[a-z]/,
        element: passwordRequirements?.querySelector(
          '[data-requirement="lowercase"]',
        ),
      },
      digit: {
        regex: /[0-9]/,
        element: passwordRequirements?.querySelector(
          '[data-requirement="digit"]',
        ),
      },
      special: {
        regex: /[~!@#$]/,
        element: passwordRequirements?.querySelector(
          '[data-requirement="special"]',
        ),
      },
    };

    // Password visibility toggle
    const togglePasswordBtn = document.getElementById(
      `togglePassword${suffix}`,
    );
    const toggleConfirmPasswordBtn = document.getElementById(
      `toggleConfirmPassword${suffix}`,
    );

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

    function setButtonState(enabled) {
      registerButton.disabled = !enabled;
      registerButton.classList.toggle("active", enabled);
      registerButton.classList.toggle("disabled", !enabled);
    }

    // Comprehensive form validation
    function validateForm() {
      const password = passwordInput.value;
      const confirmPassword = confirmPasswordInput.value;

      // Update password requirement indicators (visual feedback)
      let validCount = 0;
      Object.entries(requirements).forEach(([, requirement]) => {
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

      const passwordsMatch =
        password === confirmPassword && confirmPassword !== "";

      if (passwordError) {
        passwordError.classList.toggle(
          "visible",
          confirmPassword.length > 0 && !passwordsMatch,
        );
      }

      // Every required field must be non-empty
      const requiredFields = registerForm.querySelectorAll("[required]");
      let allRequiredFilled = true;
      requiredFields.forEach((field) => {
        if (!field.value.trim()) {
          allRequiredFilled = false;
        }
      });

      // Email must be a valid format (required field, so also must be present)
      let emailValid = true;
      if (emailInput) {
        const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        emailValid = emailPattern.test(emailInput.value.trim());
      }

      const isValid =
        allRequiredFilled &&
        emailValid &&
        validCount === 5 &&
        passwordsMatch;

      setButtonState(isValid);
    }

    // Add event listeners to all required fields for real-time validation
    const allInputs = registerForm.querySelectorAll("input, select");
    allInputs.forEach((input) => {
      input.addEventListener("input", validateForm);
      input.addEventListener("change", validateForm);
      input.addEventListener("blur", validateForm);
    });

    // Ensure the button starts disabled, then run the first validation pass
    setButtonState(false);
    validateForm();

    // Form submission
    if (registerForm) {
      registerForm.addEventListener("submit", function (e) {
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
