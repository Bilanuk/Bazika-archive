document.addEventListener("turbolinks:load", function(){
    window.addEventListener('scroll', function() {
        if (window.scrollY > 70) {
          $('#navbar').addClass('green', 2000);
          navbar_height = document.querySelector('#navbar').offsetHeight;
          document.body.style.paddingTop = navbar_height + 'px';
        } else {

            $('#navbar').removeClass('green', 1000);
            document.body.style.paddingTop = '0';
        } 
    });
}); 

// window.addEventListener('scroll', function() {
//     if (window.scrollY > 100) {
//       $('#navbar').addClass('fixed-top', 1000);
//       navbar_height = document.querySelector('#navbar').offsetHeight;
//       document.body.style.paddingTop = navbar_height + 'px';
//     } else {
//         $('#navbar').removeClass('fixed-top', 1000);
//         document.body.style.paddingTop = '0';
//     } 
// });
// if (typeof jQuery.ui !== 'undefined') {
//     console.log($.ui.version);
// }
