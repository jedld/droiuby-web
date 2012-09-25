var droiuby = {
  editor: null
};

$('select#resource_resource_type').live('change', function(e) {
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


