class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  def highest_rating_comment
    comments.rating_desc.first
  end
  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end

    #finds the average of all comment ratings for the product show pages
    def average_rating
      comments.average(:rating).to_f
    end
  end
end
