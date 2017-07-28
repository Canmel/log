// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require_tree .

$(document).on('ready page:load',function(){
    $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax]):not([data-method="delete"])', '[data-pjax-container]',{timeout: 50000});
    $(document).on('submit', '.pjax-form', function(event) {
        $.pjax.submit(event, '[data-pjax-container]',{timeout: 50000});
    });


    $(document).on('pjax:start', function () {
        loading();
    })

    $(document).on('pjax:end', function () {
        removeLoading();
    })
});

function init_menus() {
    $(".cl-vnavigation > li").click(function () {
        if($(this).hasClass('active')){
            $(this).slideUpMenu();
        }else{
            $(this).slideDownMenu();
        }
    });
    $(".cl-vnavigation > ul > li").click(function () {
        $(".cl-vnavigation > ul > li").each(function (obj) {
            $(this).removeClass("active");
        });
        $(".cl-vnavigation > li").each(function (obj) {
            $(this).removeClass("active");
        });
        $(this).addClass("active");
        $(this).parent().prev().addClass("active");
    })
}

function load_menu_after_page() {
    $(".cl-vnavigation > ul > li").each(function (obj) {
        if($(this).hasClass("active")){
            $(this).parent().prev().click();
            $(this).parent().prev().addClass("active");
        }
    });
}

function load_menu_after_pjax() {
    $(".cl-vnavigation > ul > li").each(function (obj) {
        $(this).removeClass("active");
    })
}

function loading() {
    $('body').loading({
        loadingWidth:240,
        title:'请稍等!',
        name:'loading',
        discription:'第一次打开或许会花点时间',
        direction:'column',
        type:'origin',
        originBg:'#71EA71',
        originDivWidth:40,
        originDivHeight:40,
        originWidth:6,
        originHeight:6,
        smallLoading:false,
        loadingMaskBg:'rgba(0,0,0,0.2)'
    });
}