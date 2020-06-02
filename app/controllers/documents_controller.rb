class DocumentsController < ApplicationController
  def index
    @documents = Document.all
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to documents_path
    else
      render 'new'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    redirect_to documents_path
  end

  def new
    @document = Document.new
  end

  def documents
    @documents = Document.where(category: "Document")
  end

  def folders
  end

  def videos
    @videos = Document.where(category: "Video") 
  end

  def podcasts
    @podcasts = Document.where(category: "Podcast")
  end

  def books
    @books = Document.where(category: "Book")
  end

  def tools 
    @tools = Document.where(subcategory: "Tool")
  end

  def administratives 
    @administratives = Document.where(subcategory: "Administrative")
  end

  def portfolios 
    @portfolios = Document.where(subcategory: "Portfolio")
  end

  def educations 
    @educations = Document.where(subcategory: "Education")
  end

  private

  def document_params
    params.require(:document).permit(:category, :title, :content, :url, :subcategory)
  end
end

