class Product < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :stock
    validates :image
  end
  has_one_attached :image
  scope :price_high_to_low, -> { order(price: :desc) }
  scope :price_low_to_high, -> { order(price: :asc)  }
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  # def product_image(width, height)
  #   image.variant(resize_to_limit: [width, height]).processed
  # end

  def self.looks(search, word)
    if search == "perfect_match"
      @product = Product.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @product = Product.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      @product = Product.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @product = Product.where("name LIKE?", "%#{word}%")
    else
      @product = Product.all
    end
  end
  
end
