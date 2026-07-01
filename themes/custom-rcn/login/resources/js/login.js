document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('kc-form-login');
  const loginButton = document.getElementById('kc-login');
  const username = document.getElementById('username');
  const password = document.getElementById('password');

  if (!form || !loginButton) return;

  // Restore button state if we previously submitted and are still waiting
  if (sessionStorage.getItem('rcnLoginSubmitted') === 'true') {
    loginButton.disabled = true;
    loginButton.textContent = 'Signing in…';
    loginButton.setAttribute('aria-busy', 'true');
  }

  function disableAndShowLoading() {
    loginButton.disabled = true;
    loginButton.textContent = 'Signing in…';
    loginButton.setAttribute('aria-busy', 'true');
    sessionStorage.setItem('rcnLoginSubmitted', 'true');
  }

  function restoreButton() {
    loginButton.disabled = false;
    loginButton.textContent = 'Sign In →';
    loginButton.removeAttribute('aria-busy');
    sessionStorage.removeItem('rcnLoginSubmitted');
  }

  form.addEventListener('submit', function () {
    // Basic validation before showing loading state — let Keycloak handle server-side validation
    if (username && password) {
      if (!username.value.trim() || !password.value.trim()) {
        // don't disable if inputs empty — allow browser validation to show
        return;
      }
    }

    // Disable button and change text cleanly
    disableAndShowLoading();

    // As a defensive measure, re-enable after 15s in case navigation didn't happen
    setTimeout(function () {
      if (sessionStorage.getItem('rcnLoginSubmitted') === 'true') {
        restoreButton();
      }
    }, 15000);
  });

  // If there's an auth error / feedback on the page, re-enable the button so users can try again
  const authError = document.querySelector('.form-error, .kc-feedback-text, .alert-error');
  if (authError) {
    restoreButton();
  }

  // Clear stored state when leaving the page (successful navigation will clear)
  window.addEventListener('beforeunload', function () {
    // Remove only when navigating away within same origin (Keycloak will redirect on success)
    // We'll conservatively remove the flag so returning users don't see a stuck state
    sessionStorage.removeItem('rcnLoginSubmitted');
  });
});


