$(document).on('turbolinks:load', ()=> {
  $(function() {
    var file_field = document.querySelector('input[type=file]')
    $('#img-file').change(function() {
      var file = $('input[type="file"]').prop('files')[0];
      var fileReader = new FileReader();
      fileReader.onloadend = function() {
        var src = fileReader.result
        var html= `<img src="${src}" width="114" height="80">`
        $('#image-box__container').before(html);
      }
      fileReader.readAsDataURL(file);
    });
  });

  var html= `<div class='item-image' data-image="${file.name}">
              <div class=' item-image__content'>
                <div class='item-image__content--icon'>
                  <img src=${src} width="114" height="80" >
                </div>
              </div>
              <div class='item-image__operetion'>
                <div class='item-image__operetion--delete'>削除</div>
              </div>
            </div>`

  $(document).on("click", '.item-image__operetion--delete', function(){
    var target_image = $(this).parent().parent()
    target_image.remove();
    file_field.val("")
  })
  
  // 画像用のinputを生成する関数
  // const buildFileField = (index)=> {
  //   const html = `<div data-index="${index}" class="js-file_group">
  //                   <input class="js-file" type="file"
  //                   name="item[images_attributes][${index}][src]"
  //                   id="item_images_attributes_${index}_src"><br>
  //                   <div class="js-remove">削除</div>
  //                 </div>`;
  //   return html;
  // }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
