class SearchesController < ApplicationController

  def search
    @posts = Post.search(params[:search])
    @post_pages = Post.page(params[:page]).reverse_order
  end

end
