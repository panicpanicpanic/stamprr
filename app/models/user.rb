class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.user_name = auth['extra']['raw_info']['email']
    end
  end

end
