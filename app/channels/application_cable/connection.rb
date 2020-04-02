module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # action_cable/connection/identification.rb#identified_by
    # 引数で渡されたシンボルをattr_accessorする
    identified_by :current_user

    def connect
      # p "*********connect!!!"
      # p "********** #{self.method(:current_user).source_location}"
      # identified_byで定義されたattr_accessordの代入メソッド
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # p "******find_verified_user"
      # 別の場所で cookies.signed[:user_id]が入っている前提
      if verified_user = User.find_by(id: cookies.signed[:user_id])
        verified_user
      else
        # p "reject!!!!!!!!!!!!"
        # ActionCableの接続を切るメソッド
        reject_unauthorized_connection
      end
    end
  end
end
