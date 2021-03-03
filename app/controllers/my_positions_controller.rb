class MyPositionsController < ApplicationController
  def new
    @my_position = MyPosition.new
  end

  def create
    @my_position = MyPosition.new(my_position_params)
    @my_position.user = current_user
    if @my_position.save
      @my_position.remaining_size = @my_position.size
      @my_position.save
      flash[:notice] = 'Position successfully created'
      redirect_to user_path(current_user)
    else
      render 'my_positions/new'
      flash[:notice] = 'Incomplete action, try again'
    end
  end

  def edit
    @my_position = MyPosition.find(params[:id])
  end

  def update
    @my_position = MyPosition.find(params[:id])
    @my_position.update(my_position_params)
    redirect_to user_path(current_user)
    flash[:notice] = 'Position successfully updated'
  end

  def destroy
    @my_position = MyPosition.find(params[:id])
    @my_position.destroy
    redirect_to user_path(current_user)
  end

  private

  def my_position_params
    params.require(:my_position).permit(:stock_id, :size, :entry, :iceline, :target, :stop_loss, :buy_sell, :r1, :current_price, :id, :stop_loss_hit, :target_hit)
  end
end
