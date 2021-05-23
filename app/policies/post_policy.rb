class PostPolicy < ApplicationPolicy
  def publish?
    user == record.user
  end

  class Scope < Scope
    def resolve
      if user.nil?
        scope.is_published
      elsif user.admin?
        scope
      else
        scope.where(user: user).or(scope.where(published: true))
      end
    end
  end
end