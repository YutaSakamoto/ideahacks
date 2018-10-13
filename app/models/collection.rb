class Collection < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :declears

  validates :description, presence: true
end
