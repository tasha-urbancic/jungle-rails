class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def self.averageRating(product)
    number_of_reviews = product.reviews.count
    if number_of_reviews == 0
      'Not Yet Rated'
    else
      tot = 0
      product.reviews.each do |review|
        p review.rating.to_i
        tot = tot + review.rating.to_i
      end
      tot/number_of_reviews
    end
  end

end
