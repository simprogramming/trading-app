class PositionsController < ApplicationController

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    # @position.current_price = @position.entry
    @position.user = current_user

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
      render 'positions/new'
      flash[:notice] = 'Incomplete action, try again'
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
    flash[:notice] = 'Position successfully updated'
  end

  def destroy
    @position = Position.find(params[:id])
    if @position.buy_sell == "Buy" && @position.r1_hit == false && @position.stop_loss_hit == false && @position.target_hit == false
      current_user.cash += @position.size * @position.entry
      current_user.equity -= @position.remaining_size * @position.current_price
      current_user.save
    elsif @position.buy_sell == "Sell" && @position.r1_hit == false && @position.stop_loss_hit == false && @position.target_hit == false
      current_user.cash -= @position.size * @position.entry
      current_user.equity += @position.remaining_size * @position.current_price
      current_user.save
    # elsif @position.buy_sell == "Buy" && @position.stop_loss_hit == true && @position.r1_hit == false  && @position.target_hit == false
    #   current_user.cash += @position.p_l_closed
    #   current_user.save
    else
      flash[:notice] = 'Position is active, cannot delete!'
      redirect_to user_path(current_user)
      return
    end
    @position.destroy
    redirect_to user_path(current_user)
  end

  def perform_now
    position = Position.all
    if position.size == 0
      redirect_to scoreboard_path
      flash[:notice] = 'No active position'
    else
      PriceUpdateJob.perform_now
      RefreshAllPlJob.perform_now
      redirect_to scoreboard_path
      flash[:notice] = 'Scoreboard updated'
    end
  end

  def my_perform_now
    position = Position.all
    if position.size == 0
      redirect_to user_path(current_user)
      flash[:notice] = 'No active position'
    else
      PriceUpdateJob.perform_now
      RefreshAllPlJob.perform_now
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

  def reset
    @positions = Position.where(user_id: current_user.id)
    @positions.destroy_all
    current_user.cash = 100000
    current_user.equity = 0
    current_user.save
    redirect_to user_path(current_user)
  end

  private

  def position_params
    params.require(:position).permit(:stock_id, :size, :entry, :iceline, :target, :stop_loss, :buy_sell, :r1, :current_price, :id, :stop_loss_hit, :target_hit)
  end
end
