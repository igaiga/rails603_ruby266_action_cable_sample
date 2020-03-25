import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server

    // ※connectedの外に書く方法がわからない
    document.
      querySelector('input[data-behavior="room_speaker"]').
      addEventListener('keypress', (event) => {
        if (event.keyCode === 13) { // リターンキー
          this.speak(event.target.value);
          event.target.value = '';
          return event.preventDefault();
        }
    });
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // alert(data['message']);
    const element = document.querySelector('#messages')
    element.insertAdjacentHTML('beforeend', data['message'])
  },

  speak: function(message) {
    // alert("speak!!")
    return this.perform('speak', {message: message});
  },
});
