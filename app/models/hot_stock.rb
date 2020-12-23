class HotStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :direction, presence: true
end
