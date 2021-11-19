class SearchesController < ApplicationController
  def index
    
  end
  
  def search
    @posts = Post.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end
end
