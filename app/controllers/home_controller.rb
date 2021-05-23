class HomeController < ApplicationController
  def index
    @posts = Post.is_published.id_desc.page(params[:page])
  end
end
