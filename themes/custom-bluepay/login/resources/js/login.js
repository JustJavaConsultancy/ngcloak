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

  // Check if we should show loading overlay on page load (for returning from auth)
  const urlParams = new URLSearchParams(window.location.search);
  const hasAuthError = urlParams.has('error') || document.querySelector('.form-error, .alert-error, .kc-feedback-text');

  // Show overlay if we're in mobile and there's no error
  if (window.innerWidth < 992 && !hasAuthError && sessionStorage.getItem('loginSubmitted') === 'true') {
    overlay.classList.add('show');
    if (loginButton) {
      loginButton.disabled = true;
      loginButton.textContent = 'Signing in...';
    }
  }

  // Function to show loading overlay
  function showLoadingOverlay() {
    if (window.innerWidth < 992) {
      overlay.classList.add('show');
      // Store loading state in sessionStorage to persist across page reloads
      sessionStorage.setItem('loginSubmitted', 'true');
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
    sessionStorage.removeItem('loginSubmitted');
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

      // Set a timeout to ensure overlay persists even if form submission is delayed
      setTimeout(function() {
        if (window.innerWidth < 992) {
          overlay.classList.add('show');
        }
      }, 100);
    }
  });

  // Hide overlay only if there's an authentication error
  if (hasAuthError) {
    hideLoadingOverlay();
  }

  // Clear loading state when user navigates away successfully
  window.addEventListener('beforeunload', function() {
    // Only clear if we're navigating to a different domain (successful auth)
    if (window.location.href.indexOf('/auth/') === -1) {
      sessionStorage.removeItem('loginSubmitted');
    }
  });

  // Handle visibility change (when user switches tabs/apps)
  document.addEventListener('visibilitychange', function() {
    if (document.visibilityState === 'visible' && sessionStorage.getItem('loginSubmitted') === 'true') {
      if (window.innerWidth < 992 && !hasAuthError) {
        overlay.classList.add('show');
      }
    }
  });
});
