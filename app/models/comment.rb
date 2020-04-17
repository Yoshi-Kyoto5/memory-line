class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  validates :text, {presence: true, length: {maximum: 140}}

  mount_uploader :image, ImageUploader
end
