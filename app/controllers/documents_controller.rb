class DocumentsController < ApplicationController
  # before_action :set_document, only: [:edit]
  # validates :title, :comment, :image, presence: true
  # def new
  #   @document = Document.new
  # end


  def index
    @documents = Document.all.includes(:user).order("created_at DESC")
    @document = Document.new
    # @bookmarks = Bookmark.all
    # @document = Document.find(params[:id])
    # if params[:id].present?
    #   @document = Document.find(params[:id])
    # else
    #   @document = Document.new
    # end
  end

  def create
    document = Document.create(document_params)
    redirect_to root_path
  end

  def edit
    @document = Document.find(params[:id])
      # redirect_back(fallback_location: root_path)
  end

  def destroy
    document = Document.find(params[:id])
    document.destroy
    # redirect_back(fallback_location: root_path)
    # これで直近のページへ戻れる
    if request.referer.include?("edit")
      #前のページが指定したURLだった場合のリンク先
      redirect_to root_path
      #その他のリンク先
    else  
      redirect_back(fallback_location: root_path)
    end
    
  end

  def update
    document = Document.find(params[:id])
    document.update(document_params)
    
    redirect_to root_path
    # if document.save
    #   flash[:notice] = "更新しました"
    #   redirect_to 'index'
    # else
    #   document.attributes = params[:document_params]
    #   flash[:notice] = "失敗しました"
    #   render edit_document_path
    # end
  end

  def show
    # @documents = Document.all.includes(:user).order("created_at DESC")
    @bookmarks = Bookmark.all.includes(:user).order("created_at DESC")
    # 中間テーブルでやってしまった結果がshowペーじが酷すぎるが後学のためやむなし
    # @document = Document.find(params[:id])
  end

  def search
    @documents = Document.search(params[:keyword]).order("created_at DESC")
                          # ↑備忘録findではなくsearchにすべし
  end
  
  def bookmarks
    @documents = current_user.bookmark_documents.includes(:user).recent
  end

  private

  def document_params
    params.require(:document).permit(:title, :comment, :image).merge(user_id: current_user.id)
  end

end
