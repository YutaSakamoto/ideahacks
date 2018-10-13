class Topic < ApplicationRecord
  has_many :category_topic, dependent: :destroy
  has_many :categories, through: :category_topic

  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :notifications, dependent: :destroy


  mount_uploader :image, ImageUploader

  validates :user_id, presence: true

  def average_rating
  reviews.count == 0 ? 0 : reviews.average(:star).round(2).to_i
  end


end
