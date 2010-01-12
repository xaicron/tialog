(function(u) {
    if (!u.match('http://[^/]+/?$')) {
        $('#Content').prepend('<a href="' + u.replace(/\/[^\/]+\/?$/, '') +'">&lt;back</a>');
    }
})(location.href);
