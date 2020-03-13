class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user

  mount_uploader :image, ImageUploader
end
