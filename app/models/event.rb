class Event < ApplicationRecord
  has_many :participants, through: :events_participants_relationships, source: :user
  has_many :events_participants_relationships, dependent: :destroy
  has_many :organizers, through: :events_organizer_relationships, source: :user
  has_many :events_organizer_relationships, dependent: :destroy
  mount_uploader :image, ImageUploader

  def counter_up
    update(recruitment_numbers: recruitment_numbers + 1, participants: participants - 1)
    if participants == 0
      update(result: 1)
    end
  end
end
