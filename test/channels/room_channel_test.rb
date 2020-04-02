require 'test_helper'

class RoomChannelTest < ActionCable::Channel::TestCase
  test 'subscribes' do
    subscribe # 購読作成をシミュレート
    assert subscription.confirmed? # subscriptionでChannelオブジェクトを取得できる
    assert_has_stream 'room_channel' # RoomChannel#subscribedメソッドの stream_from で指定した識別文字列(pubsub queue名)
  end
end
