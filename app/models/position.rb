class Position < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates :stock, presence: true
  validates :entry, presence: true
  validates :size, presence: true
  validates :baseline, presence: true
  validates :target, presence: true
  validates :stop_loss, presence: true

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

  def exit_short # test this
    self.user.cash += remaining_size * stop_loss
    self.user.equity -= remaining_size * entry
    self.user.save
    self.remaining_size = 0
    self.stop_loss_hit = true
    self.save
  end

  def exit_long
    self.user.cash += remaining_size * stop_loss
    self.user.equity -= remaining_size * entry
    self.user.save
    self.remaining_size = 0
    self.stop_loss_hit = true
    self.save
  end

  def gain_loss_closed
    size1 = size * 0.3
    size2 = (size - size1) * 0.5
    size3 = size - size1 - size2

    if buy_sell == "Buy"

      if current_price <= stop_loss
        exit_long
      else
        take_profit_long_R1(size1)
        take_profit_long_R2(size1, size2)
        take_profit_long_R3(size1, size2, size3)
      end
      # position.exit (stop-loss) / opposite for short-sell
    else
      if buy_sell == "Sell"
        if current_price >= stop_loss
          exit_short
        else
          take_profit_short_R1(size1)
          take_profit_short_R2(size1, size2)
          take_profit_short_R3(size1, size2, size3)
        end
      end
    end
  end

  def p_l_closed
    size1 = size * 0.3
    size2 = (size - size1) * 0.5
    size3 = size - size1 - size2

    if buy_sell == "Buy" && remaining_size == 0
      if stop_loss_hit == true # put in DB
        if r1_hit && r2_hit
          return size1 * r1 + size2 * r2 + size3 * stop_loss - total_amount
        elsif r1_hit
          return size1 * r1 + (size2 + size3) * stop_loss - total_amount
        else
          return size * stop_loss - total_amount
        end
      else
        return size1 * r1 + size2 * r2 + size3 * r3 - total_amount
      end
    end

    if buy_sell == "Sell" && remaining_size == 0
      if stop_loss_hit == true # put in DB
        if r1_hit && r2_hit
          return total_amount - (size1 * r1 + size2 * r2 + size3 * stop_loss)
        elsif r1_hit
          return total_amount - (size1 * r1 + (size2 + size3) * stop_loss)
        else
          return size * stop_loss - total_amount
        end
      else
        return total_amount - (size1 * r1 + size2 * r2 + size3 * r3)
      end
    end
      return "N/A"
  end

  def portfolio_return
    if p_l_closed != "N/A"
      return ((p_l_closed / 100000) * 100).truncate(2)
    else
      return "ActivePosition"
    end

  end

  def take_profit_long_R1(size1)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r1 && r1_hit == false
      # sell_1 = (size1 * (r1 - entry))
      self.user.cash += size1 * r1 # size 1 * entry + (r1-entry) *size1
      self.user.equity -= size1 * entry # does not work
      self.user.save
      self.r1_hit = true
      self.remaining_size -= size1
      self.save
    end

  end

  def take_profit_long_R2(size1, size2)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r2 && r2_hit == false
      # sell_2 = (size2 * (r2 - entry))
      self.user.cash += size2 * r2
      self.user.equity -= size2 * entry
      self.user.save
      self.r2_hit = true
      self.remaining_size -= size2
      self.save
    end
  end

  def take_profit_long_R3(size1, size2, size3)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r3 && r3_hit == false
      # sell_3 = (size3 * (r3 - entry))
      self.user.cash += size3 * r3
      self.user.equity -= size3 * entry
      self.user.save
      self.r3_hit = true
      self.remaining_size -= size3
      self.save
      # change color for R3 to green
    end
  end
# change this too
  def take_profit_short_R1(size1)
    if current_price <= r1 && r1_hit == false
      sell_1 = (size1 * (entry - r1))
      self.user.cash -= size1 * r1
      self.user.equity += size1 * entry
      self.user.save
      self.r1_hit = true
      self.remaining_size -= size1
      self.save
    end
  end

  def take_profit_short_R2(size1, size2)
    if current_price <= r2 && r2_hit == false
      sell_2 = (size2 * (entry - r2))
      self.user.cash -= sell_2
      self.user.equity += sell_2
      self.user.save
      self.r2_hit = true
      self.remaining_size -= size2
      self.save
    end
  end

  def take_profit_short_R3(size1, size2, size3)
    if current_price <= r3 && r3_hit == false
      sell_3 = (size3 * (r3 - entry))
      self.user.cash -= sell_3
      self.user.equity += sell_3
      self.user.save
      self.r3_hit = true
      self.remaining_size -= size3
      self.save
    end
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

end
