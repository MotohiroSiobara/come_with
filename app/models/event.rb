class Event < ApplicationRecord
  has_many :users, through: :events_users_relationships
  has_many :events_users_relationships, dependent: :destroy
  mount_uploader :image, ImageUploader

  def counter_up
    update(recruitment_numbers: recruitment_numbers + 1, participants: participants - 1)
    if participants == 0
      update(result: 1)
    end
  end
end
