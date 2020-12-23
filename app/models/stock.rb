class Stock < ApplicationRecord
  has_many :positions
  has_many :hot_stocks

  validates :symbol, presence: true
end
