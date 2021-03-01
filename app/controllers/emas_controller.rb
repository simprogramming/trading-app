class EmasController < ApplicationController

  before_action :set_ema, only: [:destroy]

  def create
    @ema = Ema.new(ema_params)
    @ema.user = current_user
    respond_to do |format|
      if @ema.save
        format.html { redirect_to my_watchlist_path, notice: 'EMA 9-18 was successfully created.' }
        format.json { render :new, status: :created, location: @ema }
      else
        format.html { render :new }
        format.json { render json: @ema.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @ema.destroy
    redirect_to dashboard_path
  end
  
  private

  def ema_params
    params.require(:ema).permit(:stock_id, :date, :direction)
  end

  def set_ema
    @ema = Ema.find(params[:id])
  end
end
