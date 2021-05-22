class Admin::ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout 'admin/layouts/application'

  def index
  end

  private
  def authenticate_user!
    if user_signed_in? && current_user.admin?
      super
    else
      redirect_to root_path, alert: t('admin.errors.unauthenticated')
    end
  end
end
