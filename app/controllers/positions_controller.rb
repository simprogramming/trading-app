class PositionsController < ApplicationController
  def create
    @position = Position.new(position_params)
    @position.current_price = @position.entry
    @position.user = current_user

    if @position.buy_sell == "Buy"
      @position.r1 = @position.baseline + ((@position.target - @position.baseline) * 0.3) # creates theoretical sell price
      @position.r2 = @position.baseline + ((@position.target - @position.baseline) * 0.7)
      @position.r3 = @position.target
    else
      @position.r1 = @position.baseline - ((@position.baseline - @position.target) * 0.3)
      @position.r2 = @position.baseline - ((@position.baseline - @position.target) * 0.7)
      @position.r3 = @position.target
    end

    if @position.buy_sell == "Buy" && current_user.cash <= @position.size * @position.entry
      flash[:notice] = 'Insufficient funds to complete the transaction!'
      redirect_to root_path
    elsif @position.save
      @position.remaining_size = @position.size
      @position.save
      if @position.buy_sell == "Buy"
        current_user.cash -= @position.size * @position.entry
        current_user.equity += @position.remaining_size * @position.current_price
        current_user.save
      else
        current_user.cash += @position.size * @position.entry
        current_user.equity -= @position.remaining_size * @position.current_price
        current_user.save
      end
      flash[:notice] = 'Position successfully created, for more details check profile'
      redirect_to root_path
    else
      render 'pages/dashboard'
    end
  end

  def reset
    @positions = Position.where(user_id: current_user.id)
    @positions.destroy_all
    current_user.cash = 100000
    current_user.equity = 0
    current_user.save
    redirect_to user_path(current_user)
  end

  def no_wallet
    @positions = Position.where(user_id: current_user.id)
    @positions.destroy_all
    current_user.cash = 0
    current_user.equity = 0
    current_user.save
    redirect_to user_path(current_user)
  end

  private

  def position_params
    params.require(:position).permit(:stock_id, :size, :entry, :baseline, :target, :stop_loss, :buy_sell, :r1, :r2, :r3, :id)
  end
end
