<#ftl output_format="HTML">
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | JustJava</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #1a0a00 0%, #3d2000 50%, #6b3a1f 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            color: #1f2937;
        }

        .card {
            background: white;
            border-radius: 16px;
            padding: 40px 40px 36px;
            width: 100%;
            max-width: 460px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
        }

        .brand { text-align: center; margin-bottom: 24px; }

        .brand-mark {
            width: 52px; height: 52px;
            background: linear-gradient(135deg, #6b3a1f, #c4622d);
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
            box-shadow: 0 8px 20px rgba(107, 58, 31, 0.3);
        }

        .brand-mark svg { width: 28px; height: 28px; fill: white; }

        .brand h1 {
            font-size: 20px;
            font-weight: 700;
            color: #1a0a00;
            letter-spacing: -0.5px;
        }

        h2 {
            font-size: 20px;
            font-weight: 600;
            color: #1a0a00;
            margin-bottom: 4px;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 22px;
        }

        .alert {
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 16px;
            font-size: 13px;
            line-height: 1.4;
        }

        .alert-error   { background: #fef2f2; border: 1px solid #fecaca; color: #b91c1c; }
        .alert-warning { background: #fffbeb; border: 1px solid #fde68a; color: #b45309; }
        .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; color: #15803d; }
        .alert-info    { background: #eff6ff; border: 1px solid #bfdbfe; color: #1d4ed8; }

        .field { margin-bottom: 14px; }

        .name-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-bottom: 14px;
        }
        .name-grid .field { margin-bottom: 0; }

        label {
            display: block;
            font-size: 13px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 6px;
        }

        .input-wrap { position: relative; }

        input[type="email"],
        input[type="password"],
        input[type="text"] {
            width: 100%;
            padding: 11px 14px;
            border: 1.5px solid #d1d5db;
            border-radius: 8px;
            font-size: 14px;
            font-family: inherit;
            color: #111827;
            background: #f9fafb;
            outline: none;
            transition: border-color 0.15s, background 0.15s, box-shadow 0.15s;
        }

        input:focus {
            border-color: #6b3a1f;
            background: white;
            box-shadow: 0 0 0 3px rgba(107, 58, 31, 0.12);
        }

        input.invalid {
            border-color: #dc2626;
            background: #fef2f2;
        }
        input.invalid:focus {
            box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.12);
        }

        input.valid {
            border-color: #16a34a;
            background: #f0fdf4;
        }
        input.valid:focus {
            box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.12);
        }

        .input-wrap input[type="password"],
        .input-wrap input[type="text"] { padding-right: 42px; }

        .toggle-pwd {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            padding: 6px;
            color: #9ca3af;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 4px;
        }
        .toggle-pwd:hover { color: #6b3a1f; background: #f3f4f6; }
        .toggle-pwd svg { width: 18px; height: 18px; }

        .error-msg {
            font-size: 12px;
            color: #dc2626;
            margin-top: 5px;
            display: none;
            line-height: 1.35;
        }
        .error-msg.show { display: block; }

        .pwd-rules {
            margin-top: 8px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4px 12px;
            font-size: 11.5px;
            color: #9ca3af;
        }

        .rule { display: flex; align-items: center; gap: 6px; transition: color 0.15s; }
        .rule .dot {
            width: 6px; height: 6px;
            border-radius: 50%;
            background: #d1d5db;
            transition: background 0.15s;
            flex-shrink: 0;
        }
        .rule.met { color: #16a34a; }
        .rule.met .dot { background: #16a34a; }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #6b3a1f, #c4622d);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            font-family: inherit;
            cursor: pointer;
            letter-spacing: 0.2px;
            transition: opacity 0.15s, transform 0.1s;
            margin-top: 6px;
        }
        .btn:hover:not(:disabled) { opacity: 0.93; }
        .btn:active:not(:disabled) { transform: scale(0.99); }
        .btn:disabled {
            background: #d1d5db;
            color: #6b7280;
            cursor: not-allowed;
        }

        .footer {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-top: 20px;
        }

        .footer a {
            color: #6b3a1f;
            font-weight: 600;
            text-decoration: none;
        }
        .footer a:hover { text-decoration: underline; }

        @media (max-width: 480px) {
            .card { padding: 32px 22px; }
            .name-grid { grid-template-columns: 1fr; }
            .pwd-rules { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="brand">
            <div class="brand-mark">
                <svg viewBox="0 0 24 24"><path d="M4 19h16v2H4v-2zm15-9h1c1.1 0 2 .9 2 2v3c0 1.1-.9 2-2 2h-1.32A4.99 4.99 0 0 1 14 21H8a5 5 0 0 1-5-5V4h16v6zm0 5h1v-3h-1v3z"/></svg>
            </div>
            <h1>JustJava</h1>
        </div>

        <h2>Create your account</h2>
        <p class="subtitle">Join us and start shopping today</p>

        <#if message?has_content>
            <div class="alert alert-${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <form id="registerForm" action="${url.registrationAction}" method="post" novalidate>
            <div class="name-grid">
                <div class="field">
                    <label for="firstName">First name</label>
                    <input
                        id="firstName"
                        name="firstName"
                        type="text"
                        autocomplete="given-name"
                        required
                        value="${(register.formData.firstName!'')}"
                        placeholder="John"
                    />
                </div>
                <div class="field">
                    <label for="lastName">Last name</label>
                    <input
                        id="lastName"
                        name="lastName"
                        type="text"
                        autocomplete="family-name"
                        required
                        value="${(register.formData.lastName!'')}"
                        placeholder="Doe"
                    />
                </div>
            </div>

            <div class="field">
                <label for="email">Email address</label>
                <input
                    id="email"
                    name="email"
                    type="email"
                    autocomplete="email"
                    required
                    value="${(register.formData.email!'')}"
                    placeholder="you@example.com"
                />
                <div class="error-msg" id="emailError">Please enter a valid email address</div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <input type="hidden" id="username" name="username" value="">
            </#if>

            <div class="field">
                <label for="password">Password</label>
                <div class="input-wrap">
                    <input
                        id="password"
                        name="password"
                        type="password"
                        autocomplete="new-password"
                        required
                        placeholder="Create a strong password"
                    />
                    <button type="button" class="toggle-pwd" data-target="password" aria-label="Show password">
                        <svg class="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
                <div class="pwd-rules" id="pwdRules">
                    <div class="rule" data-rule="length"><span class="dot"></span>At least 8 characters</div>
                    <div class="rule" data-rule="upper"><span class="dot"></span>One uppercase letter</div>
                    <div class="rule" data-rule="lower"><span class="dot"></span>One lowercase letter</div>
                    <div class="rule" data-rule="number"><span class="dot"></span>One number</div>
                    <div class="rule" data-rule="special"><span class="dot"></span>One special character</div>
                </div>
            </div>

            <div class="field">
                <label for="password-confirm">Confirm password</label>
                <div class="input-wrap">
                    <input
                        id="password-confirm"
                        name="password-confirm"
                        type="password"
                        autocomplete="new-password"
                        required
                        placeholder="Re-enter your password"
                    />
                    <button type="button" class="toggle-pwd" data-target="password-confirm" aria-label="Show password">
                        <svg class="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
                <div class="error-msg" id="confirmError">Passwords do not match</div>
            </div>

            <button type="submit" class="btn" id="submitBtn" disabled>Create account</button>
        </form>

        <div class="footer">
            Already have an account? <a href="${url.loginUrl}">Sign in</a>
        </div>
    </div>

    <script>
        (function () {
            var EYE_OPEN = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            var EYE_OFF  = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';

            document.querySelectorAll('.toggle-pwd').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    var input = document.getElementById(btn.dataset.target);
                    var svg = btn.querySelector('svg');
                    var showing = input.type === 'text';
                    input.type = showing ? 'password' : 'text';
                    svg.innerHTML = showing ? EYE_OPEN : EYE_OFF;
                    btn.setAttribute('aria-label', showing ? 'Show password' : 'Hide password');
                });
            });

            var firstName = document.getElementById('firstName');
            var lastName  = document.getElementById('lastName');
            var email     = document.getElementById('email');
            var password  = document.getElementById('password');
            var confirm   = document.getElementById('password-confirm');
            var usernameHidden = document.getElementById('username');
            var submitBtn = document.getElementById('submitBtn');

            var emailError   = document.getElementById('emailError');
            var confirmError = document.getElementById('confirmError');

            var EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            var pwdRules = {
                length:  function (v) { return v.length >= 8; },
                upper:   function (v) { return /[A-Z]/.test(v); },
                lower:   function (v) { return /[a-z]/.test(v); },
                number:  function (v) { return /[0-9]/.test(v); },
                special: function (v) { return /[^A-Za-z0-9]/.test(v); }
            };

            function setValidity(el, isValid, touched) {
                if (!touched) {
                    el.classList.remove('valid', 'invalid');
                    return;
                }
                el.classList.toggle('valid', isValid);
                el.classList.toggle('invalid', !isValid);
            }

            function checkEmail() {
                var touched = email.value.length > 0;
                var ok = EMAIL_RE.test(email.value);
                setValidity(email, ok, touched);
                emailError.classList.toggle('show', touched && !ok);
                return ok;
            }

            function checkPassword() {
                var v = password.value;
                var allMet = true;
                Object.keys(pwdRules).forEach(function (k) {
                    var met = pwdRules[k](v);
                    if (!met) allMet = false;
                    var ruleEl = document.querySelector('.rule[data-rule="' + k + '"]');
                    if (ruleEl) ruleEl.classList.toggle('met', met);
                });
                var touched = v.length > 0;
                setValidity(password, allMet, touched);
                return allMet;
            }

            function checkConfirm() {
                var touched = confirm.value.length > 0;
                var ok = confirm.value === password.value && password.value.length > 0;
                setValidity(confirm, ok, touched);
                confirmError.classList.toggle('show', touched && !ok);
                return ok;
            }

            function updateSubmit() {
                var ok =
                    firstName.value.trim().length > 0 &&
                    lastName.value.trim().length  > 0 &&
                    checkEmail() &&
                    checkPassword() &&
                    checkConfirm();
                submitBtn.disabled = !ok;
            }

            [firstName, lastName].forEach(function (el) {
                el.addEventListener('input', updateSubmit);
            });
            email.addEventListener('input', updateSubmit);
            password.addEventListener('input', function () {
                updateSubmit();
                if (confirm.value.length > 0) checkConfirm();
            });
            confirm.addEventListener('input', updateSubmit);

            document.getElementById('registerForm').addEventListener('submit', function (e) {
                if (usernameHidden) usernameHidden.value = email.value;
                if (submitBtn.disabled) e.preventDefault();
            });

            updateSubmit();
        })();
    </script>
</body>
</html>
