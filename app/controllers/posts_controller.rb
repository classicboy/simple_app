class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, alert: t('admin.errors.unauthenticated')
    end
  end
end
