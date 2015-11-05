class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { message: "You already have an item with this title." }
  validates :description, presence: true

  has_one :user, through: :collection
  belongs_to :collection

  attachment :item_image, type: :image

  def self.search(search)
    where("name like ? or collection like ?", "%#{search}%", "%#{search}%")
  end
end
