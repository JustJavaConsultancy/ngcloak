<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=false; section>
    <#if section = "header">
        <title>JustJava · Sign In</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,500;1,9..144,500&family=Inter:wght@400;450;500;600;700;800&display=swap" rel="stylesheet">

        <style>
            :root {
                --jj-espresso: #1a1410;
                --jj-coffee: #2e1e14;
                --jj-mocha: #3d2817;
                --jj-caramel: #c8843c;
                --jj-amber: #e8a852;
                --jj-latte: #e8b878;
                --jj-cream: #faf6f0;
                --jj-foam: #fff9f0;
                --jj-milk: #f4ead8;
                --jj-terracotta: #a44a2e;
                --jj-sage: #6b8e5a;
                --jj-ink: #1a1410;
                --jj-muted: #7a6a5e;
                --jj-line: rgba(60, 40, 25, 0.10);
            }

            /* Hide default Keycloak chrome */
            html, body, .login-pf, .login-pf body {
                min-height: 100%; margin: 0; background: var(--jj-cream);
            }
            .login-pf-page-header, .login-pf-header, h1#kc-page-title,
            .login-pf-signup, #kc-header, #kc-header-wrapper { display: none !important; }
            .login-pf-page { padding: 0 !important; margin: 0 !important; background: var(--jj-cream) !important; border: 0 !important; }
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
                color: var(--jj-ink);
                -webkit-font-smoothing: antialiased;
                text-rendering: geometricPrecision;
            }

            @keyframes jj-fade-up { from { opacity: 0; transform: translateY(24px); } to { opacity: 1; transform: none; } }
            @keyframes jj-fade-in { from { opacity: 0; } to { opacity: 1; } }
            @keyframes jj-float { 0%,100% { transform: translateY(0) rotate(0deg); } 50% { transform: translateY(-12px) rotate(2deg); } }
            @keyframes jj-drift { 0%,100% { transform: translate(0,0); } 50% { transform: translate(8px,-14px); } }
            @keyframes jj-steam { 0% { opacity: 0; transform: translateY(0) scale(1); } 30% { opacity: .55; } 100% { opacity: 0; transform: translateY(-60px) scale(1.5); } }
            @keyframes jj-shimmer { 0% { background-position: -200% 0; } 100% { background-position: 200% 0; } }
            @keyframes jj-pulse-ring { 0% { box-shadow: 0 0 0 0 rgba(232,168,82,.55); } 70% { box-shadow: 0 0 0 14px rgba(232,168,82,0); } 100% { box-shadow: 0 0 0 0 rgba(232,168,82,0); } }
            @keyframes jj-spin-slow { to { transform: rotate(360deg); } }

            .jj-shell { min-height: 100vh; width: 100%; display: flex; overflow: hidden; background: var(--jj-cream); }

            .jj-brand-panel {
                width: 46%; min-height: 100vh; position: relative; color: var(--jj-cream); overflow: hidden;
                background:
                    radial-gradient(ellipse 60% 55% at 12% 8%, rgba(232,168,82,.32), transparent 60%),
                    radial-gradient(ellipse 60% 55% at 88% 92%, rgba(164,74,46,.30), transparent 60%),
                    linear-gradient(155deg, var(--jj-espresso) 0%, var(--jj-mocha) 55%, #241610 100%);
                display: flex; flex-direction: column; justify-content: space-between;
                padding: clamp(1.8rem, 3.6vw, 3.2rem);
            }
            .jj-brand-panel::before {
                content: ""; position: absolute; inset: 0; pointer-events: none;
                background-image:
                    radial-gradient(circle at 20% 30%, rgba(250, 246, 240, .06) 1px, transparent 1.4px),
                    radial-gradient(circle at 70% 70%, rgba(250, 246, 240, .04) 1px, transparent 1.4px);
                background-size: 140px 140px, 180px 180px;
            }
            .jj-brand-panel::after {
                content: ""; position: absolute; right: -180px; top: -180px; width: 460px; height: 460px;
                border-radius: 50%; border: 2px dashed rgba(232,168,82,.22);
                animation: jj-spin-slow 40s linear infinite;
                pointer-events: none;
            }

            .jj-logo { position: relative; display: inline-flex; align-items: center; gap: .7rem; line-height: 1; animation: jj-fade-in .8s ease both; }
            .jj-logo-mark {
                width: 2.1rem; height: 2.1rem; display: grid; place-items: center;
                border-radius: .65rem;
                background: linear-gradient(135deg, var(--jj-caramel), var(--jj-terracotta));
                color: var(--jj-cream); font-size: 1rem;
                box-shadow: 0 10px 24px rgba(164, 74, 46, .35);
            }
            .jj-logo-title { color: var(--jj-cream); font-size: 1.1rem; font-weight: 800; letter-spacing: -.01em; }
            .jj-logo-subtitle { display: block; margin-top: .18rem; color: var(--jj-amber); font-size: .58rem; font-weight: 800; letter-spacing: .2em; text-transform: uppercase; }

            .jj-brand-main {
                position: relative; flex: 1;
                display: flex; flex-direction: column; align-items: center; justify-content: center;
                gap: 2rem; padding: 2rem 0;
            }

            .jj-hero-cup {
                position: relative; width: min(58%, 16rem); aspect-ratio: 1;
                border-radius: 30% 30% 32% 32%;
                background:
                    radial-gradient(circle at 30% 30%, rgba(255, 220, 170, .3), transparent 55%),
                    linear-gradient(155deg, #4a2f1e 0%, #1a0f08 100%);
                box-shadow: 0 30px 60px rgba(0,0,0,.45), inset 0 1px 0 rgba(255,255,255,.08);
                animation: jj-float 6s ease-in-out infinite;
            }
            .jj-hero-cup::before {
                content: ""; position: absolute; inset: 18% 18% auto 18%; aspect-ratio: 1;
                border-radius: 50%;
                background: radial-gradient(circle at 30% 30%, #f0c896 0%, #c8843c 45%, #6b3d1d 100%);
                box-shadow: inset 0 -12px 26px rgba(0,0,0,.4), inset 0 6px 18px rgba(255,255,255,.15);
            }
            .jj-hero-cup::after {
                content: ""; position: absolute; inset: 26% 30% auto 30%; height: 18%;
                border-radius: 50%;
                background: radial-gradient(ellipse at 50% 30%, rgba(255, 240, 220, .8), rgba(255, 240, 220, 0) 70%);
                filter: blur(2px);
            }
            .jj-steam { position: absolute; left: 50%; top: 8%; width: 12px; height: 12px; border-radius: 50%; background: rgba(255,255,255,.7); filter: blur(6px); animation: jj-steam 3.4s ease-in infinite; }
            .jj-steam.s2 { left: 42%; animation-delay: .8s; }
            .jj-steam.s3 { left: 58%; animation-delay: 1.6s; }

            .jj-brand-copy { text-align: center; max-width: 22rem; animation: jj-fade-up 1s .2s both; }
            .jj-brand-copy h2 {
                margin: 0; color: var(--jj-cream);
                font-family: "Fraunces", Georgia, serif; font-weight: 500;
                font-size: clamp(1.4rem, 2.2vw, 1.85rem); line-height: 1.1; letter-spacing: -.028em;
            }
            .jj-brand-copy h2 em {
                background: linear-gradient(120deg, var(--jj-amber), var(--jj-latte), var(--jj-amber));
                background-size: 200% auto;
                -webkit-background-clip: text; background-clip: text; color: transparent;
                font-style: italic;
                animation: jj-shimmer 5s linear infinite;
            }
            .jj-brand-copy p { margin: .7rem auto 0; color: rgba(250,246,240,.72); font-size: .82rem; line-height: 1.55; }

            .jj-status { position: relative; display: flex; align-items: center; gap: .8rem; color: rgba(250,246,240,.72); font-size: .68rem; font-weight: 600; letter-spacing: .04em; text-transform: uppercase; }
            .jj-live { display: inline-flex; align-items: center; gap: .45rem; }
            .jj-live::before { content: ""; width: .5rem; height: .5rem; border-radius: 50%; background: var(--jj-sage); box-shadow: 0 0 0 0 rgba(107,142,90,.5); animation: jj-pulse-ring 2s infinite; }
            .jj-status-sep { width: 1px; height: .8rem; background: rgba(250,246,240,.25); }

            .jj-form-panel {
                width: 54%; min-height: 100vh;
                display: flex; align-items: center; justify-content: center;
                background: var(--jj-cream);
                padding: clamp(1.5rem, 5vw, 4rem);
                position: relative;
            }
            .jj-form-panel::before {
                content: ""; position: absolute; inset: 0; pointer-events: none;
                background-image:
                    radial-gradient(circle at 15% 20%, rgba(46,30,20,.06) 1px, transparent 1.4px),
                    radial-gradient(circle at 80% 80%, rgba(46,30,20,.04) 1px, transparent 1.4px);
                background-size: 160px 160px, 200px 200px;
            }

            .jj-login-wrap { position: relative; width: min(62%, 24rem); min-width: 19rem; animation: jj-fade-up .8s .1s both; }

            .jj-eyebrow { display: inline-flex; align-items: center; gap: .5rem; padding: .35rem .7rem .35rem .55rem; border-radius: 999px; background: var(--jj-foam); border: 1px solid var(--jj-line); color: var(--jj-mocha); font-size: .66rem; font-weight: 700; letter-spacing: .04em; margin-bottom: 1.1rem; }
            .jj-eyebrow::before { content: ""; width: .45rem; height: .45rem; border-radius: 50%; background: var(--jj-caramel); }

            .jj-login-title {
                margin: 0; color: var(--jj-espresso);
                font-family: "Fraunces", Georgia, serif; font-weight: 500;
                font-size: clamp(1.75rem, 2.6vw, 2.2rem); line-height: 1.1; letter-spacing: -.03em;
            }
            .jj-login-title em { color: var(--jj-terracotta); font-style: italic; }
            .jj-login-subtitle { margin: .6rem 0 1.8rem; color: var(--jj-muted); font-size: .88rem; }

            .jj-form { display: flex; flex-direction: column; gap: 1.1rem; }
            .jj-field-row { display: flex; align-items: center; justify-content: space-between; gap: 1rem; margin-bottom: .45rem; }
            .jj-field-label { color: var(--jj-mocha); font-size: .72rem; line-height: 1; font-weight: 700; letter-spacing: .01em; text-transform: uppercase; }
            .jj-forgot { color: var(--jj-terracotta); font-size: .72rem; font-weight: 700; text-decoration: none; }
            .jj-forgot:hover { text-decoration: underline; }

            .jj-input-wrap { position: relative; width: 100%; }
            .jj-input-icon, .jj-eye-button {
                position: absolute; top: 50%; transform: translateY(-50%);
                display: inline-flex; align-items: center; justify-content: center;
                color: var(--jj-muted);
            }
            .jj-input-icon { left: .95rem; width: 1rem; height: 1rem; pointer-events: none; }
            .jj-eye-button { right: .55rem; width: 1.9rem; height: 1.9rem; border: 0; background: transparent; cursor: pointer; padding: 0; border-radius: .4rem; transition: background .2s ease, color .2s ease; }
            .jj-eye-button:hover { background: var(--jj-milk); color: var(--jj-mocha); }
            .jj-icon-svg { width: .95rem; height: .95rem; stroke: currentColor; stroke-width: 1.85; stroke-linecap: round; stroke-linejoin: round; fill: none; }

            .jj-input {
                width: 100%; height: 3rem;
                border: 1.5px solid var(--jj-line); border-radius: .75rem;
                background: var(--jj-foam); color: var(--jj-espresso);
                font-size: .9rem; font-weight: 500;
                outline: none;
                padding: 0 2.8rem 0 2.6rem;
                transition: border-color .2s ease, box-shadow .2s ease, background .2s ease;
            }
            .jj-input::placeholder { color: #a89886; opacity: 1; }
            .jj-input:hover { border-color: rgba(60,40,25,.2); }
            .jj-input:focus { border-color: var(--jj-caramel); background: #fff; box-shadow: 0 0 0 4px rgba(200,132,60,.14); }

            .jj-error { margin: .5rem 0 0; color: var(--jj-terracotta); font-size: .78rem; line-height: 1.35; font-weight: 600; }

            .jj-options { display: flex; align-items: center; gap: .55rem; margin-top: .1rem; }
            .jj-checkbox {
                width: .95rem; height: .95rem; margin: 0;
                appearance: none; -webkit-appearance: none;
                border: 1.5px solid rgba(60,40,25,.2); border-radius: .25rem;
                background: var(--jj-foam); cursor: pointer;
                display: grid; place-items: center;
                transition: border-color .2s ease, background .2s ease;
            }
            .jj-checkbox:checked { border-color: var(--jj-caramel); background: var(--jj-caramel); }
            .jj-checkbox:checked::after {
                content: ""; width: .3rem; height: .5rem;
                border: solid var(--jj-cream); border-width: 0 2px 2px 0;
                transform: rotate(45deg) translateY(-1px);
            }
            .jj-remember-label { color: var(--jj-muted); font-size: .78rem; font-weight: 500; user-select: none; }

            .jj-submit {
                width: 100%; height: 3.2rem; margin-top: .5rem;
                border: 0; border-radius: .75rem;
                color: var(--jj-cream);
                background: linear-gradient(135deg, var(--jj-espresso) 0%, var(--jj-mocha) 100%);
                font-size: .95rem; font-weight: 700; letter-spacing: -.005em;
                cursor: pointer;
                box-shadow: 0 14px 30px rgba(26,20,16,.25);
                transition: transform .2s ease, box-shadow .2s ease, filter .2s ease;
                position: relative; overflow: hidden;
            }
            .jj-submit::before {
                content: ""; position: absolute; inset: 0;
                background: linear-gradient(120deg, transparent 30%, rgba(232,168,82,.22) 50%, transparent 70%);
                transform: translateX(-100%);
                transition: transform .6s ease;
            }
            .jj-submit:hover { transform: translateY(-1px); box-shadow: 0 20px 40px rgba(26,20,16,.32); }
            .jj-submit:hover::before { transform: translateX(100%); }
            .jj-submit:active { transform: translateY(0); }
            .jj-submit:disabled { cursor: wait; opacity: .78; transform: none; }

            .jj-divider { display: flex; align-items: center; gap: .8rem; margin: 1.4rem 0 .2rem; color: var(--jj-muted); font-size: .7rem; font-weight: 600; letter-spacing: .1em; text-transform: uppercase; }
            .jj-divider::before, .jj-divider::after { content: ""; flex: 1; height: 1px; background: var(--jj-line); }

            .jj-register-link {
                display: block; margin-top: 1rem; text-align: center;
                color: var(--jj-muted); font-size: .88rem;
            }
            .jj-register-link a { color: var(--jj-terracotta); font-weight: 700; text-decoration: none; }
            .jj-register-link a:hover { text-decoration: underline; }

            .jj-security-footer {
                margin-top: 2.4rem; padding-top: 1.3rem;
                border-top: 1px solid var(--jj-line);
                display: flex; align-items: center; justify-content: space-between; gap: 1rem;
                color: var(--jj-muted); font-size: .65rem; line-height: 1; font-weight: 700; text-transform: uppercase; letter-spacing: .06em;
            }
            .jj-secure-copy { display: inline-flex; align-items: center; gap: .4rem; }
            .jj-lock-small { width: .75rem; height: .75rem; stroke: currentColor; stroke-width: 2; fill: none; stroke-linecap: round; stroke-linejoin: round; }

            @media (max-width: 900px) {
                .jj-shell { min-height: 100dvh; flex-direction: column; background: linear-gradient(155deg, var(--jj-espresso), var(--jj-mocha)); }
                .jj-brand-panel { width: 100%; min-height: auto; padding: 1.8rem 1.4rem 1.4rem; background: transparent; }
                .jj-brand-panel::after { display: none; }
                .jj-brand-main { padding: 1.8rem 0 1rem; gap: 1.2rem; }
                .jj-hero-cup { width: min(45vw, 12rem); }
                .jj-status { justify-content: center; padding-top: 1rem; }
                .jj-form-panel { width: 100%; min-height: auto; flex: 1; align-items: flex-start; padding: 2rem 1.4rem 2.5rem; border-radius: 1.8rem 1.8rem 0 0; }
                .jj-login-wrap { width: 100%; max-width: 24rem; min-width: 0; margin: 0 auto; }
            }
        </style>
    <#elseif section = "form">
        <div class="jj-shell">
            <aside class="jj-brand-panel" aria-label="JustJava brand panel">
                <div class="jj-logo" aria-label="JustJava Inventory Ops">
                    <span class="jj-logo-mark">☕</span>
                    <span>
                        <span class="jj-logo-title">JustJava</span>
                        <span class="jj-logo-subtitle">Inventory Ops</span>
                    </span>
                </div>

                <div class="jj-brand-main">
                    <div class="jj-hero-cup" aria-hidden="true">
                        <span class="jj-steam"></span>
                        <span class="jj-steam s2"></span>
                        <span class="jj-steam s3"></span>
                    </div>
                    <div class="jj-brand-copy">
                        <h2>Inventory, <em>perfectly brewed.</em></h2>
                        <p>Real-time stock intelligence, procurement automation and clean insight — served warm.</p>
                    </div>
                </div>

                <div class="jj-status" aria-label="System status">
                    <span class="jj-live">System Live</span>
                    <span class="jj-status-sep" aria-hidden="true"></span>
                    <span>Roast Cluster · East-1</span>
                </div>
            </aside>

            <main class="jj-form-panel">
                <div class="jj-login-wrap">
                    <span class="jj-eyebrow">Secure Sign-In</span>
                    <h1 class="jj-login-title">Welcome <em>back.</em></h1>
                    <p class="jj-login-subtitle">Pour yourself a fresh session — sign in to your JustJava workspace.</p>

                    <form id="kc-form-login" class="jj-form" action="${url.loginAction}" method="post" novalidate>
                        <div class="jj-field">
                            <label for="username" class="jj-field-label">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                <#else>Email Address</#if>
                            </label>
                            <div class="jj-input-wrap" style="margin-top: .5rem;">
                                <span class="jj-input-icon" aria-hidden="true">
                                    <svg class="jj-icon-svg" viewBox="0 0 24 24">
                                        <rect x="3.5" y="5.5" width="17" height="13" rx="2.5"></rect>
                                        <path d="m5 8 7 5 7-5"></path>
                                    </svg>
                                </span>
                                <input
                                        id="username"
                                        name="username"
                                        type="text"
                                        value="${(login.username!'')}"
                                        class="jj-input"
                                        autocomplete="username"
                                        placeholder="you@company.com"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                            </div>
                            <#if messagesPerField.existsError('username','password')>
                                <p class="jj-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                            </#if>
                        </div>

                        <div class="jj-field">
                            <div class="jj-field-row">
                                <label for="password" class="jj-field-label">${msg("password")}</label>
                                <#if realm.resetPasswordAllowed>
                                    <a class="jj-forgot" href="${url.loginResetCredentialsUrl}">Forgot password?</a>
                                </#if>
                            </div>
                            <div class="jj-input-wrap">
                                <span class="jj-input-icon" aria-hidden="true">
                                    <svg class="jj-icon-svg" viewBox="0 0 24 24">
                                        <rect x="5.5" y="10" width="13" height="10" rx="2.2"></rect>
                                        <path d="M8 10V7.6a4 4 0 0 1 8 0V10"></path>
                                    </svg>
                                </span>
                                <input
                                        id="password"
                                        name="password"
                                        type="password"
                                        class="jj-input"
                                        autocomplete="current-password"
                                        placeholder="Your password"
                                />
                                <button class="jj-eye-button" type="button" id="togglePassword" aria-label="Show password">
                                    <svg class="jj-icon-svg jj-eye-open" viewBox="0 0 24 24" aria-hidden="true">
                                        <path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path>
                                        <circle cx="12" cy="12" r="2.8"></circle>
                                    </svg>
                                </button>
                            </div>
                        </div>

                        <#if realm.rememberMe>
                            <div class="jj-options">
                                <input
                                        id="rememberMe"
                                        name="rememberMe"
                                        type="checkbox"
                                        class="jj-checkbox"
                                        <#if login.rememberMe??>checked</#if>
                                />
                                <label for="rememberMe" class="jj-remember-label">Keep me signed in on this device</label>
                            </div>
                        </#if>

                        <input type="hidden" name="credentialId" id="id-hidden-input" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button id="kc-login" class="jj-submit" type="submit">Sign In →</button>
                    </form>

                    <#if realm.registrationAllowed && !registrationDisabled??>
                        <div class="jj-divider">or</div>
                        <p class="jj-register-link">
                            New to JustJava? <a href="${url.registrationUrl}">Create an account</a>
                        </p>
                    </#if>

                    <div class="jj-security-footer">
                        <span class="jj-secure-copy">
                            <svg class="jj-lock-small" viewBox="0 0 24 24" aria-hidden="true">
                                <rect x="6" y="10" width="12" height="10" rx="2"></rect>
                                <path d="M8.5 10V7.5a3.5 3.5 0 0 1 7 0V10"></path>
                            </svg>
                            Secured with TLS 1.3
                        </span>
                        <span>v2.4.0 · Roast Production</span>
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
                            ? '<svg class="jj-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path><circle cx="12" cy="12" r="2.8"></circle></svg>'
                            : '<svg class="jj-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6a19.4 19.4 0 0 1-2.8 3.1M9.9 17.6A9.9 9.9 0 0 1 2.5 12"></path><path d="M4 4l16 16"></path><path d="M10.7 10.7a2.8 2.8 0 0 0 3.6 3.6"></path></svg>';
                    });
                }

                if (form && submit) {
                    form.addEventListener("submit", function () {
                        submit.disabled = true;
                        submit.textContent = "Brewing session…";
                    });
                }
            })();
        </script>
    </#if>
</@layout.registrationLayout>
