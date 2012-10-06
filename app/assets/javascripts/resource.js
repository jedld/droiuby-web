var droiuby = {
    editor:null
};

$('select#resource_resource_type').live('change', function (e) {
    var select = $(this);
    var button = $('.save-app-button');
    var main_layout_select = $('span.layout-only');
    $('form div.image-upload').addClass('hidden');
    main_layout_select.removeClass('hidden');
    if (select.val() === '2') {
        $('form div.resource-editor').removeClass('hidden');
        droiuby.editor.getSession().setMode("ace/mode/ruby");
    } else
    if (select.val() === '0') {
        $('form div.resource-editor').removeClass('hidden');
        droiuby.editor.getSession().setMode("ace/mode/xml");
    } else
    if (select.val()=== '1') {
        $('form div.image-upload').removeClass('hidden');
        $('form div.resource-editor').addClass('hidden');
        main_layout_select.addClass('hidden');
        button.removeAttr('disabled');
    }
});


$('form.form-resource-update').live('ajax:beforeSend', function () {
    var button = $('.save-app-button');
    button.attr('disabled','disabled');
});

$('form.form-resource-update').live('ajax:failure', function() {
    var button = $('.save-app-button');
    button.removeAttr('disabled');
});

$('form.form-resource-update').live('ajax:success', function(event, data, status, xhr) {
    var button = $('.save-app-button');
    button.removeClass('btn-warning');
    button.attr('disabled','disabled');
});

$(document).ready(function() {
    $('.fileupload').fileupload({'uploadtype' : 'image', name: 'resource[image_resource]'});
    $('#destroy-resource').on('click', function() {
        $.ajax(
            {url: $(this).data('url')}
            ).done(function() {
            $('#delete-confirm').modal('hide')
        })
    })
});



