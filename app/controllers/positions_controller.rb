class PositionsController < ApplicationController
  def create

    @position = Position.new(position_params)
    @position.current_price = @position.entry
    @position.user = current_user
    # @position.close_price
    if @position.buy_sell == "Buy"
      @position.r1 = @position.baseline + ((@position.target - @position.baseline) * 0.3) # creates theoretical sell price
      @position.r2 = @position.baseline + ((@position.target - @position.baseline) * 0.7)
      @position.r3 = @position.target
    else
      @position.r1 = @position.baseline - ((@position.baseline - @position.target) * 0.3)
      @position.r2 = @position.baseline - ((@position.baseline - @position.target) * 0.7)
      @position.r3 = @position.target
    end

    if @position.save
      redirect_to profile_path
    else
      render 'pages/dashboard'
    end
  end

  def destroy
  end

  # def close_price
  #    if buy_sell == "Buy"
  #     @position.r1 = baseline + ((target - baseline) * 0.3) # creates theoretical sell price
  #     @position.r2 = baseline + ((target - baseline) * 0.7)
  #     @position.r3 = target
  #   else
  #     @position.r1 = baseline - ((baseline - target) * 0.3)
  #     @position.r2 = baseline - ((baseline - target) * 0.7)
  #     @position.r3 = target
  #   end
  # end

  private
  def position_params
    params.require(:position).permit(:stock_id, :size, :entry, :baseline, :target, :stop_loss, :buy_sell, :r1, :r2, :r3, :id)
  end
end
