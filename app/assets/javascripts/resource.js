var droiuby = {
    editor:null
};

$('select#resource_resource_type').live('change', function (e) {
    var select = $(this);
    if (select.val() === '2') {
        droiuby.editor.getSession().setMode("ace/mode/ruby");
        console.log("setting mode to ruby");
    } else
    if (select.val() === '0') {
        droiuby.editor.getSession().setMode("ace/mode/xml");
        console.log("setting mode to xml");
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

$(function() {
    $('.fileupload').fileupload();
});

