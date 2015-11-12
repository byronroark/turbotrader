class Item < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { message: "You already have an item with this title." }
  validates :description, presence: true

  has_one :user, through: :collection
  belongs_to :collection
  has_many :prices

  attachment :item_image, type: :image

  def self.search(search)
    where("title like ?", "%#{search}%")
  end

  def chart_json
    prices.map { |price| [price.item_sold_at.to_i * 1000, price.price]}.to_json
  end

  def price_increase?
    # Handle if there are no prices => return false

    # Handle if there is only ONE price => return false

    # OR

    # There are at least two prices, so Return true if the last price (in 'prices') is more than the next to last price (in 'prices')
    return true
  end

  def price_decrease?

  end

  def last_price
    if prices.any?
      "$#{prices.last.price}"
    else
      "-"
    end
  end
end
