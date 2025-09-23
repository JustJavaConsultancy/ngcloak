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
