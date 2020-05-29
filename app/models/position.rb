class Position < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates :stock, presence: true
  validates :entry, presence: true
  validates :size, presence: true


  def total_amount
    entry * size
  end

  def gain_loss_percentage

    if buy_sell == "Buy"
      x = (current_price - entry)/(entry)
    else
      x = entry/current_price - 1
    end
    return x
  end


end
