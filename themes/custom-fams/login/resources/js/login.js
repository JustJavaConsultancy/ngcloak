/* ═══════════════════════════════════════════════════════════════
   FAMS — Crimson Vault · Keycloak Theme JavaScript
   ═══════════════════════════════════════════════════════════════ */

/* ── Password visibility toggle ───────────────────────────────── */
function togglePassword() {
    const pwd = document.getElementById('password');
    const eye = document.getElementById('eye-icon');
    if (!pwd || !eye) return;

    if (pwd.type === 'password') {
        pwd.type = 'text';
        eye.textContent = 'visibility_off';
    } else {
        pwd.type = 'password';
        eye.textContent = 'visibility';
    }
}

/* ── 3-D flip between login and forgot-password ───────────────── */
function flipForm() {
    const inner = document.getElementById('form-inner');
    if (!inner) return;
    inner.classList.toggle('form-flipped');
}

/* ── Login submit — loading state ─────────────────────────────── */
function handleLogin(e) {
    // Allow Keycloak's real form submission — only show the loading state.
    // Do NOT call e.preventDefault() here; let the form POST naturally.

    const btn    = document.getElementById('kc-login');
    const text   = document.getElementById('btn-text');
    const loader = document.getElementById('btn-loader');

    if (!btn || !text || !loader) return;

    // Visually lock the button
    text.classList.add('hidden');
    loader.classList.remove('hidden');
    btn.classList.add('loading');
    btn.disabled = true;   // standard Keycloak pattern: disable on submit

    // Keycloak's own onsubmit also disables the button — this is complementary.
}

/* ── Testimonial rotator ──────────────────────────────────────── */
const TESTIMONIALS = [
    {
        quote: "The single source of truth for our entire infrastructure fleet. FAMS has redefined our asset reliability metrics.",
        name:  "Executive Director",
        org:   "Federal Infrastructure Agency"
    },
    {
        quote: "Security and auditability are second to none. We achieved 100% compliance in our latest asset verification cycle.",
        name:  "Chief Technical Officer",
        org:   "Nigeria Petroleum Corp"
    },
    {
        quote: "The red-secure infrastructure ensures zero blind spots. FAMS gives full asset lifecycle transparency.",
        name:  "VP Operations",
        org:   "Global Logistics Authority"
    }
];

(function initTestimonialRotator() {
    const container = document.getElementById('testimonial-container');
    if (!container) return;   // only runs when left panel is present

    let current = 0;

    function getInitials(name) {
        return name
            .split(' ')
            .map(function(n) { return n[0]; })
            .join('');
    }

    function renderSlide(slide) {
        container.innerHTML =
            '<div class="testimonial-slide animate-fade-up">' +
            '<span class="material-symbols-outlined text-red-300 text-4xl mb-4 drop-shadow quote-icon">format_quote</span>' +
            '<p class="text-white text-[20px] font-medium leading-relaxed mb-6 drop-shadow">"' + slide.quote + '"</p>' +
            '<div class="flex items-center gap-3">' +
            '<div class="testimonial-avatar">' + getInitials(slide.name) + '</div>' +
            '<div>' +
            '<p class="text-white font-bold text-sm">' + slide.name + '</p>' +
            '<p class="text-red-200/80 text-xs font-asset-code uppercase tracking-tighter">' + slide.org + '</p>' +
            '</div>' +
            '</div>' +
            '</div>';
    }

    setInterval(function() {
        current = (current + 1) % TESTIMONIALS.length;
        renderSlide(TESTIMONIALS[current]);
    }, 5500);
})();
