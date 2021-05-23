class PostsController < ApplicationController
  before_action :set_post, except: [:index, :show, :new, :create]
  before_action :authenticate_user!, except: :show

  def index
    @posts = current_user.posts.id_desc.page(params[:page])
  end

  def show
    @post = policy_scope(Post).find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :edit
    end
  end

  def publish
    @post.save_as_published
    redirect_to posts_path
  end

  private
  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :header_image, :content, :published)
  end

  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, alert: t('errors.unauthenticated')
    end
  end
end
