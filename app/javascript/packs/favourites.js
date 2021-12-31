document.addEventListener("turbolinks:before-cache", function() {
    if(document.getElementById('alert')) {
      document.getElementById('alert').remove();
    }
});

document.addEventListener("turbolinks:load", function () {
    if(window.location.href.indexOf('/show/') > -1) {
        el = document.getElementById("fav_ico");
        changeIconColor(el, gon.is_favourite);
    }
});

document.addEventListener('ajax:complete', function () {
    if(window.location.href.indexOf('/show/') > -1) {
        el = document.getElementById("fav_ico");
        changeIconColor(el, gon.is_favourite);
    }
});

function changeIconColor(el, val) {
    if (val == true) {
        el.style.backgroundColor = 'rgba(51, 170, 51, .8)';
        gon.is_favourite = false;
    }
    else {
        el.style.backgroundColor = null;
        gon.is_favourite = true;
    }
}