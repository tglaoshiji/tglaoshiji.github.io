<!DOCTYPE html>
	<html lang="zh-CN">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>登录 &lsaquo; 电报老司机 &#8212; WordPress</title>
	<meta name='robots' content='max-image-preview:large, noindex, noarchive' />
<link rel='stylesheet' id='dashicons-css' href='wp-includes/css/dashicons.min.css?ver=6.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='buttons-css' href='wp-includes/css/buttons.min.css?ver=6.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='forms-css' href='https://tgdriver.com/wp-admin/css/forms.min.css?ver=6.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='l10n-css' href='https://tgdriver.com/wp-admin/css/l10n.min.css?ver=6.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='login-css' href='https://tgdriver.com/wp-admin/css/login.min.css?ver=6.4.2' type='text/css' media='all' />
<style type="text/css">
    body{background:#7d00a0;background:-o-linear-gradient(45deg,#7d00a0,#c11b8d);background:linear-gradient(45deg,#7d00a0,#c11b8d);height:100vh}
    .login h1 a{background-image:url(wp-content/uploads/2023/05/Telegram.webp);width:180px;background-position:center center;background-size:80px}
    .login-container{position:relative;display:flex;align-items:center;justify-content:center;height:100vh}
    .login-body{position:relative;display:flex;margin:0 1.5rem}
    .login-img{display:none}
    .img-bg{color:#fff;padding:2rem;bottom:-2rem;left:0;top:-2rem;right:0;border-radius:10px;background-image:url(wp-content/themes/onenav/images/login.jpg);background-repeat:no-repeat;background-position:center center;background-size:cover}
    .img-bg h2{font-size:2rem;margin-bottom:1.25rem}
    #login{position:relative;background:#fff;border-radius:10px;padding:28px;width:280px;box-shadow:0 1rem 3rem rgba(0,0,0,.175)}
    .flex-fill{flex:1 1 auto}
    .position-relative{position:relative}
    .position-absolute{position:absolute}
    .shadow-lg{box-shadow:0 1rem 3rem rgba(0,0,0,.175)!important}
    .footer-copyright{bottom:0;color:rgba(255,255,255,.6);text-align:center;margin:20px;left:0;right:0}
    .footer-copyright a{color:rgba(255,255,255,.6);text-decoration:none}
    #login form{-webkit-box-shadow:none;-moz-box-shadow:none;box-shadow:none;border-width:0;padding:0}
    #login form .forgetmenot{float:none}
    .login #login_error,.login .message,.login .success{border-left-color:#40b9f1;box-shadow:none;background:#d4eeff;border-radius:6px;color:#2e73b7}
    .login #login_error{border-left-color:#f1404b;background:#ffd4d6;color:#b72e37}
    #login form p.submit{padding:20px 0 0}
    #login form p.submit .button-primary{float:none;background-color:#f1404b;font-weight:bold;color:#fff;width:100%;height:40px;border-width:0;text-shadow:none!important;border-color:none;transition:.5s}
    #login form input{box-shadow:none!important;outline:none!important}
    #login form p.submit .button-primary:hover{background-color:#444}
    .login #backtoblog,.login #nav{padding:0}
    .login .privacy-policy-page-link{text-align:left;margin:0}
    @media screen and (min-width:768px){.login-body{width:1200px}
    .login-img{display:block}
    #login{margin-left:-60px;padding:40px}
    }
</style>	<meta name='referrer' content='strict-origin-when-cross-origin' />
		<meta name="viewport" content="width=device-width" />
		</head>
	<body class="login no-js login-action-login wp-core-ui  locale-zh-cn">
	<script type="text/javascript">
/* <![CDATA[ */
document.body.className = document.body.className.replace('no-js','js');
/* ]]> */
</script>

	<div class="login-container">
    <div class="login-body">
        <div class="login-img shadow-lg position-relative flex-fill">
            <div class="img-bg position-absolute">
                <div class="login-info">
                    <h2>电报老司机</h1>
                    <p>Telegram频道导航 | 电报导航 | 来不及等待了</p>
                </div>
            </div>
        </div>	<div id="login">
		<h1><a href="https://tgdriver.com/index.html">Telegram频道导航 | 电报导航 | 来不及等待了</a></h1>
	
		<form name="loginform" id="loginform" action="wp-login.php" method="post">
			<p>
				<label for="user_login">用户名或电子邮箱地址</label>
				<input type="text" name="log" id="user_login" class="input" value="" size="20" autocapitalize="off" autocomplete="username" required="required" />
			</p>

			<div class="user-pass-wrap">
				<label for="user_pass">密码</label>
				<div class="wp-pwd">
					<input type="password" name="pwd" id="user_pass" class="input password-input" value="" size="20" autocomplete="current-password" spellcheck="false" required="required" />
					<button type="button" class="button button-secondary wp-hide-pw hide-if-no-js" data-toggle="0" aria-label="显示密码">
						<span class="dashicons dashicons-visibility" aria-hidden="true"></span>
					</button>
				</div>
			</div>
						<p class="forgetmenot"><input name="rememberme" type="checkbox" id="rememberme" value="forever"  /> <label for="rememberme">记住我</label></p>
			<p class="submit">
				<input type="submit" name="wp-submit" id="wp-submit" class="button button-primary button-large" value="登录" />
									<input type="hidden" name="redirect_to" value="https://tgdriver.com" />
									<input type="hidden" name="testcookie" value="1" />
			</p>
		</form>

					<p id="nav">
				<a class="wp-login-lost-password" href="wp-login.php?action=lostpassword">忘记密码？</a>			</p>
			<script type="text/javascript">
/* <![CDATA[ */
function wp_attempt_focus() {setTimeout( function() {try {d = document.getElementById( "user_login" );d.focus(); d.select();} catch( er ) {}}, 200);}
wp_attempt_focus();
if ( typeof wpOnload === 'function' ) { wpOnload() }
/* ]]> */
</script>
		<p id="backtoblog">
			<a href="https://tgdriver.com/index.html">&larr; 返回到电报老司机</a>		</p>
			</div>
		</div><!--login-body END-->
    </div><!--login-container END-->
    <div class="footer-copyright position-absolute">
            <span>Copyright © <a href="https://tgdriver.com/index.html" class="text-white-50" title="电报老司机" rel="home">电报老司机</a></span> 
    </div><script type="text/javascript" src="wp-includes/js/jquery/jquery.min.js?ver=3.7.1" id="jquery-core-js"></script>
<script type="text/javascript" src="wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1" id="jquery-migrate-js"></script>
<script type="text/javascript" id="zxcvbn-async-js-extra">
/* <![CDATA[ */
var _zxcvbnSettings = {"src":"https:\/\/tgdriver.com\/wp-includes\/js\/zxcvbn.min.js"};
/* ]]> */
</script>
<script type="text/javascript" src="wp-includes/js/zxcvbn-async.min.js?ver=1.0" id="zxcvbn-async-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/vendor/wp-polyfill-inert.min.js?ver=3.1.2" id="wp-polyfill-inert-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/vendor/regenerator-runtime.min.js?ver=0.14.0" id="regenerator-runtime-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/vendor/wp-polyfill.min.js?ver=3.15.0" id="wp-polyfill-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/hooks.min.js?ver=c6aec9a8d4e5a5d543a1" id="wp-hooks-js"></script>
<script type="text/javascript" src="wp-includes/js/dist/i18n.min.js?ver=7701b0c3857f914212ef" id="wp-i18n-js"></script>
<script type="text/javascript" id="wp-i18n-js-after">
/* <![CDATA[ */
wp.i18n.setLocaleData( { 'text direction\u0004ltr': [ 'ltr' ] } );
/* ]]> */
</script>
<script type="text/javascript" id="password-strength-meter-js-extra">
/* <![CDATA[ */
var pwsL10n = {"unknown":"\u5bc6\u7801\u5f3a\u5ea6\u672a\u77e5","short":"\u975e\u5e38\u5f31","bad":"\u5f31","good":"\u4e2d\u7b49","strong":"\u5f3a","mismatch":"\u4e0d\u5339\u914d"};
/* ]]> */
</script>
<script type="text/javascript" id="password-strength-meter-js-translations">
/* <![CDATA[ */
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "default", {"translation-revision-date":"2023-11-03 06:37:27+0000","generator":"GlotPress\/4.0.0-alpha.11","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=1; plural=0;","lang":"zh_CN"},"%1$s is deprecated since version %2$s! Use %3$s instead. Please consider writing more inclusive code.":["\u81ea %2$s \u7248\u5f00\u59cb\uff0c%1$s \u5df2\u7ecf\u6dd8\u6c70\uff0c\u8bf7\u6539\u7528 %3$s\u3002\u8bf7\u8003\u8651\u64b0\u5199\u66f4\u5177\u517c\u5bb9\u6027\u7684\u4ee3\u7801\u3002"]}},"comment":{"reference":"wp-admin\/js\/password-strength-meter.js"}} );
/* ]]> */
</script>
<script type="text/javascript" src="https://tgdriver.com/wp-admin/js/password-strength-meter.min.js?ver=6.4.2" id="password-strength-meter-js"></script>
<script type="text/javascript" src="wp-includes/js/underscore.min.js?ver=1.13.4" id="underscore-js"></script>
<script type="text/javascript" id="wp-util-js-extra">
/* <![CDATA[ */
var _wpUtilSettings = {"ajax":{"url":"\/wp-admin\/admin-ajax.php"}};
/* ]]> */
</script>
<script type="text/javascript" src="wp-includes/js/wp-util.min.js?ver=6.4.2" id="wp-util-js"></script>
<script type="text/javascript" id="user-profile-js-extra">
/* <![CDATA[ */
var userProfileL10n = {"user_id":"0","nonce":"31f24b9247"};
/* ]]> */
</script>
<script type="text/javascript" id="user-profile-js-translations">
/* <![CDATA[ */
( function( domain, translations ) {
	var localeData = translations.locale_data[ domain ] || translations.locale_data.messages;
	localeData[""].domain = domain;
	wp.i18n.setLocaleData( localeData, domain );
} )( "default", {"translation-revision-date":"2023-11-03 06:37:27+0000","generator":"GlotPress\/4.0.0-alpha.11","domain":"messages","locale_data":{"messages":{"":{"domain":"messages","plural-forms":"nplurals=1; plural=0;","lang":"zh_CN"},"Your new password has not been saved.":["\u60a8\u7684\u65b0\u5bc6\u7801\u672a\u88ab\u4fdd\u5b58\u3002"],"Hide":["\u9690\u85cf"],"Show":["\u663e\u793a"],"Confirm use of weak password":["\u786e\u8ba4\u4f7f\u7528\u5f31\u5bc6\u7801"],"Hide password":["\u9690\u85cf\u5bc6\u7801"],"Show password":["\u663e\u793a\u5bc6\u7801"]}},"comment":{"reference":"wp-admin\/js\/user-profile.js"}} );
/* ]]> */
</script>
<script type="text/javascript" src="https://tgdriver.com/wp-admin/js/user-profile.min.js?ver=6.4.2" id="user-profile-js"></script>
	<script defer src="https://static.cloudflareinsights.com/beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317" integrity="sha512-euoFGowhlaLqXsPWQ48qSkBSCFs3DPRyiwVu3FjR96cMPx+Fr+gpWRhIafcHwqwCqWS42RZhIudOvEI+Ckf6MA==" data-cf-beacon='{"rayId":"835e133c6f2c17e4","version":"2023.10.0","r":1,"token":"267a25a42df44a61a21bb3d4c68254ed","b":1}' crossorigin="anonymous"></script>
</body>
	</html>
	