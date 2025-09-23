// Password visibility toggle functionality
function togglePasswordVisibility(fieldId) {
  const passwordField = document.getElementById(fieldId);
  const eyeOpen = document.getElementById(fieldId + '-eye-open');
  const eyeClosed = document.getElementById(fieldId + '-eye-closed');

  if (passwordField.type === 'password') {
    passwordField.type = 'text';
    eyeOpen.classList.add('hidden');
    eyeClosed.classList.remove('hidden');
  } else {
    passwordField.type = 'password';
    eyeOpen.classList.remove('hidden');
    eyeClosed.classList.add('hidden');
  }
}

// Password validation functionality
function validatePassword(password) {
  const lengthRequirement = password.length >= 8;
  const mixRequirement = /^(?=.*[a-zA-Z])(?=.*\d)/.test(password);

  return {
    length: lengthRequirement,
    mix: mixRequirement,
    valid: lengthRequirement && mixRequirement
  };
}

function updatePasswordRequirements(validation) {
  const lengthIcon = document.querySelector('#password-length .requirement-icon');
  const lengthText = document.querySelector('#password-length span:last-child');
  const mixIcon = document.querySelector('#password-mix .requirement-icon');
  const mixText = document.querySelector('#password-mix span:last-child');

  // Update length requirement
  if (validation.length) {
    lengthIcon.textContent = '✓';
    lengthIcon.className = 'requirement-icon text-green-600';
    lengthText.className = 'text-green-600';
  } else {
    lengthIcon.textContent = '○';
    lengthIcon.className = 'requirement-icon text-red-500';
    lengthText.className = 'text-red-500';
  }

  // Update mix requirement
  if (validation.mix) {
    mixIcon.textContent = '✓';
    mixIcon.className = 'requirement-icon text-green-600';
    mixText.className = 'text-green-600';
  } else {
    mixIcon.textContent = '○';
    mixIcon.className = 'requirement-icon text-red-500';
    mixText.className = 'text-red-500';
  }
}

function validatePasswordMatch() {
  const password = document.getElementById('password').value;
  const confirmPassword = document.getElementById('password-confirm').value;
  const matchMessage = document.getElementById('password-match-message');
  const matchSuccess = document.getElementById('password-match-success');
  const confirmField = document.getElementById('password-confirm');

  if (confirmPassword === '') {
    matchMessage.classList.add('hidden');
    matchSuccess.classList.add('hidden');
    confirmField.classList.remove('input-error', 'input-success');
    return null;
  }

  if (password === confirmPassword) {
    matchMessage.classList.add('hidden');
    matchSuccess.classList.remove('hidden');
    confirmField.classList.remove('input-error');
    confirmField.classList.add('input-success');
    return true;
  } else {
    matchMessage.classList.remove('hidden');
    matchSuccess.classList.add('hidden');
    confirmField.classList.remove('input-success');
    confirmField.classList.add('input-error');
    return false;
  }
}

function validateForm() {
  const firstName = document.getElementById('firstName').value.trim();
  const lastName = document.getElementById('lastName').value.trim();
  const email = document.getElementById('email').value.trim();
  const username = document.getElementById('username') ? document.getElementById('username').value.trim() : 'valid';
  const password = document.getElementById('password').value;
  const confirmPassword = document.getElementById('password-confirm').value;

  const passwordValidation = validatePassword(password);
  const passwordsMatch = validatePasswordMatch();

  const allFieldsFilled = firstName && lastName && email && username && password && confirmPassword;
  const allRequirementsMet = passwordValidation.valid && passwordsMatch === true;

  const registerButton = document.getElementById('register-button');
  registerButton.disabled = !(allFieldsFilled && allRequirementsMet);
}

// Event listeners
document.addEventListener('DOMContentLoaded', function() {
  const passwordField = document.getElementById('password');
  const confirmPasswordField = document.getElementById('password-confirm');
  const allInputs = document.querySelectorAll('input[required]');

  passwordField.addEventListener('input', function() {
    const validation = validatePassword(this.value);
    updatePasswordRequirements(validation);

    const passwordInput = document.getElementById('password');
    if (this.value === '') {
      passwordInput.classList.remove('input-error', 'input-success');
    } else if (validation.valid) {
      passwordInput.classList.remove('input-error');
      passwordInput.classList.add('input-success');
    } else {
      passwordInput.classList.remove('input-success');
      passwordInput.classList.add('input-error');
    }

    validateForm();
  });

  confirmPasswordField.addEventListener('input', function() {
    validatePasswordMatch();
    validateForm();
  });

  // Add event listeners to all required inputs
  allInputs.forEach(input => {
    input.addEventListener('input', validateForm);
  });

  // Initial validation
  validateForm();
});
