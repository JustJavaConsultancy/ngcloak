<#ftl output_format="HTML">
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | NaijaMart</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
            background: linear-gradient(135deg, #1a0a2e 0%, #3d1f6b 50%, #630ed4 100%);
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
            max-width: 520px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
        }

        .brand { text-align: center; margin-bottom: 20px; }

        .brand-mark {
            width: 52px; height: 52px;
            background: linear-gradient(135deg, #630ed4, #9a4dff);
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
            box-shadow: 0 8px 20px rgba(99, 14, 212, 0.3);
        }

        .brand-mark svg { width: 28px; height: 28px; fill: white; }

        .brand h1 {
            font-size: 20px;
            font-weight: 700;
            color: #1a0a2e;
            letter-spacing: -0.5px;
        }

        h2 {
            font-size: 20px;
            font-weight: 600;
            color: #1a0a2e;
            margin-bottom: 4px;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 22px;
        }

        .mode-toggle {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0;
            background: #f3f4f6;
            padding: 4px;
            border-radius: 10px;
            margin-bottom: 22px;
        }
        .mode-toggle button {
            background: transparent;
            border: none;
            padding: 10px 12px;
            font-size: 13px;
            font-weight: 600;
            font-family: inherit;
            color: #6b7280;
            cursor: pointer;
            border-radius: 8px;
            transition: background 0.15s, color 0.15s, box-shadow 0.15s;
        }
        .mode-toggle button.active {
            background: white;
            color: #630ed4;
            box-shadow: 0 2px 6px rgba(0,0,0,0.08);
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
        input[type="text"],
        input[type="tel"],
        input[type="url"] {
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
            border-color: #630ed4;
            background: white;
            box-shadow: 0 0 0 3px rgba(99, 14, 212, 0.12);
        }

        input.invalid { border-color: #dc2626; background: #fef2f2; }
        input.invalid:focus { box-shadow: 0 0 0 3px rgba(220, 38, 38, 0.12); }

        input.valid { border-color: #16a34a; background: #f0fdf4; }
        input.valid:focus { box-shadow: 0 0 0 3px rgba(22, 163, 74, 0.12); }

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
        .toggle-pwd:hover { color: #630ed4; background: #f3f4f6; }
        .toggle-pwd svg { width: 18px; height: 18px; }

        .error-msg {
            font-size: 12px;
            color: #dc2626;
            margin-top: 5px;
            display: none;
            line-height: 1.35;
        }
        .error-msg.show { display: block; }

        .hint {
            font-size: 11.5px;
            color: #9ca3af;
            margin-top: 5px;
        }

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

        .logo-drop {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px;
            border: 1.5px dashed #d1d5db;
            border-radius: 8px;
            background: #f9fafb;
            cursor: pointer;
            transition: border-color 0.15s, background 0.15s;
        }
        .logo-drop:hover { border-color: #630ed4; background: white; }
        .logo-preview {
            width: 56px; height: 56px;
            border-radius: 10px;
            background: #eef1f5;
            display: flex; align-items: center; justify-content: center;
            overflow: hidden;
            flex-shrink: 0;
        }
        .logo-preview img { width: 100%; height: 100%; object-fit: cover; }
        .logo-preview svg { width: 24px; height: 24px; fill: #9ca3af; }
        .logo-drop .txt { font-size: 13px; color: #374151; font-weight: 500; }
        .logo-drop .txt small { display: block; color: #9ca3af; font-weight: 400; margin-top: 2px; font-size: 11.5px; }
        input[type="file"] { display: none; }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #630ed4, #9a4dff);
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
        .btn:disabled { background: #d1d5db; color: #6b7280; cursor: not-allowed; }

        .footer {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-top: 20px;
        }

        .footer a {
            color: #630ed4;
            font-weight: 600;
            text-decoration: none;
        }
        .footer a:hover { text-decoration: underline; }

        .hidden { display: none !important; }

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
                <svg viewBox="0 0 24 24"><path d="M12 2 3 7v6c0 5 3.8 9.7 9 11 5.2-1.3 9-6 9-11V7l-9-5z"/></svg>
            </div>
            <h1>NaijaMart</h1>
        </div>

        <h2 id="titleText">Create your account</h2>
        <p class="subtitle" id="subtitleText">Join us and start shopping today</p>

        <div class="mode-toggle" role="tablist" aria-label="Account type">
            <button type="button" id="modeCustomer" class="active" role="tab" aria-selected="true">Customer</button>
            <button type="button" id="modeVendor" role="tab" aria-selected="false">Vendor</button>
        </div>

        <#if message?has_content>
            <div class="alert alert-${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <form id="registerForm" action="${url.registrationAction}" method="post" enctype="multipart/form-data" novalidate>

            <!-- Hidden marker so Keycloak stores account type as a user attribute -->
            <input type="hidden" id="accountType" name="user.attributes.accountType" value="customer"/>

            <!-- ========= CUSTOMER FIELDS ========= -->
            <div id="customerFields">
                <div class="name-grid">
                    <div class="field">
                        <label for="firstName">First name</label>
                        <input id="firstName" name="firstName" type="text" autocomplete="given-name"
                               value="${(register.formData.firstName!'')}" placeholder="John"/>
                    </div>
                    <div class="field">
                        <label for="lastName">Last name</label>
                        <input id="lastName" name="lastName" type="text" autocomplete="family-name"
                               value="${(register.formData.lastName!'')}" placeholder="Doe"/>
                    </div>
                </div>
            </div>

            <!-- ========= VENDOR FIELDS ========= -->
            <div id="vendorFields" class="hidden">
                <div class="field">
                    <label for="companyName">Company / Business name</label>
                    <input id="companyName" name="user.attributes.companyName" type="text"
                           value="${(register.formData['user.attributes.companyName']!'')}"
                           placeholder="e.g. Acme Trading Ltd"/>
                </div>

                <div class="field">
                    <label for="companyLogo">Company logo</label>
                    <label for="companyLogo" class="logo-drop" id="logoDrop">
                        <div class="logo-preview" id="logoPreview">
                            <svg viewBox="0 0 24 24"><path d="M12 12a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-9 8V6a2 2 0 0 1 2-2h3l2-2h4l2 2h3a2 2 0 0 1 2 2v14H3z" fill-opacity=".35"/></svg>
                        </div>
                        <div class="txt">
                            <span id="logoLabel">Click to upload logo</span>
                            <small>PNG or JPG, square recommended, max 2 MB</small>
                        </div>
                    </label>
                    <input id="companyLogo" name="companyLogo" type="file" accept="image/png,image/jpeg,image/webp"/>
                    <div class="error-msg" id="logoError">File too large. Maximum size is 2 MB.</div>
                </div>

                <div class="field">
                    <label for="phone">Contact phone number</label>
                    <input id="phone" name="user.attributes.phoneNumber" type="tel"
                           inputmode="tel"
                           value="${(register.formData['user.attributes.phoneNumber']!'')}"
                           placeholder="+2348012345678 or 08012345678"/>
                    <div class="error-msg" id="phoneError">Enter a valid Nigerian phone number.</div>
                </div>

                <div class="field">
                    <label for="websiteUrl">Website URL</label>
                    <input id="websiteUrl" name="user.attributes.websiteUrl" type="url"
                           value="${(register.formData['user.attributes.websiteUrl']!'')}"
                           placeholder="https://your-company.com"/>
                    <div class="error-msg" id="websiteError">Enter a valid URL (must start with http:// or https://).</div>
                </div>

                <!-- Hidden firstName/lastName so Keycloak's required-fields validation passes.
                     For vendors we mirror companyName into firstName and leave lastName as a dot. -->
                <input type="hidden" id="vendorFirstName" name="firstName" value=""/>
                <input type="hidden" id="vendorLastName" name="lastName" value="."/>
            </div>

            <!-- ========= SHARED: email + passwords ========= -->
            <div class="field">
                <label for="email">Email address</label>
                <input id="email" name="email" type="email" autocomplete="email"
                       value="${(register.formData.email!'')}" placeholder="you@example.com"/>
                <div class="error-msg" id="emailError">Please enter a valid email address</div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <input type="hidden" id="username" name="username" value="">
            </#if>

            <div class="field">
                <label for="password">Password</label>
                <div class="input-wrap">
                    <input id="password" name="password" type="password" autocomplete="new-password"
                           placeholder="Create a strong password"/>
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
                    <input id="password-confirm" name="password-confirm" type="password" autocomplete="new-password"
                           placeholder="Re-enter your password"/>
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

            // ── Mode handling ──────────────────────────────────────────────
            var modeCustomerBtn = document.getElementById('modeCustomer');
            var modeVendorBtn   = document.getElementById('modeVendor');
            var accountTypeIn   = document.getElementById('accountType');
            var customerFields  = document.getElementById('customerFields');
            var vendorFields    = document.getElementById('vendorFields');
            var titleText       = document.getElementById('titleText');
            var subtitleText    = document.getElementById('subtitleText');

            var firstName = document.getElementById('firstName');
            var lastName  = document.getElementById('lastName');
            var vendorFirstNameHidden = document.getElementById('vendorFirstName');

            var companyName = document.getElementById('companyName');
            var phone       = document.getElementById('phone');
            var websiteUrl  = document.getElementById('websiteUrl');
            var logoInput   = document.getElementById('companyLogo');
            var logoPreview = document.getElementById('logoPreview');
            var logoLabel   = document.getElementById('logoLabel');
            var logoError   = document.getElementById('logoError');

            var email     = document.getElementById('email');
            var password  = document.getElementById('password');
            var confirm   = document.getElementById('password-confirm');
            var usernameHidden = document.getElementById('username');
            var submitBtn = document.getElementById('submitBtn');

            var emailError   = document.getElementById('emailError');
            var confirmError = document.getElementById('confirmError');
            var phoneError   = document.getElementById('phoneError');
            var websiteError = document.getElementById('websiteError');

            var EMAIL_RE = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            // Nigerian phone: +234XXXXXXXXXX  OR  0XXXXXXXXXX
            var PHONE_RE = /^(?:\+234\d{10}|0\d{10})$/;
            var URL_RE   = /^https?:\/\/[^\s.]+\.[^\s]{2,}$/i;

            var MAX_LOGO_BYTES = 2 * 1024 * 1024; // 2 MB
            var currentMode = 'customer';

            function setMode(mode) {
                currentMode = mode;
                accountTypeIn.value = mode;

                if (mode === 'vendor') {
                    modeVendorBtn.classList.add('active');
                    modeVendorBtn.setAttribute('aria-selected', 'true');
                    modeCustomerBtn.classList.remove('active');
                    modeCustomerBtn.setAttribute('aria-selected', 'false');
                    customerFields.classList.add('hidden');
                    vendorFields.classList.remove('hidden');
                    titleText.textContent   = 'Register your company';
                    subtitleText.textContent = 'Start selling on NaijaMart';
                } else {
                    modeCustomerBtn.classList.add('active');
                    modeCustomerBtn.setAttribute('aria-selected', 'true');
                    modeVendorBtn.classList.remove('active');
                    modeVendorBtn.setAttribute('aria-selected', 'false');
                    vendorFields.classList.add('hidden');
                    customerFields.classList.remove('hidden');
                    titleText.textContent   = 'Create your account';
                    subtitleText.textContent = 'Join us and start shopping today';
                }
                updateSubmit();
            }

            modeCustomerBtn.addEventListener('click', function () { setMode('customer'); });
            modeVendorBtn.addEventListener('click',   function () { setMode('vendor');   });

            // Detect mode from URL param `?account_type=vendor` set by Spring resolver.
            // On error re-render we also honour the value the form re-populates.
            var initialMode = 'customer';
            try {
                var qp = new URLSearchParams(window.location.search).get('account_type');
                if (qp === 'vendor') initialMode = 'vendor';
            } catch (e) { /* ignore */ }
            var repopulated = '${(register.formData['user.attributes.accountType']!'')}';
            if (repopulated === 'vendor') initialMode = 'vendor';
            setMode(initialMode);

            // ── Validation ─────────────────────────────────────────────────
            function setValidity(el, isValid, touched) {
                if (!touched) { el.classList.remove('valid', 'invalid'); return; }
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

            function checkPhone() {
                var touched = phone.value.length > 0;
                var ok = PHONE_RE.test(phone.value.trim());
                setValidity(phone, ok, touched);
                phoneError.classList.toggle('show', touched && !ok);
                return ok;
            }

            function checkWebsite() {
                var touched = websiteUrl.value.length > 0;
                var ok = URL_RE.test(websiteUrl.value.trim());
                setValidity(websiteUrl, ok, touched);
                websiteError.classList.toggle('show', touched && !ok);
                return ok;
            }

            var pwdRules = {
                length:  function (v) { return v.length >= 8; },
                upper:   function (v) { return /[A-Z]/.test(v); },
                lower:   function (v) { return /[a-z]/.test(v); },
                number:  function (v) { return /[0-9]/.test(v); },
                special: function (v) { return /[^A-Za-z0-9]/.test(v); }
            };

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

            function checkLogoSize() {
                if (!logoInput.files || logoInput.files.length === 0) return true;
                var ok = logoInput.files[0].size <= MAX_LOGO_BYTES;
                logoError.classList.toggle('show', !ok);
                return ok;
            }

            logoInput.addEventListener('change', function () {
                if (!logoInput.files || logoInput.files.length === 0) return;
                var f = logoInput.files[0];
                if (f.size > MAX_LOGO_BYTES) {
                    logoInput.value = '';
                    logoError.classList.add('show');
                    return;
                }
                logoError.classList.remove('show');
                logoLabel.textContent = f.name;
                var url = URL.createObjectURL(f);
                logoPreview.innerHTML = '<img src="' + url + '" alt="Logo preview"/>';
                updateSubmit();
            });

            function updateSubmit() {
                var sharedOk = checkEmail() && checkPassword() && checkConfirm();
                var modeOk;
                if (currentMode === 'vendor') {
                    modeOk = companyName.value.trim().length > 0 &&
                             checkPhone() && checkWebsite() && checkLogoSize();
                } else {
                    modeOk = firstName.value.trim().length > 0 &&
                             lastName.value.trim().length  > 0;
                }
                submitBtn.disabled = !(sharedOk && modeOk);
            }

            [firstName, lastName, companyName].forEach(function (el) {
                if (el) el.addEventListener('input', updateSubmit);
            });
            email.addEventListener('input', updateSubmit);
            phone.addEventListener('input', updateSubmit);
            websiteUrl.addEventListener('input', updateSubmit);
            password.addEventListener('input', function () {
                updateSubmit();
                if (confirm.value.length > 0) checkConfirm();
            });
            confirm.addEventListener('input', updateSubmit);

            document.getElementById('registerForm').addEventListener('submit', function (e) {
                if (usernameHidden) usernameHidden.value = email.value;
                if (currentMode === 'vendor') {
                    // Keycloak requires firstName/lastName by default — mirror companyName into firstName
                    // so vendor accounts still satisfy the standard user profile validators.
                    vendorFirstNameHidden.value = companyName.value.trim();
                }
                if (submitBtn.disabled) e.preventDefault();
            });

            updateSubmit();
        })();
    </script>
</body>
</html>
