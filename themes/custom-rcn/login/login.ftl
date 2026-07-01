<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>Login — RCN CMS</title>

        <meta name="description" content="Log in to the RCN CMS">
        <!-- Tailwind CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Google Fonts used by the theme -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
    <#elseif section = "form">

        <div class="min-h-screen flex items-center justify-center p-4 bg-rev-page bg-dot-pattern">
            <div class="fixed top-0 left-0 right-0 h-1 bg-rev-red z-50"></div>

            <div class="w-full max-w-md">
                <div class="login-card bg-rev-surface rounded-xl border border-rev-border p-8 md:p-10">
                    <div class="flex justify-center mb-6">
                        <img src="${url.resourcesPath}/img/logo-red.png" alt="RCN Logo" class="h-12 w-auto" onerror="this.style.display='none'">
                    </div>

                    <h1 class="font-display text-3xl md:text-4xl text-rev-ink uppercase text-center tracking-tight">Editor Login</h1>
                    <p class="text-sm text-rev-muted text-center mt-2 mb-8">Access the revolutionary press management system</p>

                    <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-5">
                        <div>
                            <label for="username" class="mono-label block mb-2">Email or Username</label>
                            <input type="text" id="username" name="username" placeholder="you@example.com" class="form-input" autocomplete="username" required value="${(login.username!'')}">
                        </div>

                        <div>
                            <label for="password" class="mono-label block mb-2">Password</label>
                            <input type="password" id="password" name="password" placeholder="••••••••" class="form-input" autocomplete="current-password" required>
                        </div>

                        <button type="submit" class="red-btn w-full mt-2" id="kc-login">Sign In →</button>
                    </form>

                    <p class="text-center text-[11px] text-rev-muted mt-6 leading-relaxed">This area is restricted to RCN editorial collective members. All access is logged.</p>
                </div>

                <p class="text-center text-xs text-rev-muted mt-6">&copy; 2026 Revolutionary Communists of Nigeria</p>
            </div>
        </div>

        <script src="${url.resourcesPath}/js/login.js"></script>

    </#if>
</@layout.registrationLayout>

