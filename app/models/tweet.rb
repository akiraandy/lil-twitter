class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :body, length: { maximum: 280 }
  validates :body, presence: true
end
