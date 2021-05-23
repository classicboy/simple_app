class Admin::PostsController < Admin::ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = Post.id_desc.page(params[:page])
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path, notice: t('.successs')
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :header_image, :content)
  end
end
