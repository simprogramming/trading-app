class HotStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :direction, presence: true
  validates :user_id, presence: true
  validates :stock_id, presence: true
  validates :date, presence: true
end
