class Collection < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :user_id, message: "You already own a collection by this name." }

  has_many :items
  belongs_to :user
end
