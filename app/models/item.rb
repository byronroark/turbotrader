class Item < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :category, presence: true
  validates :description, presence: true

  belongs_to :user

  attachment :item_image, type: :image

  def self.search(search)
    where("name like ? or category like ?", "%#{search}%", "%#{search}%")
  end
end
