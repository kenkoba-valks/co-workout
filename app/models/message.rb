class Message < ApplicationRecord
  belongs_to :trainer
  belongs_to :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
