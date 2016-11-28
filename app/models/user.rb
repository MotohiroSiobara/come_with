class User < ApplicationRecord
  has_many :join_events, source: :event, through: :events_participants_relationships
  has_many :events_participants_relationships, dependent: :destroy
  has_many :holding_events, through: :events_organizer_relationships, source: :event
  has_many :events_organizer_relationships, dependent: :destroy

  mount_uploader :icon, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
