class SearchesController < ApplicationController

  def search
    @search = params[:search]
    @posts = Post.search(params[:search])
    @post_pages = Post.page(params[:page]).reverse_order
    @tag_list = Tag.all
  end

end
