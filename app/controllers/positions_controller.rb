class PositionsController < ApplicationController
  def create

    @position = Position.new(position_params)
    @position.entry_1 = params.require(:position)[:entry_1].last
    @position.user = current_user
    if @position.save
      redirect_to dashboard_path
    else
      render 'pages/dashboard'
    end
  end

  def destroy
  end

  private
  def position_params
    params.require(:position).permit(:stock_id, :quantity_1)
  end
end
