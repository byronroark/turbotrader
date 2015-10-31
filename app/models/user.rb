class User < ActiveRecord::Base
  has_many :items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.from_omniauth(auth)
    user = where(provider: auth['provider'], uid: auth['uid']).first_or_create

    # user.name         = auth.info.name
    user.email        = auth.info.email
    user.password     = Devise.friendly_token[0,20]
    user.save!

    return user
  end
end
