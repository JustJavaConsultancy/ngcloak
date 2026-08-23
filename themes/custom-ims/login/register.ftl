<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <title>Crimson IMS · Create Account</title>
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
                width: 42%; min-height: 100vh; position: relative; color: #fff; overflow: hidden;
                background:
                    radial-gradient(ellipse 60% 55% at 88% 8%, rgba(99,102,241,.35), transparent 60%),
                    radial-gradient(ellipse 60% 55% at 12% 92%, rgba(255,107,74,.30), transparent 60%),
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
                content: ""; position: absolute; left: -180px; bottom: -180px; width: 460px; height: 460px;
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
                gap: 1.8rem; padding: 1.5rem 0;
            }

            .c-hero-visual {
                position: relative; width: min(70%, 17rem); aspect-ratio: 5 / 4;
                border-radius: 22px;
                background:
                    radial-gradient(120% 100% at 0% 0%, rgba(255,107,74,.16), transparent 55%),
                    linear-gradient(155deg, #0f172a 0%, #1e1b4b 100%);
                box-shadow: 0 30px 60px rgba(0,0,0,.45), inset 0 1px 0 rgba(255,255,255,.06);
                overflow: hidden;
                animation: c-float 6s ease-in-out infinite;
            }
            .c-hero-visual::before {
                content: ""; position: absolute; inset: 14px 14px auto 14px; height: 26px;
                border-radius: 8px;
                background: linear-gradient(90deg, rgba(255,255,255,.08), rgba(255,255,255,.02));
                border: 1px solid rgba(255,255,255,.06);
            }
            .c-hero-visual::after {
                content: ""; position: absolute; left: 22px; top: 21px; width: 30px; height: 12px;
                border-radius: 5px;
                background: linear-gradient(90deg, var(--c-primary), var(--c-primary-2));
                box-shadow: 0 0 14px rgba(99,102,241,.5);
            }
            .c-hv-panel { position: absolute; left: 14px; right: 14px; bottom: 14px; top: 54px; border-radius: 12px; background: linear-gradient(155deg, rgba(255,255,255,.05), rgba(255,255,255,.02)); border: 1px solid rgba(255,255,255,.05); overflow: hidden; }
            .c-hv-bars { position: absolute; inset: 14px 14px 14px auto; width: 45%; display: grid; grid-template-rows: repeat(4, 1fr); gap: 7px; }
            .c-hv-bars span { display: block; height: 100%; border-radius: 999px; background: rgba(255,255,255,.06); position: relative; overflow: hidden; }
            .c-hv-bars span::after { content: ""; position: absolute; inset: 0 auto 0 0; border-radius: inherit; background: linear-gradient(90deg, var(--c-primary), var(--c-primary-2)); box-shadow: 0 0 10px rgba(99,102,241,.45); }
            .c-hv-bars span:nth-child(1)::after { width: 78%; }
            .c-hv-bars span:nth-child(2)::after { width: 52%; background: linear-gradient(90deg, var(--c-accent), var(--c-accent-2)); box-shadow: 0 0 10px rgba(255,107,74,.45); }
            .c-hv-bars span:nth-child(3)::after { width: 88%; }
            .c-hv-bars span:nth-child(4)::after { width: 34%; }
            .c-hv-chart { position: absolute; inset: 14px auto 14px 14px; width: 45%; border-radius: 8px; background: linear-gradient(180deg, rgba(79,70,229,.14), transparent 60%); overflow: hidden; }
            .c-hv-chart::before { content: ""; position: absolute; inset: 40% 8% 20% 8%; background: linear-gradient(to top, rgba(79,70,229,.4), transparent); clip-path: polygon(0 80%, 14% 55%, 28% 68%, 42% 30%, 56% 50%, 72% 18%, 86% 42%, 100% 12%, 100% 100%, 0 100%); }
            .c-hv-orbit { position: absolute; right: -60px; top: -60px; width: 170px; height: 170px; border-radius: 50%; border: 1.5px dashed rgba(99,102,241,.35); animation: c-spin-slow 26s linear infinite; }
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

            .c-perks { list-style: none; padding: 0; margin: .3rem 0 0; display: grid; gap: .55rem; text-align: left; width: min(80%, 18rem); }
            .c-perks li { display: flex; align-items: center; gap: .6rem; color: rgba(255,255,255,.82); font-size: .78rem; font-weight: 500; }
            .c-perks li::before {
                content: "✓"; width: 1.1rem; height: 1.1rem; flex: 0 0 auto;
                display: grid; place-items: center;
                border-radius: 50%;
                background: linear-gradient(135deg, var(--c-primary), var(--c-primary-2));
                color: #fff; font-size: .68rem; font-weight: 900;
            }

            .c-status { position: relative; display: flex; align-items: center; gap: .8rem; color: rgba(255,255,255,.72); font-size: .68rem; font-weight: 600; letter-spacing: .04em; text-transform: uppercase; }
            .c-live { display: inline-flex; align-items: center; gap: .45rem; }
            .c-live::before { content: ""; width: .5rem; height: .5rem; border-radius: 50%; background: var(--c-sage); box-shadow: 0 0 0 0 rgba(16,185,129,.5); animation: c-pulse-ring 2s infinite; }
            .c-status-sep { width: 1px; height: .8rem; background: rgba(255,255,255,.25); }

            .c-form-panel {
                width: 58%; min-height: 100vh;
                display: flex; align-items: center; justify-content: center;
                background: var(--c-cream);
                padding: clamp(1.5rem, 4vw, 3rem);
                position: relative;
                overflow-y: auto;
            }
            .c-form-panel::before {
                content: ""; position: absolute; inset: 0; pointer-events: none;
                background-image:
                    radial-gradient(circle at 15% 20%, rgba(15,23,42,.05) 1px, transparent 1.4px),
                    radial-gradient(circle at 80% 80%, rgba(15,23,42,.04) 1px, transparent 1.4px);
                background-size: 160px 160px, 200px 200px;
            }

            .c-register-wrap { position: relative; width: min(90%, 30rem); animation: c-fade-up .8s .1s both; }

            .c-eyebrow { display: inline-flex; align-items: center; gap: .5rem; padding: .35rem .7rem .35rem .55rem; border-radius: 999px; background: var(--c-primary-soft); border: 1px solid rgba(79,70,229,.15); color: var(--c-primary-dark); font-size: .66rem; font-weight: 700; letter-spacing: .04em; margin-bottom: 1rem; }
            .c-eyebrow::before { content: ""; width: .45rem; height: .45rem; border-radius: 50%; background: var(--c-primary); }

            .c-title {
                margin: 0; color: var(--c-ink);
                font-family: "Fraunces", Georgia, serif; font-weight: 500;
                font-size: clamp(1.75rem, 2.6vw, 2.15rem); line-height: 1.1; letter-spacing: -.03em;
            }
            .c-title em { color: var(--c-primary); font-style: italic; }
            .c-subtitle { margin: .55rem 0 1.6rem; color: var(--c-muted); font-size: .88rem; }

            .c-form { display: flex; flex-direction: column; gap: 1rem; }
            .c-row { display: grid; grid-template-columns: 1fr 1fr; gap: 1rem; }
            .c-field-label { display: block; margin-bottom: .5rem; color: var(--c-ink-2); font-size: .72rem; font-weight: 700; letter-spacing: .01em; text-transform: uppercase; }

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
                width: 100%; height: 2.9rem;
                border: 1.5px solid var(--c-line); border-radius: .7rem;
                background: #fff; color: var(--c-ink);
                font-size: .88rem; font-weight: 500;
                outline: none;
                padding: 0 2.8rem 0 2.6rem;
                transition: border-color .2s ease, box-shadow .2s ease, background .2s ease;
            }
            .c-input::placeholder { color: #94a3b8; opacity: 1; }
            .c-input:hover { border-color: rgba(15,23,42,.15); }
            .c-input:focus { border-color: var(--c-primary); box-shadow: 0 0 0 4px rgba(79,70,229,.14); }
            .c-input[aria-invalid="true"] { border-color: #dc2626; background: #fef2f2; }

            .c-error { margin: .45rem 0 0; color: #dc2626; font-size: .76rem; line-height: 1.35; font-weight: 600; }
            .c-hint { margin: .4rem 0 0; color: var(--c-muted); font-size: .72rem; }

            .c-terms { display: flex; align-items: flex-start; gap: .6rem; margin-top: .2rem; }
            .c-checkbox {
                width: .95rem; height: .95rem; margin: .15rem 0 0; flex: 0 0 auto;
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
            .c-terms-label { color: var(--c-muted); font-size: .8rem; line-height: 1.45; user-select: none; }
            .c-terms-label a { color: var(--c-primary); font-weight: 700; text-decoration: none; }
            .c-terms-label a:hover { text-decoration: underline; }

            .c-submit {
                width: 100%; height: 3.1rem; margin-top: .5rem;
                border: 0; border-radius: .7rem;
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
            .c-submit:disabled { cursor: wait; opacity: .78; transform: none; }

            .c-login-link { display: block; margin-top: 1.1rem; text-align: center; color: var(--c-muted); font-size: .88rem; }
            .c-login-link a { color: var(--c-primary); font-weight: 700; text-decoration: none; }
            .c-login-link a:hover { text-decoration: underline; }

            .c-security-footer {
                margin-top: 1.8rem; padding-top: 1.2rem;
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
                .c-brand-main { padding: 1.5rem 0 .8rem; gap: 1rem; }
                .c-hero-visual { width: min(60vw, 14rem); }
                .c-perks { display: none; }
                .c-status { justify-content: center; padding-top: 1rem; }
                .c-form-panel { width: 100%; min-height: auto; flex: 1; align-items: flex-start; padding: 2rem 1.4rem 2.5rem; border-radius: 1.8rem 1.8rem 0 0; }
                .c-register-wrap { width: 100%; max-width: 26rem; margin: 0 auto; }
                .c-row { grid-template-columns: 1fr; }
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
                        <h2>Join the next generation of <em>operational precision.</em></h2>
                        <p>Real-time stock, automated procurement and predictive insight — all in one workspace.</p>
                    </div>
                    <ul class="c-perks">
                        <li>Real-time stock across every warehouse</li>
                        <li>Automated procurement &amp; supplier ops</li>
                        <li>Predictive insight, boardroom-ready reports</li>
                    </ul>
                </div>

                <div class="c-status" aria-label="System status">
                    <span class="c-live">Onboarding Live</span>
                    <span class="c-status-sep" aria-hidden="true"></span>
                    <span>Core Cluster · East-1</span>
                </div>
            </aside>

            <main class="c-form-panel">
                <div class="c-register-wrap">
                    <span class="c-eyebrow">Create Account</span>
                    <h1 class="c-title">Start your <em>Crimson</em> journey.</h1>
                    <p class="c-subtitle">Setting up your workspace takes under a minute — no credit card required.</p>

                    <form id="kc-register-form" class="c-form" action="${url.registrationAction}" method="post" novalidate>
                        <div class="c-row">
                            <div class="c-field">
                                <label for="firstName" class="c-field-label">${msg("firstName")}</label>
                                <div class="c-input-wrap">
                                    <span class="c-input-icon" aria-hidden="true">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24">
                                            <circle cx="12" cy="8" r="3.6"></circle>
                                            <path d="M4.5 20a7.5 7.5 0 0 1 15 0"></path>
                                        </svg>
                                    </span>
                                    <input
                                            id="firstName"
                                            name="firstName"
                                            type="text"
                                            class="c-input"
                                            value="${(register.formData.firstName!'')}"
                                            autocomplete="given-name"
                                            placeholder="Ada"
                                            aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                    />
                                </div>
                                <#if messagesPerField.existsError('firstName')>
                                    <p class="c-error">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</p>
                                </#if>
                            </div>

                            <div class="c-field">
                                <label for="lastName" class="c-field-label">${msg("lastName")}</label>
                                <div class="c-input-wrap">
                                    <span class="c-input-icon" aria-hidden="true">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24">
                                            <circle cx="12" cy="8" r="3.6"></circle>
                                            <path d="M4.5 20a7.5 7.5 0 0 1 15 0"></path>
                                        </svg>
                                    </span>
                                    <input
                                            id="lastName"
                                            name="lastName"
                                            type="text"
                                            class="c-input"
                                            value="${(register.formData.lastName!'')}"
                                            autocomplete="family-name"
                                            placeholder="Lovelace"
                                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                    />
                                </div>
                                <#if messagesPerField.existsError('lastName')>
                                    <p class="c-error">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</p>
                                </#if>
                            </div>
                        </div>

                        <div class="c-field">
                            <label for="email" class="c-field-label">${msg("email")}</label>
                            <div class="c-input-wrap">
                                <span class="c-input-icon" aria-hidden="true">
                                    <svg class="c-icon-svg" viewBox="0 0 24 24">
                                        <rect x="3.5" y="5.5" width="17" height="13" rx="2.5"></rect>
                                        <path d="m5 8 7 5 7-5"></path>
                                    </svg>
                                </span>
                                <input
                                        id="email"
                                        name="email"
                                        type="email"
                                        class="c-input"
                                        value="${(register.formData.email!'')}"
                                        autocomplete="email"
                                        placeholder="you@company.com"
                                        aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                />
                            </div>
                            <#if messagesPerField.existsError('email')>
                                <p class="c-error">${kcSanitize(messagesPerField.get('email'))?no_esc}</p>
                            </#if>
                        </div>

                        <#if !realm.registrationEmailAsUsername>
                            <div class="c-field">
                                <label for="username" class="c-field-label">${msg("username")}</label>
                                <div class="c-input-wrap">
                                    <span class="c-input-icon" aria-hidden="true">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24">
                                            <path d="M4 20v-1a4 4 0 0 1 4-4h8a4 4 0 0 1 4 4v1"></path>
                                            <circle cx="12" cy="8" r="4"></circle>
                                        </svg>
                                    </span>
                                    <input
                                            id="username"
                                            name="username"
                                            type="text"
                                            class="c-input"
                                            value="${(register.formData.username!'')}"
                                            autocomplete="username"
                                            placeholder="ada.lovelace"
                                            aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                    />
                                </div>
                                <#if messagesPerField.existsError('username')>
                                    <p class="c-error">${kcSanitize(messagesPerField.get('username'))?no_esc}</p>
                                </#if>
                            </div>
                        </#if>

                        <#if passwordRequired??>
                            <div class="c-field">
                                <label for="password" class="c-field-label">${msg("password")}</label>
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
                                            autocomplete="new-password"
                                            placeholder="At least 8 characters"
                                            aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                    />
                                    <button class="c-eye-button" type="button" data-toggle="password" aria-label="Show password">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true">
                                            <path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path>
                                            <circle cx="12" cy="12" r="2.8"></circle>
                                        </svg>
                                    </button>
                                </div>
                                <#if messagesPerField.existsError('password')>
                                    <p class="c-error">${kcSanitize(messagesPerField.get('password'))?no_esc}</p>
                                <#else>
                                    <p class="c-hint">Use 8+ characters with a mix of letters, numbers &amp; symbols.</p>
                                </#if>
                            </div>

                            <div class="c-field">
                                <label for="password-confirm" class="c-field-label">${msg("passwordConfirm")}</label>
                                <div class="c-input-wrap">
                                    <span class="c-input-icon" aria-hidden="true">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24">
                                            <rect x="5.5" y="10" width="13" height="10" rx="2.2"></rect>
                                            <path d="M8 10V7.6a4 4 0 0 1 8 0V10"></path>
                                        </svg>
                                    </span>
                                    <input
                                            id="password-confirm"
                                            name="password-confirm"
                                            type="password"
                                            class="c-input"
                                            autocomplete="new-password"
                                            placeholder="Repeat your password"
                                            aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                    />
                                    <button class="c-eye-button" type="button" data-toggle="password-confirm" aria-label="Show password">
                                        <svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true">
                                            <path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path>
                                            <circle cx="12" cy="12" r="2.8"></circle>
                                        </svg>
                                    </button>
                                </div>
                                <#if messagesPerField.existsError('password-confirm')>
                                    <p class="c-error">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</p>
                                </#if>
                            </div>
                        </#if>

                        <#if recaptchaRequired??>
                            <div class="c-field">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </#if>

                        <#if termsAcceptanceRequired??>
                            <div class="c-terms">
                                <input type="checkbox" id="termsAccepted" name="termsAccepted" class="c-checkbox"
                                       <#if register.formData.termsAccepted??>checked</#if>
                                       aria-invalid="<#if messagesPerField.existsError('termsAccepted')>true</#if>"
                                />
                                <label for="termsAccepted" class="c-terms-label">
                                    I agree to the <a href="${properties.termsUrl!'#'}" target="_blank" rel="noreferrer">Terms of Service</a>
                                    and <a href="${properties.privacyUrl!'#'}" target="_blank" rel="noreferrer">Privacy Policy</a>.
                                </label>
                            </div>
                            <#if messagesPerField.existsError('termsAccepted')>
                                <p class="c-error">${kcSanitize(messagesPerField.get('termsAccepted'))?no_esc}</p>
                            </#if>
                        </#if>

                        <button id="kc-register" class="c-submit" type="submit">Create Account →</button>
                    </form>

                    <p class="c-login-link">
                        Already have an account? <a href="${url.loginUrl}">Sign in instead</a>
                    </p>

                    <div class="c-security-footer">
                        <span class="c-secure-copy">
                            <svg class="c-lock-small" viewBox="0 0 24 24" aria-hidden="true">
                                <rect x="6" y="10" width="12" height="10" rx="2"></rect>
                                <path d="M8.5 10V7.5a3.5 3.5 0 0 1 7 0V10"></path>
                            </svg>
                            TLS 1.3 · Encrypted
                        </span>
                        <span>v2.4.0 · Core Production</span>
                    </div>
                </div>
            </main>
        </div>

        <script>
            (function () {
                var openSvg = '<svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6-3.5 6-9.5 6-9.5-6-9.5-6Z"></path><circle cx="12" cy="12" r="2.8"></circle></svg>';
                var closedSvg = '<svg class="c-icon-svg" viewBox="0 0 24 24" aria-hidden="true"><path d="M2.5 12s3.5-6 9.5-6 9.5 6 9.5 6a19.4 19.4 0 0 1-2.8 3.1M9.9 17.6A9.9 9.9 0 0 1 2.5 12"></path><path d="M4 4l16 16"></path><path d="M10.7 10.7a2.8 2.8 0 0 0 3.6 3.6"></path></svg>';

                document.querySelectorAll('[data-toggle]').forEach(function (btn) {
                    btn.addEventListener('click', function () {
                        var target = document.getElementById(btn.getAttribute('data-toggle'));
                        if (!target) return;
                        var showing = target.type === 'text';
                        target.type = showing ? 'password' : 'text';
                        btn.setAttribute('aria-label', showing ? 'Show password' : 'Hide password');
                        btn.innerHTML = showing ? openSvg : closedSvg;
                    });
                });

                var form = document.getElementById('kc-register-form');
                var submit = document.getElementById('kc-register');
                if (form && submit) {
                    form.addEventListener('submit', function () {
                        submit.disabled = true;
                        submit.textContent = 'Creating account…';
                    });
                }
            })();
        </script>
    </#if>
</@layout.registrationLayout>
