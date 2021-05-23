$(document).on('ready', function() {
  handle_preview($('#inputHeaderImage'), $('#previewImage'));
});

function readURL(input, image) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      image.attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

function handle_preview(input_tag, image){
  input_tag.change(function(e){
    var file = e.target.files[0];
    readURL(e.target, image);
  });
}
