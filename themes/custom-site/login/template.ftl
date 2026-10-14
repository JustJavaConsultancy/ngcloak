<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/justjava-mark.svg" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#nested "header">
</head>
<body>
<div class="jj-root">
    <div class="jj-bg" aria-hidden="true">
        <img class="jj-orbital" src="${url.resourcesPath}/img/orbital-motif.svg" alt="" />
        <div class="jj-glow jj-glow-a"></div>
        <div class="jj-glow jj-glow-b"></div>
        <div class="jj-grid"></div>
    </div>

    <div class="jj-shell">
        <aside class="jj-brand">
            <div class="jj-brand-top">
                <img class="jj-wordmark" src="${url.resourcesPath}/img/justjava-wordmark-white.svg" alt="JustJava" />
                <span class="jj-pill">${msg("adminConsole")}</span>
            </div>
            <div class="jj-brand-main">
                <h1>${msg("brandHeadline")?no_esc}</h1>
                <p>${msg("brandSubhead")}</p>
                <ul class="jj-points">
                    <li><span class="jj-dot"></span>${msg("brandPoint1")}</li>
                    <li><span class="jj-dot"></span>${msg("brandPoint2")}</li>
                    <li><span class="jj-dot"></span>${msg("brandPoint3")}</li>
                </ul>
            </div>
            <div class="jj-brand-foot">
                <div class="jj-secure">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none"><path d="M12 2l8 4v6c0 5-3.5 8.5-8 10-4.5-1.5-8-5-8-10V6l8-4z" stroke="#5ACAF9" stroke-width="1.8" stroke-linejoin="round"/><path d="M9 12l2 2 4-4" stroke="#5ACAF9" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
                    <span>${msg("brandSecureNote")}</span>
                </div>
            </div>
        </aside>

        <main class="jj-main">
            <div class="jj-mobile-logo">
                <img src="${url.resourcesPath}/img/justjava-mark.svg" alt="JustJava" />
            </div>
            <div class="jj-card">
                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="jj-alert jj-alert-${message.type}">
                        <#if message.type = 'success'><span class="jj-alert-icon">&#10003;</span></#if>
                        <#if message.type = 'error'><span class="jj-alert-icon">!</span></#if>
                        <#if message.type = 'warning'><span class="jj-alert-icon">!</span></#if>
                        <#if message.type = 'info'><span class="jj-alert-icon">i</span></#if>
                        <span class="jj-alert-text">${kcSanitize(message.summary)?no_esc}</span>
                    </div>
                </#if>
                <#nested "form">
                <#if displayInfo>
                    <div class="jj-info">
                        <#nested "info">
                    </div>
                </#if>
                <#if auth?has_content && auth.showUsername()>
                    <div class="jj-username-chip">
                        <span>${auth.attemptedUsername}</span>
                        <a href="${url.loginRestartFlowUrl}">${msg("restartLoginTooltip")}</a>
                    </div>
                </#if>
                <#if displayRequiredFields>
                    <p class="jj-required">${msg("requiredFields")}</p>
                </#if>
            </div>
            <p class="jj-foot">&copy; JustJava &middot; ${msg("footTagline")}</p>
        </main>
    </div>
</div>
</body>
</html>
</#macro>
