class Event < ApplicationRecord
  has_many :users, through: :events_users_relationships
  has_many :events_users_relationships
  mount_uploader :image, ImageUploader
end
