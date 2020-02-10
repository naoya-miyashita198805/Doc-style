class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.build(document_id: params[:document_id])
    bookmark.save!
    # redirect_to documents_path, success: t('.flash.bookmark')
    # if request.referer.include?("searches")
      #前のページが指定したURLだった場合のリンク先
    redirect_back(fallback_location: root_path)
      
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
      
      #その他のリンク先
    # else  
      # redirect_to root_path
    # end
  end

end
