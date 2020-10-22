$(window).on("load", function() {
  console.log("test");
  if(!document.URL.match("new")) {
    var preview = $(
      `<div class="image-preview__wapper">
        <img class="preview">
        <div class="preview__btn">
          <div class="preview__btn__delete">
            削除
          </div>
        </div>
      </div>`
    );

    var append_input = $(
      `<li class="input">
        <label class="upload-label">
          <div class="upload-label__text">
            <i class="fas fa-camera fa-2x"></i>
            <div class="input-area">
              <input class="hidden image_upload" type="file">
            </div>
          </div>
        </label>
      </li>`
    );

    $ul = $("#previews");
    $lis = $ul.find(".image-preview");
    $inputs = $ul.find(".image_upload");

    $("#previews li").css({
      width: '124px',
    });
    if ($lis.length <= 4) {
      $ul.append(append_input);
      $("#previews li:last-child").css({
        width: `calc(100% - (20% * ${$lis.length}))`,
      });
    } else if ($lis.length == 5) {
      $ul.append(append_input);
      $("#previews li:last-child").css({
        width: `100%`,
      });
    } else if ($lis.length <= 9) {
      $ul.append(append_input);
      $("#previews li:last-child").css({
        width: `calc(100% - (20% * (${$lis.length} - 5 )))`,
      });
    }
    
    $inputs.each(function (num, input) {
      $(input).removeAttr("name");
      $(input).attr({
        name: "item[images_attributes][" + num + "][id]",
        id: "item_images_attributes_" + num + "_id",
      });
    });
  };
});
