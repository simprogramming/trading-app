class Position < ApplicationRecord
  belongs_to :stock
  belongs_to :user

  validates :entry, presence: true
  validates :stock, presence: true
  validates :buy_sell, presence: true
  validates :size, presence: true
  validates :iceline, presence: true
  validates :target, presence: true
  validates :stop_loss, presence: true
  validates :current_price, presence: true
  validates :r1, presence: true

  def total_amount
    entry * size
  end

  def gain_loss_percentage
    if buy_sell == "Buy"
      x = (current_price - entry)/(entry)
    else
      x = entry/current_price - 1
    end
    x
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
    self.stop_loss_hit = true unless self.stop_loss_hit == true
    self.save
  end

  def gain_loss_closed
    size_of_r1 = size * 0.3
    target_size = size - size_of_r1

    if buy_sell == "Buy"
      if current_price <= stop_loss || stop_loss_hit
        exit_long
      else
        take_profit_long_R1(size_of_r1)
        take_profit_long_target(size_of_r1, target_size)
      end
    else
      if buy_sell == "Sell"
        if current_price >= stop_loss || stop_loss_hit
          exit_short
        else
          take_profit_short_R1(size_of_r1)
          take_profit_short_target(size_of_r1, target_size)
        end
      end
    end
  end

  def p_l_closed
    size_of_r1 = size * 0.3
    target_size = size - size_of_r1

    if buy_sell == "Buy" && remaining_size == 0
      if stop_loss_hit == true
        if r1_hit
          return size_of_r1 * r1 + target_size * stop_loss - total_amount
        else
          return size * stop_loss - total_amount
        end
      else
        return size_of_r1 * r1 + target_size * target - total_amount
      end
    end

    if buy_sell == "Sell" && remaining_size == 0
      if stop_loss_hit == true # put in DB
        if r1_hit
          return total_amount - (size_of_r1 * r1 + target_size * stop_loss)
        else
          return total_amount - size * stop_loss
        end
      else
        return total_amount - (size_of_r1 * r1 + target_size * target)
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

  def take_profit_long_R1(size_of_r1)
    if current_price >= r1 && r1_hit == false && remaining_size != 0
      self.user.cash += size_of_r1 * r1
      self.user.equity -= size_of_r1 * entry
      self.user.save
      self.r1_hit = true
      self.stop_loss = entry
      self.remaining_size -= size_of_r1
      self.save
    end
  end

  def take_profit_long_target(size_of_r1, target_size)
    # need a way to execute only once, not every time the stock hits the taregt
    if current_price >= target && target_hit == false && remaining_size != 0
      self.user.cash += target_size * target
      self.user.equity -= target_size * entry
      self.user.save
      self.target_hit = true
      self.remaining_size -= target_size
      self.save
    end
  end

  def take_profit_short_R1(size_of_r1)
    if current_price <= r1 && r1_hit == false && remaining_size != 0
      self.user.cash -= size_of_r1 * r1
      self.user.equity += size_of_r1 * entry
      self.user.save
      self.r1_hit = true
      self.stop_loss = entry
      self.remaining_size -= size_of_r1
      self.save
    end
  end

  def take_profit_short_target(size_of_r1, target_size)
    if current_price <= target && target_hit == false && remaining_size != 0
      self.user.cash -= target_size * target
      self.user.equity += target_size * entry
      self.user.save
      self.target_hit = true
      self.remaining_size -= target_size
      self.save
    end
  end
end
