$(document).one('turbolinks:load', function() {
    var lastScrollTop;
    var navbar = $('#navbar');
    var timer = null;

    $(window).on('scroll',function(){    
        var scrollTop = $(window).scrollTop();

        if(scrollTop > lastScrollTop && scrollTop > 70){
            navbar.css("top", "-170px");
        } else{
            navbar.css("top", "0");
        }

        lastScrollTop = scrollTop; 

        if(timer !== null) {
            clearTimeout(timer);        
        }
        timer = setTimeout(function() {
              if (scrollTop < 100) {
                window.scrollTo({ top: 0, behavior: 'smooth' });
              }
        }, 1100);
    });
});

// $(document).one('turbolinks:load', function() {
//     var prev = 0;
//     var $window = $(window);
//     var nav = $('#navbar');
//     var navbar_height = 70;

//     $window.on('scroll', function(){
//         var scrollTop = $window.scrollTop();

//         if (window.scrollY > 85) {
//             nav.removeClass('hide_nav');
//             nav.addClass('fixed-top');
//             nav.addClass('show_nav', scrollTop < prev);
//             document.body.style.paddingTop = navbar_height+ 'px';
//         } else if (window.scrollY < 75) {
//             nav.addClass('hide_nav', scrollTop > prev);
//             setTimeout(function(){
//                 nav.removeClass('fixed-top');
//                 nav.removeClass('show_nav');
//                 document.body.style.paddingTop = '0';
//             },200); 

//         }
//         prev = scrollTop;
//     });
// }); 
