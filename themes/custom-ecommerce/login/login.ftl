<#ftl output_format="HTML">
<!DOCTYPE html>
<html lang="${locale.currentLanguageTag!'en'}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In | JustJava</title>
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
            padding: 44px 40px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.45);
        }

        .brand { text-align: center; margin-bottom: 28px; }

        .brand-mark {
            width: 56px; height: 56px;
            background: linear-gradient(135deg, #6b3a1f, #c4622d);
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 14px;
            box-shadow: 0 8px 20px rgba(107, 58, 31, 0.3);
        }

        .brand-mark svg { width: 30px; height: 30px; fill: white; }

        .brand h1 {
            font-size: 22px;
            font-weight: 700;
            color: #1a0a00;
            letter-spacing: -0.5px;
        }

        .brand p {
            font-size: 13px;
            color: #9ca3af;
            margin-top: 4px;
        }

        h2 {
            font-size: 20px;
            font-weight: 600;
            color: #1a0a00;
            margin-bottom: 6px;
            text-align: center;
        }

        .subtitle {
            text-align: center;
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 26px;
        }

        .alert {
            padding: 12px 14px;
            border-radius: 8px;
            margin-bottom: 18px;
            font-size: 13px;
            line-height: 1.4;
        }

        .alert-error   { background: #fef2f2; border: 1px solid #fecaca; color: #b91c1c; }
        .alert-warning { background: #fffbeb; border: 1px solid #fde68a; color: #b45309; }
        .alert-success { background: #f0fdf4; border: 1px solid #bbf7d0; color: #15803d; }
        .alert-info    { background: #eff6ff; border: 1px solid #bfdbfe; color: #1d4ed8; }

        .field { margin-bottom: 16px; }

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

        .input-wrap input { padding-right: 42px; }

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

        .row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 18px 0;
            gap: 12px;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 13px;
            color: #6b7280;
            cursor: pointer;
            font-weight: 400;
            margin: 0;
            user-select: none;
        }

        .checkbox-label input[type="checkbox"] {
            width: 15px; height: 15px;
            accent-color: #6b3a1f;
            cursor: pointer;
        }

        .link {
            font-size: 13px;
            color: #6b3a1f;
            text-decoration: none;
            font-weight: 600;
        }

        .link:hover { text-decoration: underline; }

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
        }

        .btn:hover { opacity: 0.93; }
        .btn:active { transform: scale(0.99); }

        .footer {
            text-align: center;
            font-size: 13px;
            color: #6b7280;
            margin-top: 22px;
        }

        .footer a {
            color: #6b3a1f;
            font-weight: 600;
            text-decoration: none;
        }

        .footer a:hover { text-decoration: underline; }

        @media (max-width: 480px) {
            .card { padding: 32px 22px; }
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
            <p>Premium coffee, delivered.</p>
        </div>

        <h2>Welcome back</h2>
        <p class="subtitle">Sign in to your account to continue</p>

        <#if message?has_content>
            <div class="alert alert-${message.type}">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <form id="loginForm" action="${url.loginAction}" method="post" novalidate>
            <div class="field">
                <label for="username">Email address</label>
                <input
                    id="username"
                    name="username"
                    type="email"
                    autocomplete="email"
                    autofocus
                    required
                    value="${(login.username!'')}"
                    placeholder="you@example.com"
                />
            </div>

            <div class="field">
                <label for="password">Password</label>
                <div class="input-wrap">
                    <input
                        id="password"
                        name="password"
                        type="password"
                        autocomplete="current-password"
                        required
                        placeholder="Enter your password"
                    />
                    <button type="button" class="toggle-pwd" id="togglePwd" aria-label="Show password">
                        <svg id="eyeIcon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
                    </button>
                </div>
            </div>

            <div class="row">
                <#if realm.rememberMe>
                    <label class="checkbox-label" for="rememberMe">
                        <input type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                        Remember me
                    </label>
                <#else>
                    <span></span>
                </#if>

                <#if realm.resetPasswordAllowed>
                    <a href="${url.loginResetCredentialsUrl}" class="link">Forgot password?</a>
                </#if>
            </div>

            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>>

            <button type="submit" class="btn" name="login" id="kc-login">Sign in</button>
        </form>

        <#if realm.registrationAllowed>
            <div class="footer">
                Don't have an account? <a href="${url.registrationUrl}">Create one</a>
            </div>
        </#if>
    </div>

    <script>
        (function () {
            var toggle = document.getElementById('togglePwd');
            var pwd = document.getElementById('password');
            var eye = document.getElementById('eyeIcon');

            var EYE_OPEN = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/>';
            var EYE_OFF  = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/>';

            toggle.addEventListener('click', function () {
                var showing = pwd.type === 'text';
                pwd.type = showing ? 'password' : 'text';
                eye.innerHTML = showing ? EYE_OPEN : EYE_OFF;
                toggle.setAttribute('aria-label', showing ? 'Show password' : 'Hide password');
            });
        })();
    </script>
</body>
</html>
