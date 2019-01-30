class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates_numericality_of :price, :greater_than => 0
  has_many :orders
  has_many :comments

  def self.search(search_term)
    if Rails.env.development?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end

  end
  #finds the average of all comment ratings for the product show pages
  def average_rating
    comments.average(:rating).to_f
  end
  def highest_rating_comment
    comments.rating_desc.first
  end
end
