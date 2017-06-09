class Post < ApplicationRecord
  belongs_to :user
  has_many :comments


  validates :user_id, presence: true
  validates :tittle, presence: true
  validates :content, presence: true, length: {minimum: 250}
  default_scope -> { order(created_at: :desc) }



end
