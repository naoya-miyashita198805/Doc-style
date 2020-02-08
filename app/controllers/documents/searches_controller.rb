class Documents::SearchesController < ApplicationController
  def index
    @documents = Document.search(params[:title])
  end
  
end
