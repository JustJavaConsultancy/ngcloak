<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=false; section>
    <#if section = "header">
        <title>Crimson IMS · Sign In</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,500;1,9..144,500&family=Inter:wght@400;450;500;600;700;800&display=swap" rel="stylesheet">

        <style>
            :root {
                --c-ink: #0f172a;
                --c-ink-2: #1e293b;
                --c-muted: #64748b;
                --c-cream: #fbfaf7;
                --c-foam: #ffffff;
                --c-milk: #f4f2fc;
                --c-line: rgba(15, 23, 42, 0.08);
                --c-primary: #4f46e5;
                --c-primary-2: #6366f1;
                --c-primary-dark: #3730a3;
                --c-primary-soft: #eef2ff;
                --c-accent: #ff6b4a;
                --c-accent-2: #ff8a63;
                --c-sage: #10b981;
            }

            /* Hide default Keycloak chrome */
            html, body, .login-pf, .login-pf body {
                min-height: 100%; margin: 0; background: var(--c-cream);
            }
            .login-pf-page-header, .login-pf-header, h1#kc-page-title,
            .login-pf-signup, #kc-header, #kc-header-wrapper { display: none !important; }
            .login-pf-page { padding: 0 !important; margin: 0 !important; background: var(--c-cream) !important; border: 0 !important; }
            .login-pf-page .card-pf {
                width: 100% !important; max-width: none !important; min-height: 100vh !important;
                padding: 0 !important; margin: 0 !important; border: 0 !important;
                box-shadow: none !important; background: transparent !important;
            }
            #kc-content, #kc-content-wrapper, #kc-form, #kc-form-wrapper {
                width: 100%; margin: 0 !important; padding: 0 !important;
            }

            * { box-sizing: border-box; }
            body {
                font-family: "Inter", ui-sans-serif, system-ui, -apple-system, "Segoe UI", sans-serif;
                color: var(--c-ink);
                -webkit-font-smoothing: antialiased;
                text-rendering: geometricPrecision;
            }

            @keyframes c-fade-up { from { opacity: 0; transform: translateY(24px); } to { opacity: 1; transform: none; } }
            @keyframes c-fade-in { from { opacity: 0; } to { opacity: 1; } }
            @keyframes c-float { 0%,100% { transform: translateY(0) rotate(0deg); } 50% { transform: translateY(-12px) rotate(1.5deg); } }
            @keyframes c-shimmer { 0% { background-position: -200% 0; } 100% { background-position: 200% 0; } }
            @keyframes c-pulse-ring { 0% { box-shadow: 0 0 0 0 rgba(16,185,129,.55); } 70% { box-shadow: 0 0 0 14px rgba(16,185,129,0); } 100% { box-shadow: 0 0 0 0 rgba(16,185,129,0); } }
            @keyframes c-spin-slow { to { transform: rotate(360deg); } }

            .c-shell { min-height: 100vh; width: 100%; display: flex; overflow: hidden; background: var(--c-cream); }

            .c-brand-panel {
                width: 46%; min-height: 100vh; position: relative; color: #fff; overflow: hidden;
                background:
                    radial-gradient(ellipse 60% 55% at 12% 8%, rgba(99,102,241,.35), transparent 60%),
                    radial-gradient(ellipse 60% 55% at 88% 92%, rgba(255,107,74,.30), transparent 60%),
                    linear-gradient(155deg, #1e1b4b 0%, #312e81 55%, #0f172a 100%);
                display: flex; flex-direction: column; justify-content: space-between;
                padding: clamp(1.8rem, 3.6vw, 3.2rem);
            }
            .c-brand-panel::before {
                content: ""; position: absolute; inset: 0; pointer-events: none;
                background-image:
                    radial-gradient(circle at 20% 30%, rgba(255,255,255,.06) 1px, transparent 1.4px),
                    radial-gradient(circle at 70% 70%, rgba(255,255,255,.04) 1px, transparent 1.4px);
                background-size: 140px 140px, 180px 180px;
            }
            .c-brand-panel::after {
                content: ""; position: absolute; right: -180px; top: -180px; width: 460px; height: 460px;
                border-radius: 50%; border: 1.5px dashed rgba(99,102,241,.28);
                animation: c-spin-slow 40s linear infinite;
                pointer-events: none;
            }

            .c-logo { position: relative; display: inline-flex; align-items: center; gap: .7rem; line-height: 1; animation: c-fade-in .8s ease both; }
            .c-logo-mark {
                width: 2.1rem; height: 2.1rem; display: grid; place-items: center;
                border-radius: .6rem;
                background: linear-gradient(135deg, var(--c-primary), var(--c-primary-2));
                color: #fff; font-size: 1rem;
                box-shadow: 0 10px 24px rgba(79,70,229,.4);
            }
            .c-logo-title { color: #fff; font-size: 1.1rem; font-weight: 800; letter-spacing: -.01em; }
            .c-logo-subtitle { display: block; margin-top: .18rem; color: var(--c-accent); font-size: .58rem; font-weight: 800; letter-spacing: .2em; text-transform: uppercase; }

            .c-brand-main {
                position: relative; flex: 1;
                display: flex; flex-direction: column; align-items: center; justify-content: center;
                gap: 2rem; padding: 2rem 0;
            }

            .c-hero-visual {
                position: relative; width: min(78%, 20rem); aspect-ratio: 5 / 4;
                border-radius: 22px;
                background:
                    radial-gradient(120% 100% at 0% 0%, rgba(255,107,74,.16), transparent 55%),
                    linear-gradient(155deg, #0f172a 0%, #1e1b4b 100%);
                box-shadow: 0 30px 60px rgba(0,0,0,.45), inset 0 1px 0 rgba(255,255,255,.06);
                overflow: hidden;
                animation: c-float 6s ease-in-out infinite;
            }
            .c-hero-visual::before {
                content: ""; position: absolute; inset: 16px 16px auto 16px; height: 28px;
                border-radius: 8px;
                background: linear-gradient(90deg, rgba(255,255,255,.08), rgba(255,255,255,.02));
                border: 1px solid rgba(255,255,255,.06);
            }
            .c-hero-visual::after {
                content: ""; position: absolute; left: 26px; top: 24px; width: 34px; height: 12px;
                border-radius: 5px;
                background: linear-gradient(90deg, var(--c-primary), var(--c-primary-2));
                box-shadow: 0 0 14px rgba(99,102,241,.5);
            }
            .c-hv-panel { position: absolute; left: 16px; right: 16px; bottom: 16px; top: 62px; border-radius: 12px; background: linear-gradient(155deg, rgba(255,255,255,.05), rgba(255,255,255,.02)); border: 1px solid rgba(255,255,255,.05); overflow: hidden; }
            .c-hv-bars { position: absolute; inset: 18px 18px 18px auto; width: 45%; display: grid; grid-template-rows: repeat(4, 1fr); gap: 8px; }
            .c-hv-bars span { display: block; height: 100%; border-radius: 999px; background: rgba(255,255,255,.06); position: relative; overflow: hidden; }
            .c-hv-bars span::after { content: ""; position: absolute; inset: 0 auto 0 0; border-radius: inherit; background: linear-gradient(90deg, var(--c-primary), var(--c-primary-2)); box-shadow: 0 0 10px rgba(99,102,241,.45); }
            .c-hv-bars span:nth-child(1)::after { width: 78%; }
            .c-hv-bars span:nth-child(2)::after { width: 52%; background: linear-gradient(90deg, var(--c-accent), var(--c-accent-2)); box-shadow: 0 0 10px rgba(255,107,74,.45); }
            .c-hv-bars span:nth-child(3)::after { width: 88%; }
            .c-hv-bars span:nth-child(4)::after { width: 34%; }
            .c-hv-chart { position: absolute; inset: 18px auto 18px 18px; width: 45%; border-radius: 8px; background: linear-gradient(180deg, rgba(79,70,229,.14), transparent 60%); overflow: hidden; }
            .c-hv-chart::before { content: ""; position: absolute; inset: 40% 8% 20% 8%; background: linear-gradient(to top, rgba(79,70,229,.4), transparent); clip-path: polygon(0 80%, 14% 55%, 28% 68%, 42% 30%, 56% 50%, 72% 18%, 86% 42%, 100% 12%, 100% 100%, 0 100%); }
            .c-hv-orbit { position: absolute; right: -60px; top: -60px; width: 180px; height: 180px; border-radius: 50%; border: 1.5px dashed rgba(99,102,241,.35); animation: c-spin-slow 26s linear infinite; }
            .c-hv-orbit::after { content: ""; position: absolute; left: 50%; top: -7px; width: 12px; height: 12px; margin-left: -6px; border-radius: 50%; background: var(--c-accent); box-shadow: 0 0 16px var(--c-accent); }

            .c-brand-copy { text-align: center; max-width: 22rem; animation: c-fade-up 1s .2s both; }
            .c-brand-copy h2 {
                margin: 0; color: #fff;
                font-family: "Fraunces", Georgia, serif; font-weight: 500;
                font-size: clamp(1.4rem, 2.2vw, 1.85rem); line-height: 1.1; letter-spacing: -.028em;
            }
            .c-brand-copy h2 em {
                background: linear-gradient(120deg, var(--c-accent), #ffb59a, var(--c-accent));
                background-size: 200% auto;
                -webkit-background-clip: text; background-clip: text; color: transparent;
                font-style: italic;
                animation: c-shimmer 5s linear infinite;
            }
            .c-brand-copy p { margin: .7rem auto 0; color: rgba(255,255,255,.72); font-size: .82rem; line-height: 1.55; }

            .c-status { position: relative; display: flex; align-items: center; gap: .8rem; color: rgba(255,255,255,.72); font-size: .68rem; font-weight: 600; letter-spacing: .04em; text-transform: uppercase; }
            .c-live { display: inline-flex; align-items: center; gap: .45rem; }
            .c-live::before { content: ""; width: .5rem; height: .5rem; border-radius: 50%; background: var(--c-sage); box-shadow: 0 0 0 0 rgba(16,185,129,.5); animation: c-pulse-ring 2s infinite; }
            .c-status-sep { width: 1px; height: .8rem; background: rgba(255,255,255,.25); }

            .c-form-panel {
                width: 54%; min-height: 100vh;
                display: flex; align-items: center; justify-content: center;
                background: var(--c-cream);
                padding: clamp(1.5rem, 5vw, 4rem);
                position: relative;
            }
            .c-form-panel::before {
                content: ""; position: absolute; inset: 0; pointer-events: none;
                background-image:
                    radial-gradient(circle at 15% 20%, rgba(15,23,42,.05) 1px, transparent 1.4px),
                    radial-gradient(circle at 80% 80%, rgba(15,23,42,.04) 1px, transparent 1.4px);
                background-size: 160px 160px, 200px 200px;
            }

            .c-login-wrap { position: relative; width: min(62%, 24rem); min-width: 19rem; animation: c-fade-up .8s .1s both; }

            .c-eyebrow { display: inline-flex; align-items: center; gap: .5rem; padding: .35rem .7rem .35rem .55rem; border-radius: 999px; background: var(--c-primary-soft); border: 1px solid rgba(79,70,229,.15); color: var(--c-primary-dark); font-size: .66rem; font-weight: 700; letter-spacing: .04em; margin-bottom: 1.1rem; }
            .c-eyebrow::before { content: ""; width: .45rem; height: .45rem; border-radius: 50%; background: var(--c-primary); }

            .c-login-title {
                margin: 0; color: var(--c-ink);
                font-family: "Fraunces", Georgia, serif; font-weight: 500;
                font-size: clamp(1.75rem, 2.6vw, 2.2rem); line-height: 1.1; letter-spacing: -.03em;
            }
            .c-login-title em { color: var(--c-primary); font-style: italic; }
            .c-login-subtitle { margin: .6rem 0 1.8rem; color: var(--c-muted); font-size: .88rem; }

            .c-form { display: flex; flex-direction: column; gap: 1.1rem; }
            .c-field-row { display: flex; align-items: center; justify-content: space-between; gap: 1rem; margin-bottom: .45rem; }
            .c-field-label { color: var(--c-ink-2); font-size: .72rem; line-height: 1; font-weight: 700; letter-spacing: .01em; text-transform: uppercase; }
            .c-forgot { color: var(--c-primary); font-size: .72rem; font-weight: 700; text-decoration: none; }
            .c-forgot:hover { text-decoration: underline; }

            .c-input-wrap { position: relative; width: 100%; }
            .c-input-icon, .c-eye-button {
                position: absolute; top: 50%; transform: translateY(-50%);
                display: inline-flex; align-items: center; justify-content: center;
                color: var(--c-muted);
            }
            .c-input-icon { left: .95rem; width: 1rem; height: 1rem; pointer-events: none; }
            .c-eye-button { right: .55rem; width: 1.9rem; height: 1.9rem; border: 0; background: transparent; cursor: pointer; padding: 0; border-radius: .4rem; transition: background .2s ease, color .2s ease; }
            .c-eye-button:hover { background: var(--c-primary-soft); color: var(--c-primary); }
            .c-icon-svg { width: .95rem; height: .95rem; stroke: currentColor; stroke-width: 1.85; stroke-linecap: round; stroke-linejoin: round; fill: none; }

            .c-input {
                width: 100%; height: 3rem;
                border: 1.5px solid var(--c-line); border-radius: .75rem;
                background: #fff; color: var(--c-ink);
                font-size: .9rem; font-weight: 500;
                outline: none;
                padding: 0 2.8rem 0 2.6rem;
                transition: border-color .2s ease, box-shadow .2s ease, background .2s ease;
            }
            .c-input::placeholder { color: #94a3b8; opacity: 1; }
            .c-input:hover { border-color: rgba(15,23,42,.15); }
            .c-input:focus { border-color: var(--c-primary); box-shadow: 0 0 0 4px rgba(79,70,229,.14); }

            .c-error { margin: .5rem 0 0; color: #dc2626; font-size: .78rem; line-height: 1.35; font-weight: 600; }

            .c-options { display: flex; align-items: center; gap: .55rem; margin-top: .1rem; }
            .c-checkbox {
                width: .95rem; height: .95rem; margin: 0;
                appearance: none; -webkit-appearance: none;
                border: 1.5px solid rgba(15,23,42,.2); border-radius: .25rem;
                background: #fff; cursor: pointer;
                display: grid; place-items: center;
                transition: border-color .2s ease, background .2s ease;
            }
            .c-checkbox:checked { border-color: var(--c-primary); background: var(--c-primary); }
            .c-checkbox:checked::after {
                content: ""; width: .3rem; height: .5rem;
                border: solid #fff; border-width: 0 2px 2px 0;
                transform: rotate(45deg) translateY(-1px);
            }
            .c-remember-label { color: var(--c-muted); font-size: .78rem; font-weight: 500; user-select: none; }

            .c-submit {
                width: 100%; height: 3.2rem; margin-top: .5rem;
                border: 0; border-radius: .75rem;
                color: #fff;
                background: linear-gradient(135deg, var(--c-primary) 0%, var(--c-primary-2) 100%);
                font-size: .95rem; font-weight: 700; letter-spacing: -.005em;
                cursor: pointer;
                box-shadow: 0 14px 30px rgba(79,70,229,.32);
                transition: transform .2s ease, box-shadow .2s ease, filter .2s ease;
                position: relative; overflow: hidden;
            }
            .c-submit::before {
                content: ""; position: absolute; inset: 0;
                background: linear-gradient(120deg, transparent 30%, rgba(255,255,255,.22) 50%, transparent 70%);
                transform: translateX(-100%);
                transition: transform .6s ease;
            }
            .c-submit:hover { transform: translateY(-1px); box-shadow: 0 20px 40px rgba(79,70,229,.4); }
            .c-submit:hover::before { transform: translateX(100%); }
            .c-submit:active { transform: translateY(0); }
            .c-submit:disabled { cursor: wait; opacity: .78; transform: none; }

            .c-divider { display: flex; align-items: center; gap: .8rem; margin: 1.4rem 0 .2rem; color: var(--c-muted); font-size: .7rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; }
            .c-divider::before, .c-divider::after { content: ""; flex: 1; height: 1px; background: var(--c-line); }

            .c-register-link { display: block; margin-top: 1rem; text-align: center; color: var(--c-muted); font-size: .88rem; }
            .c-register-link a { color: var(--c-primary); font-weight: 700; text-decoration: none; }
            .c-register-link a:hover { text-decoration: underline; }

            .c-security-footer {
                margin-top: 2.4rem; padding-top: 1.3rem;
                border-top: 1px solid var(--c-line);
                display: flex; align-items: center; justify-content: space-between; gap: 1rem;
                color: var(--c-muted); font-size: .65rem; line-height: 1; font-weight: 700; text-transform: uppercase; letter-spacing: .06em;
            }
            .c-secure-copy { display: inline-flex; align-items: center; gap: .4rem; }
            .c-lock-small { width: .75rem; height: .75rem; stroke: currentColor; stroke-width: 2; fill: none; stroke-linecap: round; stroke-linejoin: round; }

            @media (max-width: 900px) {
                .c-shell { min-height: 100dvh; flex-direction: column; background: linear-gradient(155deg, #1e1b4b, #312e81); }
                .c-brand-panel { width: 100%; min-height: auto; padding: 1.8rem 1.4rem 1.4rem; background: transparent; }
                .c-brand-panel::after { display: none; }
                .c-brand-main { padding: 1.8rem 0 1rem; gap: 1.2rem; }
                .c-hero-visual { width: min(70vw, 16rem); }
                .c-status { justify-content: center; padding-top: 1rem; }
                .c-form-panel { width: 100%; min-height: auto; flex: 1; align-items: flex-start; padding: 2rem 1.4rem 2.5rem; border-radius: 1.8rem 1.8rem 0 0; }
                .c-login-wrap { width: 100%; max-width: 24rem; min-width: 0; margin: 0 auto; }
            }
        </style>
    <#elseif section = "form">
        <div class="c-shell">
            <aside class="c-brand-panel" aria-label="Crimson IMS brand panel">
                <div class="c-logo" aria-label="Crimson IMS Enterprise Hub">
                    <span class="c-logo-mark">◆</span>
                    <span>
                        <span class="c-logo-title">Crimson IMS</span>
                        <span class="c-logo-subtitle">Enterprise Hub</span>
                    </span>
                </div>

                <div class="c-brand-main">
                    <div class="c-hero-visual" aria-hidden="true">
                        <div class="c-hv-panel">
                            <div class="c-hv-chart"></div>
                            <div class="c-hv-bars"><span></span><span></span><span></span><span></span></div>
                        </div>
                        <div class="c-hv-orbit"></div>
                    </div>
                    <div class="c-brand-copy">
                        <h2>Precision in logistics, <em>power in data.</em></h2>
                        <p>Real-time inventory intelligence for high-velocity global operations.</p>
                    </div>
                </div>

                <div class="c-status" aria-label="System status">
                    <span class="c-live">System Live</span>
                    <span class="c-status-sep" aria-hidden="true"></span>
                    <span>Core Cluster · East-1</span>
                </div>
            </aside>

            <main class="c-form-panel">
                <div class="c-login-wrap">
                    <span class="c-eyebrow">Secure Sign-In</span>
                    <h1 class="c-login-title">Welcome <em>back.</em></h1>
                    <p class="c-login-subtitle">Enter your credentials to access Crimson Core.</p>

                    <form id="kc-form-login" class="c-form" action="${url.loginAction}" method="post" novalidate>
                        <div class="c-field">
                            <label for="username" class="c-field-label">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>Corporate Email</#if>
                            </label>
                            <div class="c-input-wrap" style="margin-top: .5rem;">
                                <span class="c-input-icon" aria-hidden="true">
                                    <svg class="c-icon-svg" viewBox="0 0 24 24">
                                        <rect x="3.5" y="5.5" width="17" height="13" rx="2.5"></rect>
                                        <path d="m5 8 7 5 7-5"></path>
                                    </svg>
                                </span>
                                <input
                                        id="username"
                                        name="username"
                                        type="text"
                                        value="${(login.username!'')}"
                                        class="c-input"
                                        autocomplete="username"
                                        placeholder="you@company.com"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>
                            <#if messagesPerField.existsError('username','password')>
                                <p class="c-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                            </#if>
                        </div>

                        <div class="c-field">
                            <div class="c-field-row">
                                <label for="password" class="c-field-label">${msg("password")}</label>
                                <#if realm.resetPasswordAllowed>
                                    <a class="c-forgot" href="${url.loginResetCredentialsUrl}">Forgot password?</a>
                                </#if>
                            </div>
                            <div class="c-input-wrap">
                                <span class="c-input-icon" aria-hidden="true">
                                    <svg class="c-icon-svg" viewBox="0 0 24 24">
                                        <rect x="5.5" y="10" width="13" height="10" rx="2.2"></rect>
                                        <path d="M8 10V7.6a4 4 0 0 1 8 0V10"></path>
                                    </svg>
                                </span>
                                <input
                                        id="password"
                                        name="password"
                                        type="password"
                                        class="c-input"
                                        autocomplete="current-password"
                                        placeholder="Your password"
                                />
                                <button class="c-eye-button" type="button" id="togglePassword" aria-label="Show password">
                                    <svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true">
                                        <path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path>
                                        <circle cx="12" cy="12" r="2.8"></circle>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <#if realm.rememberMe>
                            <div class="c-options">
                                <input
                                        id="rememberMe"
                                        name="rememberMe"
                                        type="checkbox"
                                        class="c-checkbox"
                                        <#if login.rememberMe??>checked</#if>
                                />
                                <label for="rememberMe" class="c-remember-label">Keep me signed in on this terminal</label>
                            </div>
                        </#if>

                        <input type="hidden" name="credentialId" id="id-hidden-input" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button id="kc-login" class="c-submit" type="submit">Sign In →</button>
                    </form>

                    <#if realm.registrationAllowed && !registrationDisabled??>
                        <div class="c-divider">or</div>
                        <p class="c-register-link">
                            New to Crimson IMS? <a href="${url.registrationUrl}">Create an account</a>
                        </p>
                    </#if>

                    <div class="c-security-footer">
                        <span class="c-secure-copy">
                            <svg class="c-lock-small" viewBox="0 0 24 24" aria-hidden="true">
                                <rect x="6" y="10" width="12" height="10" rx="2"></rect>
                                <path d="M8.5 10V7.5a3.5 3.5 0 0 1 7 0V10"></path>
                            </svg>
                            Secured with TLS 1.3
                        </span>
                        <span>v2.4.0 · Core Production</span>
                    </div>
                </div>
            </main>
        </div>

        <script>
            (function () {
                var toggle = document.getElementById("togglePassword");
                var password = document.getElementById("password");
                var form = document.getElementById("kc-form-login");
                var submit = document.getElementById("kc-login");

                if (toggle && password) {
                    toggle.addEventListener("click", function () {
                        var showing = password.type === "text";
                        password.type = showing ? "password" : "text";
                        toggle.setAttribute("aria-label", showing ? "Show password" : "Hide password");
                        toggle.innerHTML = showing
                            ? '<svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path><circle cx="12" cy="12" r="2.8"></circle></svg>'
                            : '<svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6a19.4 19.4 0 0 1-2.8 3.1M9.9 17.6A9.9 9.9 0 0 1 2.5 12"></path><path d="M4 4l16 16"></path><path d="M10.7 10.7a2.8 2.8 0 0 0 3.6 3.6"></path></svg>';
                    });
                }

                if (form && submit) {
                    form.addEventListener("submit", function () {
                        submit.disabled = true;
                        submit.textContent = "Signing in…";
                    });
                }
            })();
        </script>
    </#if>
</@layout.registrationLayout>
