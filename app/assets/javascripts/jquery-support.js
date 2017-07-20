jQuery.fn.extend({
    slideUpMenu:function(){
        $(this).find("ul:first").slideUp();
        $(".cl-vnavigation > li").removeClass("active")
    },
    slideDownMenu:function () {
        $(this).find("ul:first").slideDown();
        $(this).addClass("active")
    }
});