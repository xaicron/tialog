(function() {
    $.each($('#Content>ul li'), function(i, v) {
        var c = i % 2 ? 'b' : 'a';
        $(v).addClass(c);
        v.innerHTML = v.innerHTML.replace(/^(\d{2}:\d{2}:\d{2})\s+\[([^\]]+)]/, '<span class="time">$1</span> [<span class="user">$2</span>]');
        $.each(__KEYWORD, function(index, user_name) {
            var reg = new RegExp('((?:\G|>)[^<]*?)' + user_name, 'g');
            v.innerHTML = v.innerHTML.replace(reg, '$1<span class="me">' + user_name + '</span>');
        });
    });
})();

