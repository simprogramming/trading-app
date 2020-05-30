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

  def close_price
    # scenario 1: trade is successful, sells at 30%, 70%, 100%
    # 2: update positions size
    # 3: calculate gains and update account balance
    # 4: same for short selling

    # scenario 2: trade not successful, trade hits stop_loss
    # 2: position is closed
    # 3: calculate losses
    # 4: update cash balance
    # 5: same for short-selling


    if buy_sell == "Buy"
      close1 = entry * 1.3 # creates theoretical sell price
      close2 = entry * 1.7
      close3 = entry * 2
    else
      r1 = entry - (entry * 0.3)
      r2 = entry - (entry * 0.7)
      r3 = 0
    end


    if buy_sell == "Buy" && current_price >= close1
      if current_price >= close2
        position.r2 = close2
        if current_price >= close3
          position.r3 = close3
        end
      end

      position.r1 = close1 # makes close1 official
      position.size = (2/3) * position.size
      # need to create a table for cash_balance and update it

    elsif buy_sell == "Sell" && current_price <= r1
      position.r1 = close1
      position.size = (2/3) * position.size

    end



      # sell 1/3 of position.size
      # Position.create()


  end


end
