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

  def exit_short

  end

  def exit_long

  end

  def update_cash_equity

  end

  def gain_loss_closed
    size1 = size * 0.3
    size2 = (size - size1) * 0.5
    size3 = size - size1 - size2
    remaining_shares = size

    if current_price <= baseline
      exit_long
      # position.exit (stop-loss) / opposite for short-sell
    end
    if current_price >= baseline
      exit_short
    end

    take_profit_long_R1(size1)
    take_profit_long_R2(size1, size2)
    take_profit_long_R3(size1, size2, size3)

    return
  end

  def take_profit_long_R1(size1)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r1 && remaining_shares == size
      sell_1 = (size1 * (r1 - entry))
      cash += sell_1
      equity -= sell_1
      remaining_shares -= size1
    end

  end

  def take_profit_long_R2(size1, size2)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r2 && remaining_shares == (size - size1)
      sell_2 = (size2 * (r2 - entry))
      cash += sell_2
      equity -= sell_2
      remaining_shares -= size2
    end
  end

  def take_profit_long_R3(size1, size2, size3)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r3 && remaining_shares == (size - size1 - size2)
      sell_3 = (size3 * (r3 - entry))
      cash += sell_3
      equity -= sell_3
      remaining_shares -= size3
      # change color for R3 to green
    end
    # position size reduces by 1/3
    # profit = size * 1/3 *
    # cash up by that amount
    # equity down by that amount
  end

  def profit_loss_position
    if current_price == close_price_r1
      profit = (size * 0.3 * r1) + (shares * current_price)
    else
    profit = (current_price - entry) * size
    end
  end

  def profit_loss_percentage
    # if
  end

  def close_pricesss
    # scenario 1: trade is successful, sells at 30%, 70%, 100%
    # 2: update positions size
    # 3: calculate gains and update account balance
    # 4: same for short selling

    # scenario 2: trade not successful, trade hits stop_loss
    # 2: position is closed
    # 3: calculate losses
    # 4: update cash balance, uodate remaining shares balance
    # 5: same for short-selling

 # this creates the 3 closing prices for a long or short trade
    if buy_sell == "Buy"
      close1 = baseline + ((target - baseline) * 0.3) # creates theoretical sell price
      close2 = baseline + ((target - baseline) * 0.7)
      close3 = target
    else
      close1 = baseline - ((baseline - target) * 0.3)
      close2 = baseline - ((baseline - target) * 0.7)
      close3 = target
    end

    balance = total_amount

    if buy_sell == "Buy" && current_price >= close1
      position.r1 = close1 # makes close1 official

      sold_size = 1/3 * position.size # amount of shares sold
      position.size -= sold_size # remaining position size after close 1
      # need to create a table for cash_balance and update it
      gains = sold_size * (close1 - entry)
      user.wallet = user.wallet + gains



      if current_price >= close2
        position.r2 = close2
        if current_price >= close3
          position.r3 = close3
        end
      end


    elsif buy_sell == "Sell" && current_price <= r1
      position.r1 = close1
      position.size = (2/3) * position.size

    end

      # sell 1/3 of position.size
      # Position.create()
  end

  # def close_1(close1)
  #   position.r1 = close1
  # end


end
