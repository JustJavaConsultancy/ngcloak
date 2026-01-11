document.addEventListener('DOMContentLoaded', function() {
    const togglePassword = document.getElementById('togglePassword');
    const passwordInput = document.getElementById('password');

    if (togglePassword && passwordInput) {
      togglePassword.addEventListener('click', function() {
        // Toggle type attribute
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);

        // Toggle icon
        togglePassword.querySelector('i').classList.toggle('fa-eye');
        togglePassword.querySelector('i').classList.toggle('fa-eye-slash');
      });
    }
});

// ================================
// MOBILE LOGIN LOADING OVERLAY
// (Keycloak-safe, non-intrusive)
// ================================
document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('kc-form-login');
  const overlay = document.getElementById('mobile-loading-overlay');
  const loginButton = document.getElementById('kc-login');

  // Defensive checks — do nothing if elements don't exist
  if (!form || !overlay) return;

  // Function to show loading overlay
  function showLoadingOverlay() {
    if (window.innerWidth < 992) {
      overlay.classList.add('show');
      // Disable the login button to prevent multiple submissions
      if (loginButton) {
        loginButton.disabled = true;
        loginButton.textContent = 'Signing in...';
      }
    }
  }

  // Function to hide loading overlay (for error cases)
  function hideLoadingOverlay() {
    overlay.classList.remove('show');
    if (loginButton) {
      loginButton.disabled = false;
      loginButton.textContent = 'Log In';
    }
  }

  // Show overlay on form submission
  form.addEventListener('submit', function(event) {
    // Basic validation before showing overlay
    const username = document.getElementById('username');
    const password = document.getElementById('password');

    if (username && password && username.value.trim() && password.value.trim()) {
      showLoadingOverlay();
    }
  });

  // Hide overlay if there's an error (page reloads with error)
  window.addEventListener('pageshow', function(event) {
    if (event.persisted) {
      hideLoadingOverlay();
    }
  });

  // Hide overlay on page unload (back button, etc.)
  window.addEventListener('beforeunload', function() {
    hideLoadingOverlay();
  });
});
