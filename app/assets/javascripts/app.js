var draw_qrcode = function(text, typeNumber, errorCorrectLevel) {
    document.write(create_qrcode(text, typeNumber, errorCorrectLevel) );
};

var create_qrcode = function(text, typeNumber, errorCorrectLevel, table) {

    var qr = qrcode(typeNumber || 4, errorCorrectLevel || 'M');
    qr.addData(text);
    qr.make();

//	return qr.createTableTag();
    return qr.createImgTag(4);
};

var update_qrcode = function() {
    var text = document.forms[0].elements['msg'].value.
        replace(/^[\s\u3000]+|[\s\u3000]+$/g, '');
    document.getElementById('qr').innerHTML = create_qrcode(text);
};


$(document).ready(function() {
    var qrcode_element = $('.qrcode');
    if (qrcode_element.length!=0) {
        qrcode_element.html(create_qrcode(qrcode_element.data('url')));
    }
});

$('form.form-app-asset-update').live('ajax:beforeSend', function () {

});

$('form.form-app-asset-update').live('ajax:failure', function () {

});

$('form.form-app-asset-update').live('ajax:success', function (event, data, status, xhr) {
    $('#asset_list_section').html(data['partial'])
});