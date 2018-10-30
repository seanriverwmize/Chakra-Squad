class Comment < ApplicationRecord
  belongs_to :product
  belongs_to :user
  scope :rating_desc, -> {order(rating: :desc)}
  validates :user, presence: true
  validates :product, presence: true
  validates :body, presence: true
  validates :rating, numericality: { only_integer: true}
  after_create_commit { CommentUpdateJob.perform_later(self, self.user)}
end
