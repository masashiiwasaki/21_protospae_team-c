$(function(){
  function buildHTML(comment){
    var id = comment.id;
    var avatar = comment.avatar.url;

    // var html = `<div class="media">
    //               <div class="media-left">
    //               <a href='/users/`
    //               + id
    //               + `><img src="`
    //               + avatar
    //               + `"></a>
    //               </div>
    //               <div class="media-body">
    //                 <h4 class="media-heading" id="top-aligned-media">
    //                 ${comment.user_name}
    //                 </h4>
    //                 <p>
    //                 ${comment.text}
    //                 </p>
    //               </div>
    //             </div>`
    var html = `<div class="media">
                  <div class="media-left">
                    <a href="/users/${id}">
                      <img src="${avatar}">
                    </a>
                  </div>
                  <div class="media-body">
                    <h4 class="media-heading" id="top-aligned-media">
                    ${comment.user_name}
                    </h4>
                    <p>
                    ${comment.text}
                    </p>
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log(data);
      var html = buildHTML(data);
      $('#comments').append(html);
      $('#comment_field').val('')
    })
  })
})
