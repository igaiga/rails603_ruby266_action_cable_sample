require 'test_helper'

class RoomChannelTest < ActionCable::Channel::TestCase
  test 'subscribes' do
    subscribe # 購読作成をシミュレート
    # p "*****subscription.class"
    # p method(:subscription).source_location
    # p subscription.class
    assert subscription.confirmed? # subscriptionでRoomChannelオブジェクトを取得できる
    assert_has_stream 'room_channelfoo' # RoomChannel#subscribedメソッドの stream_from で指定した識別文字列(pubsub queue名)
  end
end
