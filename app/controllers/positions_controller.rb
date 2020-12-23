class PositionsController < ApplicationController
  def create
    @position = Position.new(position_params)
    # @position.current_price = @position.entry
    @position.user = current_user

    if @position.buy_sell == "Buy"
      # @position.r1 = @position.baseline + ((@position.target - @position.baseline) * 0.3)
      @position.r2 = @position.baseline + ((@position.target - @position.baseline) * 0.7)
      @position.r3 = @position.target
    else
      # @position.r1 = @position.baseline - ((@position.baseline - @position.target) * 0.3)
      @position.r2 = @position.baseline - ((@position.baseline - @position.target) * 0.7)
      @position.r3 = @position.target
    end

    if @position.buy_sell == "Buy" && current_user.cash <= ( @position.size * @position.entry )
      flash[:notice] = 'Insufficient funds to complete the transaction!'
      redirect_to user_path(current_user)
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
      flash[:notice] = 'Position successfully created'
      redirect_to user_path(current_user)
    else
      render 'pages/dashboard'
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def stop_hit
    @position = Position.find(params[:id])
    @position.stop_loss_hit = true
    @position.save
    redirect_to user_path(current_user)
  end

  def update
    @position = Position.find(params[:id])
    @position.update(position_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to user_path(current_user)
  end

  def reset
    @positions = Position.where(user_id: current_user.id)
    @positions.destroy_all
    current_user.cash = 100000
    current_user.equity = 0
    current_user.save
    redirect_to user_path(current_user)
  end

  def perform_now
    position = Position.all
    if position.size == 0
      redirect_to scoreboard_path
      flash[:notice] = 'No active position'
    else
      PriceUpdateJob.perform_now
      redirect_to scoreboard_path
      flash[:notice] = 'Prices updated'
    end
  end

  def my_perform_now
    position = Position.all
    if position.size == 0
      redirect_to user_path(current_user)
      flash[:notice] = 'No active position'
    else
      PriceUpdateJob.perform_now
      redirect_to user_path(current_user)
      flash[:notice] = 'Positions prices updated'
    end
  end


  def no_wallet
    @positions = Position.where(user_id: current_user.id)
    @positions.destroy_all
    current_user.cash = 0
    current_user.equity = 0
    current_user.save
    redirect_to user_path(current_user)
    flash[:notice] = 'No more wallet'
  end

  def refresh
    @positions = Position.all
    @users = User.all
    sum = 0
    @positions.each do |position|
      if position.buy_sell == "Buy"
        sum += position.remaining_size * position.current_price
      else
        sum -= position.remaining_size * position.current_price
      end
    end

    redirect_to scoreboard_path
    flash[:notice] = 'Position prices updated'
  end

  def refresh_my_pl
    @positions = Position.where(user_id: current_user.id)
    sum = 0
    @positions.each do |position|
      if position.buy_sell == "Buy"
        sum += position.remaining_size * position.current_price
      else
        sum -= position.remaining_size * position.current_price
      end
    end
    current_user.equity = sum
    current_user.save
    redirect_to user_path(current_user)
    flash[:notice] = 'P/L updated'
  end



  private

  def position_params
    params.require(:position).permit(:stock_id, :size, :entry, :baseline, :target, :stop_loss, :buy_sell, :r1, :r2, :r3, :current_price, :id, :stop_loss_hit)
  end
end
