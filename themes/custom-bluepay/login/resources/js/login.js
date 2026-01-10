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
  

// DISABLING BUTTON
function checkInputs() {
    let emailValue = document.getElementById("email").value.trim();
    let passwordValue = document.getElementById("password").value.trim();
    let submitButton = document.getElementById("button");

    // Enable button if both fields are filled
    submitButton.disabled = !(passwordValue && emailValue);
}

// Attach event listeners
document.getElementById("email").addEventListener("input", checkInputs);
document.getElementById("password").addEventListener("input", checkInputs);



//RDIRECT

document.getElementById('button').addEventListener('click', function(event) {
  event.preventDefault(); 

  window.location.href = "../otp/otp.html"; 
});

// ================================
// MOBILE LOGIN LOADING OVERLAY
// (Keycloak-safe, non-intrusive)
// ================================
document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('kc-form-login');
  const overlay = document.getElementById('mobile-loading-overlay');

  // Defensive checks — do nothing if elements don't exist
  if (!form || !overlay) return;

  form.addEventListener('submit', function () {
    // Only show on mobile
    if (window.innerWidth < 992) {
      overlay.classList.add('show');
    }
  });
});
