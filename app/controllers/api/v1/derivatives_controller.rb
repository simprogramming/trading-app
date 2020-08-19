class Api::V1::DerivativesController < ApplicationController




  def index
    @derivatives = Derivative.all
  end
  # def edit

  # end

  # def update

  # end

  private

  def derivative_params
    params.require(:derivative).permit(:content, :day)
  end

end
