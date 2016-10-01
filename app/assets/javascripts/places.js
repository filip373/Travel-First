document.addEventListener("turbolinks:load", function() {
  if ($(".btn-add-slide").length == 0) return;
  wireRemoveButton($('.remove-slide'));
  $(".btn-add-slide").click(function() {
    next_slide_no = $('.slide-box').length;
    $(".btn-add-slide").before('\
        <div class="centered-form rounded-box text-border slide-box">\
        <div class="border-text">\
        <button name="button" type="button" class="remove-slide">×</button>\
        <h3>Slide ' + (next_slide_no + 1) + '</h3>\
        </div>\
        <div class="form-group string required place_slides_title field"><label class="control-label string required" for="place_slides_attributes_' + next_slide_no + '_title">Title</label><input class="form-control string required" name="place[slides_attributes][' + next_slide_no + '][title]" id="place_slides_attributes_' + next_slide_no + '_title" type="text"></div>\
        <div class="form-group file required place_slides_photo field"><label class="control-label file required" for="place_slides_attributes_' + next_slide_no + '_photo">Photo</label><input class="file required" name="place[slides_attributes][' + next_slide_no + '][photo]" id="place_slides_attributes_' + next_slide_no + '_photo" type="file"></div>\
        <div class="form-group text required place_slides_description field"><label class="control-label text required" for="place_slides_attributes_' + next_slide_no + '_description">Description</label><textarea class="form-control text required" name="place[slides_attributes][' + next_slide_no + '][description]" id="place_slides_attributes_' + next_slide_no + '_description"></textarea><p class="help-block">(100 to 650 characters)</p></div>\
        </div>\
        ');
    wireRemoveButton($(".remove-slide:last-of-type"));
  });
});

var wireRemoveButton = function(button) {
  $(button).click(function(eventData, handler) {
    $(eventData.currentTarget.parentElement.parentElement).remove();
  });
}
