class HotStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  has_one_attached :photo

  validates :direction, :user_id, :stock_id, :date, presence: true
end
