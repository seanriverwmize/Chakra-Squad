class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  scope :rating_desc, -> {order(rating: :desc)}
end
