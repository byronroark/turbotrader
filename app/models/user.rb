class User < ActiveRecord::Base
  has_many :items
  has_many :collections

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    user = where(provider: auth['provider'], uid: auth['uid']).first_or_create

    user.first_name   = auth.info.first_name
    user.last_name    = auth.info.last_name
    user.email        = auth.info.email
    user.password     = Devise.friendly_token[0,20]
    user.save!

    return user
  end
end
