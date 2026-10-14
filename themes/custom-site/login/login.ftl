<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=(realm.password && social.providers?? && social.providers?has_content); section>
<#if section = "header">
<#elseif section = "form">
<h2 class="jj-card-h">${msg("loginHeadline")}</h2>
<p class="jj-card-sub">${msg("loginSubhead")}</p>
<form id="kc-form-login" action="${url.loginAction}" method="post">
    <label class="jj-label" for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
    <input class="jj-input <#if messagesPerField.existsError('username','password')>jj-input-error</#if>" id="username" name="username" type="text" autocomplete="username" placeholder="you@justjava.tech" value="${(login.username!'')}" autofocus aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
    <#if messagesPerField.existsError('username','password')>
        <p class="jj-field-error">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
    </#if>

    <label class="jj-label" for="password">${msg("password")}</label>
    <input class="jj-input" id="password" name="password" type="password" autocomplete="current-password" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" />

    <div class="jj-row">
        <#if realm.rememberMe>
            <label class="jj-check"><input type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if> /> ${msg("rememberMe")}</label>
        <#else><span></span></#if>
        <#if realm.resetPasswordAllowed>
            <a class="jj-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
        </#if>
    </div>

    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
    <button class="jj-btn" type="submit" id="kc-login">${msg("doLogIn")}</button>
</form>

<#if realm.password && realm.registrationAllowed && !registrationDisabled??>
    <p class="jj-alt">${msg("noAccount")} <a class="jj-link" href="${url.registrationUrl}">${msg("doRegister")}</a></p>
</#if>
<#elseif section = "info">
    <#if realm.password && social.providers?? && social.providers?has_content>
        <div class="jj-divider">${msg("identity-provider-login-label")}</div>
        <ul class="jj-social">
            <#list social.providers as p>
                <li><a href="${p.loginUrl}" id="social-${p.alias}">${p.displayName!p.alias}</a></li>
            </#list>
        </ul>
    </#if>
</#if>
</@layout.registrationLayout>
