<#if user.anonymous>
    <style>
        .sign-in-instructions {
            margin: auto;
            width: 100%;
            text-align: center;
            padding: 30px 0;
            color: #000;
        }
        #lia-body.SignInInstructions .custom-signIn-help {
            text-align: center !important;
            margin-top: 10px !important ;
            padding-top: 20px;
        }
        
        #lia-body.SignInInstructions #customSignIn {
            
            text-align: center;
            margin: auto !important;
            margin-top: 30px !important; 
            padding: 12px 20px;
            display: table;
            font-size: 17px;
            line-height: initial;
        }
        #lia-body.SignInInstructions .custom-sign-in .lia-button-primary{
            width: max-content;
        }
        #lia-body.SignInInstructions .lia-content .lia-button.lia-button-help {
            width: max-content;
            margin: 0 auto;
            background: transparent;
            border: 1px solid #000; 
            padding: 12px 20px;
            display: table;
            font-size: 17px;
            line-height: initial;
        }
        #lia-body.SignInInstructions .lia-content .lia-button.lia-button-help:hover {
             border: 1px solid #000;
        }

    </style>
    <div class="sign-in-instructions">
        <p>Your community account is now associated with your organizational account for Power BI.</p>

        <p>You no longer need to maintain separate community specific credentials. When you sign in with your organizational account, you will be automatically signed in to the community.</p>

<#-- Referer URL needs to be added at the end of Sign-In URL. This will allow the user to redirect back to the page where the user clicked Sign-In button. otherwise, the user will be redirected to Homepage after Sign-In  -->

        <div class="custom-sign-in"><a class="lia-button lia-button-primary" id="customSignIn" href="/plugins/common/feature/oauth2sso_v2/sso_login_redirect?referer=${http.request.referrer}"><span>Sign in to your Organization account</span></a>
        </div>
<#-- Sign In link should be following 
https://community.powerbi.com/t5/Community-Blog/The-Power-BI-Community-is-Making-Changes-More-Details/ba-p/551677 -->
        <p class="custom-signIn-help"><a class="lia-button lia-button-help" href="https://community.powerbi.com/t5/Community-Blog/The-Power-BI-Community-is-Making-Changes-More-Details/ba-p/551677">Sign in help</a></p>
    </div>
</#if>
