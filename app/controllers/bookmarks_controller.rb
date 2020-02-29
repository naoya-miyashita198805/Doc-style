class BookmarksController < ApplicationController

  before_action :set_document, only: %i[create destroy]

  def create
    bookmark = current_user.bookmarks.build(document_id: params[:document_id])
    bookmark.save!
    redirect_to documents_path, success: t('.flash.bookmark')
    # if request.referer.include?("searches")
      #前のページが指定したURLだった場合のリンク先
    # redirect_back(fallback_location: root_path)
    # 上のコードは非同期通信実装により削除
      
      #その他のリンク先
    # else  
      # redirect_to root_path
    # end
  end

  def destroy
    current_user.bookmarks.find_by(document_id: params[:document_id]).destroy!
    # redirect_to documents_path, success: t('.flash.not_bookmark')
    # if request.referer.include?("searches")
      #前のページが指定したURLだった場合のリンク先
    redirect_back(fallback_location: root_path)
    # 上のコードは非同期通信実装により削除
      
      #その他のリンク先
    # else  
      # redirect_to root_path
    # end
  end

  private
  # 非同期通信よう
  def set_document
    @document = Document.find(params[:document_id])
  end

end
