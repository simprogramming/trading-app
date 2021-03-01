class Ema < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :user_id, presence: true
  validates :stock_id, presence: true
  validates :date, presence: true
  validates :direction, presence: true
end
