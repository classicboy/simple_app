class Post < ApplicationRecord
  mount_uploader :header_image, HeaderImageUploader

  belongs_to :user

  before_save :generate_published_at, if: :published

  validates_presence_of :title, :content, :header_image
  validates :header_image, header_image_has_minimum_size: true

  delegate :name, to: :user, prefix: true, allow_nil: true
  delegate :email, to: :user, prefix: true, allow_nil: true

  scope :id_desc, -> { order id: :desc }
  scope :is_published, -> { where published: true }

  def save_as_published
    transaction do
      return true if update(published: true, published_at: Time.current)

      raise ActiveRecord::Rollback
    end
  end

  private
  def generate_published_at
    self.published_at = Time.current
  end
end
