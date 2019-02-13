$(function() {
    $("#contact-form").submit(function(ev) {
        ev.preventDefault();
        var fields = {},
            cont = true;
        $("input, textarea", this).each(function() {
            if ($(this).attr('data-required') === 'true' && $(this).val() === '') {
                cont = false;
                $(this).css({'background-color': '#cc0202', 'color': '#ffffff'});
            } else {
                fields[$(this).prop('name')] = $(this).val();
                $(this).css({'background-color': '#ffffff', 'color': '#000000'});
            }
        });
        $(this).find('.success, .error').empty().remove();
        if (cont) {
            var loader = $('<div class="loader" />');
            loader.height($(this).height());
            $(this).append(loader.fadeIn());
            var $form = $(this);
            $.ajax({
                'url': $(this).prop('action'),
                'type': $(this).prop('method'),
                'dataType': 'json',
                'data': fields,
                'success': function(i) {
                    loader.empty().remove();
                    if (i.success) {
                        $form[0].reset();
                        $form.prepend('<p class="success">Your message was successfully sent.</p>');
                    } else {
                        var msg = "";
                        for (var x in i.message) {
                            msg += i.message[x]+'<br />';
                        }
                        $form.prepend('<p class="error">'+msg+'</p>');
                    }
                },
                'error': function() {
                    loader.empty().remove();
                    $form.prepend('<p class="error">Unfortunately an error occurred. Please try again.</p>');
                }
            });
        }
    });
});