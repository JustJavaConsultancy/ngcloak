<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>

<#if section = "header">
<title>FAMS | Crimson Vault · Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Tailwind + Fonts -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet">

<script>
tailwind.config = {
  theme: {
    extend: {
      colors: {
        primary: "#b91c1c",
        background: "#fef6f5",
        surface: "#ffffff",
        onSurface: "#2d1a1a",
        secondary: "#b45a5a",
        outline: "#eccbc8"
      },
      fontFamily: {
        body: ["Inter"]
      }
    }
  }
};
</script>

<style>
body {
  font-family: Inter, sans-serif;
}
.red-pattern {
  background-image: radial-gradient(rgba(185,28,28,0.05) 1px, transparent 1px);
  background-size: 24px 24px;
}
</style>

<#elseif section = "form">

<div class="min-h-screen flex red-pattern bg-background">

  <!-- LEFT PANEL -->
  <div class="hidden lg:flex w-1/2 flex-col justify-between p-16 text-white"
       style="background: radial-gradient(circle at top left,#3b0a0a,#1f0505);">

    <div>
      <h1 class="text-4xl font-black tracking-tight">FAMS</h1>
      <p class="text-red-200 text-sm mt-1">Institutional Asset Management System</p>
    </div>

    <div>
      <h2 class="text-2xl font-semibold mb-4">Crimson Vault</h2>
      <p class="text-red-100/80">
        Secure, track, and manage enterprise assets with full lifecycle visibility.
      </p>
    </div>

    <p class="text-xs text-red-300/60">© 2026 FAMS · JustJava Technologies</p>
  </div>

  <!-- RIGHT PANEL -->
  <div class="w-full lg:w-1/2 flex items-center justify-center p-8">

    <div class="w-full max-w-md bg-white rounded-xl shadow-lg p-8">

      <!-- Header -->
      <div class="mb-8 text-center">
        <h2 class="text-3xl font-bold text-gray-900">Welcome Back</h2>
        <p class="text-gray-500 text-sm mt-2">Sign in to your FAMS workspace</p>
      </div>

      <!-- LOGIN FORM -->
      <form id="kc-form-login" action="${url.loginAction}" method="post" class="space-y-6">

        <!-- Username -->
        <div>
          <label class="text-sm font-medium text-gray-600">
            <#if !realm.loginWithEmailAllowed>
              ${msg("username")}
            <#elseif !realm.registrationEmailAsUsername>
              ${msg("usernameOrEmail")}
            <#else>
              ${msg("email")}
            </#if>
          </label>

          <input
            id="username"
            name="username"
            value="${(login.username!'')}"
            type="text"
            class="w-full mt-2 h-12 px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-300 outline-none"
            placeholder="name@company.com"
            autocomplete="username"
            required
          />

          <#if messagesPerField.existsError('username','password')>
            <p class="text-red-600 text-xs mt-1">
              ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
            </p>
          </#if>
        </div>

        <!-- Password -->
        <div>
          <label class="text-sm font-medium text-gray-600">${msg("password")}</label>

          <div class="relative mt-2">
            <input
              id="password"
              name="password"
              type="password"
              class="w-full h-12 px-4 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-300 outline-none"
              placeholder="••••••••"
              autocomplete="current-password"
              required
            />

            <button type="button"
                    onclick="togglePassword()"
                    class="absolute right-3 top-3 text-gray-500">
              <span class="material-symbols-outlined" id="eye">visibility</span>
            </button>
          </div>
        </div>

        <!-- Hidden Keycloak field -->
        <input type="hidden" name="credentialId"
               <#if auth.selectedCredential?has_content>
                 value="${auth.selectedCredential}"
               </#if> />

        <!-- Submit -->
        <button type="submit"
                class="w-full h-12 bg-red-600 text-white font-semibold rounded-lg hover:bg-red-700 transition">
          Sign In
        </button>
      </form>

      <!-- OPTIONAL SIGNUP -->
      <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
        <p class="text-center text-sm text-gray-500 mt-6">
          Need an account?
          <a href="${url.registrationUrl}" class="text-red-600 font-semibold">Sign up</a>
        </p>
      </#if>

    </div>
  </div>
</div>

<script>
function togglePassword() {
  const pwd = document.getElementById("password");
  const icon = document.getElementById("eye");

  if (pwd.type === "password") {
    pwd.type = "text";
    icon.textContent = "visibility_off";
  } else {
    pwd.type = "password";
    icon.textContent = "visibility";
  }
}

window.addEventListener("load", () => {
  const u = document.getElementById("username");
  if (u && !u.value) u.focus();
});
</script>

</#if>

</@layout.registrationLayout>