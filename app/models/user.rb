class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  after_create :assign_default_role

  scope :id_desc, -> { order id: :desc }
  scope :regular_users, -> { with_role :regular_user }

  def assign_default_role
    self.add_role(:regular_user) if roles.blank?
  end

  def admin?
    has_cached_role?(:admin)
  end

  def regular_user?
    has_cached_role?(:regular_user)
  end
end
