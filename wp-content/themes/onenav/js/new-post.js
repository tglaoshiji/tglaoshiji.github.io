/*!
 * Theme Name:One Nav
 * Theme URI:https://www.iotheme.cn/
 * Author:iowen
 * Author URI:https://www.iowen.cn/
 */
function currentType(data) {
    var t = $(data).data('type');
    $('input[name="sites_type"]').val(t);
    if(t=='wechat'){
        $('.tg-wechat-id').show();
        $('.tg-sites-url').hide();
    }else{
        $('.tg-wechat-id').hide();
        $('.tg-sites-url').show();
    }
};
(function($){ 
    $('#get_info').click(function() {
        var url = $('.sites-link').val();
        if( url != '' ){
            if(isURL(url)){
                getUrlData(url);
            }else{
                showAlert({"status":3,"msg":tg_data.local.url_error});
            }
        }else{
            showAlert({"status":3,"msg":tg_data.local.fill_url});
        }
    });
    $('.post-tg #submit').click(function() {
        var t = $(this); 

        if (t.hasClass('is-post')) tinyMCE.triggerSave();
        
        captcha_ajax(t, '', function (result) {
            if(result.status == 1){
                $('.form-control').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                //清理图标
                $(".show-sites").attr("src", theme.addico);
                $(".tougao-sites").val('');
                $(".remove-sites").data('id','').hide();
                $(".upload-sites").val("").parent().removeClass('disabled');
                $('[name="image_captcha"]').val('');
                $('.image-captcha').click();
            }
        });
        return false;
    }); 
    $('.remove-ico').click(function() {
        var doc_id = $(this).data('type');
        $("#show_"+doc_id).attr("src", theme.addico);
        $("#remove_"+doc_id).hide();
        $("#upload_"+doc_id).val("");
    });
})(jQuery);
function uploadImg(file) {
    var doc_id = file.getAttribute("data-type");
    if (file.files != null && file.files[0] != null) {
        if (!/\.(jpg|jpeg|png|JPG|PNG)$/.test(file.files[0].name)) {
            $("#show_"+doc_id).attr("src", theme.addico);    
            $("#upload_"+doc_id).val("");
            $("#remove_"+doc_id).hide();
            showAlert({"status":3,"msg":tg_data.local.only_jpg});   
            return false;    
        } 
        if(file.files[0].size > (tg_data.sites_img_max * 1024)){
            $("#show_"+doc_id).attr("src", theme.addico);
            $("#upload_"+doc_id).val("");
            $("#remove_"+doc_id).hide();
            showAlert({"status":3,"msg":tg_data.local.sites_img_max_msg});
            return false;
        }
        var reader = new FileReader();
        reader.readAsDataURL(file.files[0]);
        reader.onload = function(arg) {
            var image = new Image();
            image.src = arg.target.result;
            image.onload = function() { 
                $("#show_"+doc_id).attr("src", image.src);
                $("#remove_"+doc_id).show();
            };
            image.onerror = function() { 
                $("#show_"+doc_id).attr("src", theme.addico);
                $("#upload_"+doc_id).val("");
                $("#remove_"+doc_id).hide();
                showAlert({"status":3,"msg":tg_data.local.only_img});
                return false;
            }
        }
    }else{
        $("#show_"+doc_id).attr("src", theme.addico);
        $("#upload_"+doc_id).val("");
        $("#remove_"+doc_id).hide();
        showAlert({"status":2,"msg":tg_data.local.select_file});
        return false;
    }
};

function getUrlData(_url){
        $.post("//apiv2.iotheme.cn/webinfo/get.php", { url: _url, key:tg_data.theme_key },function(data,status){ 
            if(data.code==0){ 
                showAlert({"status":3,"msg":tg_data.local.get_failed});
            }
            else{ 
                dataInput(data);
                showAlert({"status":1,"msg":tg_data.local.get_success});
            } 
        }).fail(function () {
            showAlert({"status":3,"msg":tg_data.local.timeout2});
        });
} 
function dataInput(data) {
    var des = $('.sites-des');
    $('.sites-title').val(data.site_title); 
    des.val(data.site_description.slice(0,des.attr('maxlength'))); 
    change_input(des);
    $('.sites-keywords').val(data.site_keywords);
}