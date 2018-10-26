<#if !(webuisupport.path.parameters.name.get("reg-page",false))>
<div class="sign-in-instructions">
  <div class="lia-fa"></div>
  <p>Please sign in with your community credentials to associate them with your organizational account. If you don't already have community credentials, click <a href="${webUi.getUserRegistrationPageUrl("/")}">Register Now</a>.</p>
</div>
<style type="text/css">
  .sign-in-instructions {
      border: 1px solid #000;
      background: #fff;
      padding: 15px 20px;
      margin-bottom: 20px;
  }
  .sign-in-instructions .lia-fa {
      display: block;
      background: url(${asset.get("/html/assets/exclamation.png")});
      background-repeat: no-repeat;
      background-position: center;
      margin: 14px;
      height: 25px;
  }
  .sign-in-instructions p {
      font-size: 14px;
      text-align: center;
  }
  .UserLoginPage .lia-breadcrumb .child-thread {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
      display: block;
  }
</style>
</#if>