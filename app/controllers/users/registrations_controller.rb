class Users::RegistrationsController < Devise::SessionsController
  layout 'application_authentication'

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      super
    else
      flash.now[:warning] = t('.error')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
