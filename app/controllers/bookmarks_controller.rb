class BookmarksController < ApplicationController

  def create
    bookmark = current_user.bookmarks.build(document_id: params[:document_id])
    bookmark.save!
    redirect_to documents_path, success: t('.flash.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(document_id: params[:document_id]).destroy!
    redirect_to documents_path, success: t('.flash.not_bookmark')
  end

end
