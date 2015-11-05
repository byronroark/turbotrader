class User < ActiveRecord::Base
  has_many :items, through: :collections
  has_many :collections

  after_create :add_default_collection

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

  def add_default_collection
    self.collections.create!(name: 'Default')
  end
end
