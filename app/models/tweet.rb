class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :delete_all

  validates_length_of :body, maximum: 240
  validates :body, presence: true
end
