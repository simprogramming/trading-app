class PositionsController < ApplicationController
  def create

    @position = Position.new(position_params)
    @position.current_price = @position.entry
    @position.user = current_user
    if @position.save
      redirect_to profil_path
    else
      render 'pages/dashboard'
    end
  end

  def destroy
  end

  private
  def position_params
    params.require(:position).permit(:stock_id, :size, :entry, :baseline, :target, :stop_loss, :buy_sell)
  end
end
