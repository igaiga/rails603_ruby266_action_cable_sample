require "test_helper"

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connection accepts" do
    user = User.first
    cookies.signed[:user_id] = user.id
    connect
    # p "yay!!!"
    # p "********#{ connection.class }"
    assert_equal connection.current_user.id, user.id
  end

  test "connection rejects" do
    cookies.signed[:user_id] = nil
    assert_raises(ActionCable::Connection::Authorization::UnauthorizedError) do
      connect
    end
  end
end
