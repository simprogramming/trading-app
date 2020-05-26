class Position < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates :stock, presence: true
end
