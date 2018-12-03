function send(btn,url, contenu, container, callback){
    btn.click(function(){
        $.post(url,
        {
            contenu: contenu.val()
        },
        function(data){
            container.append(data);
            contenu.val('');
            callback();
        });
    });
}

function execute(url, callback, dataType){
    $.get(url, function(data){
        callback(data);
    }, dataType);
}
function lire(input) {
    input.on('focus', function(){
       $('.bg-success').removeClass('bg-success');
    })
}