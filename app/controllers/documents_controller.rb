class DocumentsController < ApplicationController

  # validates :title, :comment, :image, presence: true

  def index
    @documents = Document.all
    @document = Document.new
  end

  def create
    Document.dreate(document_params)
    redirect_to root_path
  end

  private

  def document_params
    params.require(:document).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end

end
