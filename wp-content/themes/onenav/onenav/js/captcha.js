/*
 * @Author: iowen
 * @Author URI: https://www.iowen.cn/
 * @Date: 2022-02-10 22:22:47
 * @LastEditors: iowen
 * @LastEditTime: 2023-04-21 09:59:44
 * @FilePath: \onenav\js\captcha.js
 * @Description: 验证
 */

function CaptchaInit() {
    var _mode = $('[captcha-type]');
    if (_mode.length) {
        var mode = _mode.attr('captcha-type');
        var _body = $('body');
        window.captcha = {}
        switch (mode) {
            case 'image':
                var _code = $('.image-captcha');
                _code.each(function () {
                    get_img($(this));
                });
                $('.image-captcha').click(function () {
                    get_img($(this));
                });
                function get_img(_this) {
                    $.ajax({
                        url: theme.ajaxurl,
                        data: {
                            action: 'get_img_captcha',
                            id: _this.data('id'),
                        },
                    }).done(function (data) {
                        _this.html('<img alt="img code" src="' + data.img + '" class="">');
                    });
                }
                break;
            case 'slider':
                //if (!$("#slider_captcha").length) {
                //    $.getScript(theme.uri + "/js/longbow.slidercaptcha.min.js");
                //}
                break;
            case 'tcaptcha':
                var $btn = $("#TencentCaptcha.io-tcaptcha");
                var appid = _mode.data('appid');
                if (!$btn.length) {
                    _body.append('<div class="hide io-tcaptcha" id="TencentCaptcha" data-appid="' + appid + '" data-cbfn="TCaptchaOK"></div>')
                    $.getScript("//ssl.captcha.qq.com/TCaptcha.js");
                }
                break;
            case 'geetest':
                GeetestOpen(false);
                break;
            case 'vaptcha':
                VaptchaOpen(false);
                break;
        }
    }
}
CaptchaInit();

function CaptchaOpen(_this, mode) {
    switch (mode) {
        case 'slider':
            SliderCaptchaOpen(_this);
            break;
        case 'tcaptcha':
            TCaptchaOpen(_this);
            break;
        case 'geetest':
            window.captcha._this = _this;
            GeetestOpen(true);
            break;
        case 'vaptcha':
            window.captcha._this = _this;
            VaptchaOpen(true);
            break;
    }
    return !1;
}

//腾讯验证码
function TCaptchaOpen(_this) {
    console.log(25);
    window.captcha._this = _this;
    $("#TencentCaptcha.io-tcaptcha").trigger('click');	  	
}
function TCaptchaOK(res) {
    window.captcha.ticket = 0;
    window.captcha.randstr = 0;
    if (res.ret === 0) {
        window.captcha.ticket  = res.ticket;
        window.captcha.randstr = res.randstr;
        window.captcha._this.click();
    }
}
//极验行为验4.0
function GeetestOpen(open) {
    var _mode = $('[captcha-type]');
    if (window.GeetestCaptcha) {
        open && window.GeetestCaptcha.showCaptcha();
        return;
    }
    if (!_mode.length) {
        return;
    }
    initGeetest4({
        captchaId: _mode.data('appid'),
        product: 'bind',
    }, function (captchaObj) {
        captchaObj.onReady(function () {
            window.GeetestCaptcha = captchaObj;
            open && captchaObj.showCaptcha();
        }).onSuccess(function (e) {
            var getValidate = captchaObj.getValidate();
            window.captcha.captcha_output = getValidate.captcha_output;
            window.captcha.gen_time = getValidate.gen_time;
            window.captcha.lot_number = getValidate.lot_number;
            window.captcha.ticket = getValidate.pass_token;
            window.captcha._this.click();
        })
    });
}
//Vaptcha
function VaptchaOpen(open) {
    var _mode = $('[captcha-type]');
    if (window.VaptchaObj) {
        open && window.VaptchaObj.validate();
        return;
    }
    if (!_mode.length) {
        return;
    }
    vaptcha({
        vid: _mode.data('appid'),
        mode: 'invisible',
        scene: 0,
        area: 'auto',
    }).then(function (VAPTCHAObj) {
        window.VaptchaObj = VAPTCHAObj;
        VAPTCHAObj.listen('pass', function () {
            serverToken = VAPTCHAObj.getServerToken();
            window.captcha.ticket  = serverToken.token;
            window.captcha.server = serverToken.server;
            window.VaptchaObj.reset();
            window.captcha._this.click();
        })
    })
}
