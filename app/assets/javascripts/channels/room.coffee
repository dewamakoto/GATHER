App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  speak: (content,user) ->
    @perform 'speak',content: content, user: user

  received: (data) ->
    $('#messages').append data['content']

jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
    # return キーのキーコードが13
    App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')]
    #speak メソッド, event.target.valueを引数に.
    event.target.value = ''
    event.preventDefault()
