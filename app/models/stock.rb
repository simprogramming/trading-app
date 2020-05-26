class Stock < ApplicationRecord
  has_many :positions

  validates :symbol, presence: true
end
