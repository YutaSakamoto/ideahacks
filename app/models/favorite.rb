class Favorite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :topic
  has_many :notifications, dependent: :destroy
end
