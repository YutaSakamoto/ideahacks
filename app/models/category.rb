class Category < ApplicationRecord
  has_many :category_topic
  has_many :topics, through: :category_topic
end
