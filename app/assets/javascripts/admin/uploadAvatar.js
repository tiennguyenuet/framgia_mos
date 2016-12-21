$(document).on('turbolinks:load', function() {
    $('.avatar-admin').change(function(e) {
        $('.current-ava').remove();
        var file = e.originalEvent.srcElement.files[0];
        var img = document.getElementById('new-ava');
        var reader = new FileReader();
        reader.onloadend = function() {
            img.src = reader.result;
            img.width = 200;
            img.height = 200;
        }
        reader.readAsDataURL(file);
    });
});
