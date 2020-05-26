class DocumentsController < ApplicationController
  def index
  end

  def create
    @document = document.new(document_params)
    @document.user_id = current_user.id
    if @document.save
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def destroy
    @document = document.find(params[:id])
    @document.destroy

    redirect_to documents_path
  end

  private

  def document_params
    params.require(:document).permit(:category, :title, :content)
  end
end
end
