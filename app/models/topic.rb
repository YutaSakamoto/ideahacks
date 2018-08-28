class Topic < ApplicationRecord
  has_many :category_topic
  has_many :categories, through: :category_topic



  belongs_to :user
  has_many :reviews, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :user_id, presence: true

  def average_rating
  reviews.count == 0 ? 0 : reviews.average(:star).round(2).to_i
  end
end
