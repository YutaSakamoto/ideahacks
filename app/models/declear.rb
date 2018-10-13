class Declear < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :collection

  validates :comment, presence: true
end
