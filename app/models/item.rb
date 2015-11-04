class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :user_id, message: "You already have an item with this title." }
  validates :collection, uniqueness: { scope: :user_id, message: "You already have a collection with this name." }
  validates :description, presence: true

  belongs_to :user

  attachment :item_image, type: :image

  def self.search(search)
    where("name like ? or collection like ?", "%#{search}%", "%#{search}%")
  end
end
