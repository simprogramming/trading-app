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

  def articles
    @articles = Document.where(category: "Article")
  end

  def tools 
    @tools = Document.where(category: "Tool")
  end

  def administratives 
    @administratives = Document.where(category: "Administrative")
  end

  def portfolios 
    @portfolios = Document.where(category: "Portfolio")
  end

  def educations 
    @educations = Document.where(category: "Education")
  end

  private

  def document_params
    params.require(:document).permit(:category, :title, :content, :url, :subcategory)
  end
end

