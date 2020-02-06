class Document < ApplicationRecord
  belongs_to :user

  validates :comment, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
