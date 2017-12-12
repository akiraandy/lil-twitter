class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates_length_of :body, maximum: 240
  validates :body, presence: true
end
