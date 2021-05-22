class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.regular_users.id_desc.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: t('.success')
    else
      flash.now[:warning] = t('.error')
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: t('.successs')
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password).tap do |p|
      p[:password] = nil if p[:password].blank?
    end
  end
end
