class Position < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates :entry, presence: true
  validates :stock, presence: true
  validates :buy_sell, presence: true
  validates :size, presence: true
  validates :baseline, presence: true
  validates :target, presence: true
  validates :stop_loss, presence: true
  validates :current_price, presence: true
  validates :r1, presence: true
  validates :r2, presence: true
  validates :r3, presence: true

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
    self.user.cash -= remaining_size * stop_loss
    self.user.equity += remaining_size * entry
    self.user.save
    self.remaining_size = 0
    self.save
  end


  def exit_long
    self.user.cash += remaining_size * stop_loss
    self.user.equity -= remaining_size * entry
    self.user.save
    self.remaining_size = 0
    self.save
  end

  def gain_loss_closed
    size1 = size * 0.3
    size2 = (size - size1) * 0.5
    size3 = size - size1 - size2

    if buy_sell == "Buy"

      if stop_loss_hit
        exit_long
      else
        take_profit_long_R1(size1)
        take_profit_long_R2(size1, size2)
        take_profit_long_R3(size1, size2, size3)
      end
      # position.exit (stop-loss) / opposite for short-sell
    else
      if buy_sell == "Sell"
        if stop_loss_hit
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
      if stop_loss_hit == true
        if r1_hit && r2_hit && r3_hit
          return size1 * r1 + size2 * r2 + size3 * r3 - total_amount
        elsif r1_hit && r2_hit
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
        if r1_hit && r2_hit && r3_hit
          return total_amount - (size1 * r1 + size2 * r2 + size3 * r3)
        elsif r1_hit && r2_hit
          return total_amount - (size1 * r1 + size2 * r2 + size3 * stop_loss)
        elsif r1_hit
          return total_amount - (size1 * r1 + (size2 + size3) * stop_loss)
        else
          return total_amount - size * stop_loss
        end
      else
        return total_amount - (size1 * r1 + size2 * r2 + size3 * r3)
      end
    end
      return "N/A"
  end

  def portfolio_return
    if p_l_closed != "N/A"
      return ((p_l_closed / 100000) * 100).round(2)
    else
      return "Active"
    end
  end

  def take_profit_long_R1(size1)
    if current_price >= r1 && r1_hit == false && remaining_size != 0
      self.user.cash += size1 * r1
      self.user.equity -= size1 * entry
      self.user.save
      self.r1_hit = true
      self.stop_loss = entry
      self.remaining_size -= size1
      self.save
    end
  end

  def take_profit_long_R2(size1, size2)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= r2 && r2_hit == false && remaining_size != 0
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
    if current_price >= r3 && r3_hit == false && remaining_size != 0
      self.user.cash += size3 * r3
      self.user.equity -= size3 * entry
      self.user.save
      self.r3_hit = true
      self.remaining_size -= size3
      self.save
    end
  end

  def take_profit_short_R1(size1)
    if current_price <= r1 && r1_hit == false && remaining_size != 0
      self.user.cash -= size1 * r1
      self.user.equity += size1 * entry
      self.user.save
      self.r1_hit = true
      self.stop_loss = entry
      self.remaining_size -= size1
      self.save
    end
  end

  def take_profit_short_R2(size1, size2)
    if current_price <= r2 && r2_hit == false && remaining_size != 0
      self.user.cash -= size2 * r2
      self.user.equity += size2 * entry
      self.user.save
      self.r2_hit = true
      self.remaining_size -= size2
      self.save
    end
  end

  def take_profit_short_R3(size1, size2, size3)
    if current_price <= r3 && r3_hit == false && remaining_size != 0
      self.user.cash -= size3 * r3
      self.user.equity += size3 * entry
      self.user.save
      self.r3_hit = true
      self.remaining_size -= size3
      self.save
    end
  end
end
