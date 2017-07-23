jQuery.fn.extend({
    slideUpMenu:function(){
        $(this).next().slideUp();
        // $(".cl-vnavigation > li").removeClass("active")
    },
    slideDownMenu:function () {
        $(this).next().slideDown();
        // $(this).addClass("active")
    }
});