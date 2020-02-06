class DocumentsController < ApplicationController
  # before_action :set_document, only: [:edit]
  # validates :title, :comment, :image, presence: true

  def index
    @documents = Document.all
    @document = Document.new
    # @document = Document.find(25)
    # if params[:id].present?
    #   @document = Document.find(params[:id])
    # else
    #   @document = Document.new
    # end

  end

  def create
    Document.create(document_params)
    redirect_to root_path
  end

  def edit
    @document = Document.find(params[:id])
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy
    redirect_to root_path
  end

  def update
    document = Document.find(params[:id])
    document.update(document_params)
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end

  

end
