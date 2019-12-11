$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <strong>
                    <a href = /users/${comment.user_id}>${comment.user_name}</a>:
                    </strong>
                    ${comment.body}
                    </p>`
    return html;
  }

// ↓送信ボタンクリック時にイベント発火
$("#new_comment").on("submit",function(e){
//↓e.preventDefaultで送信ボタンクリック時の通信を止める
    e.preventDefault();
    console.log(this)
//　↓formDataでフォームの情報を取得
    var formData = new
FormData(this);
// ↓非同期通信でコメントが保存されるようにする
    var url = $(this).attr("action")
    $.ajax({
      url:url,
      type:"POST",
      data:formData,
      dataType:"json",
      processData:false,
      contentType:false
    })
//↓ 非同期通信成功時に上で定義した関数を実行
    .done (function(data){
      var html = buildHTML(data);
      $(".comments").append(html)
      $(".textbox").val("")
    })
//↓エラー時の処理
    .fail(function(){
      alert("error");
    })
  })
})