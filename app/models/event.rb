class Event < ApplicationRecord
  has_many :participants, through: :events_participants_relationships, source: :user
  has_many :events_participants_relationships, dependent: :destroy
  has_many :organizers, through: :events_organizer_relationships, source: :user
  has_many :events_organizer_relationships, dependent: :destroy
  belongs_to :genre

  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :schedule, presence: true
  validates :recruitment_numbers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :participant_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def people_counter(ud)
    case ud
    when "up"
      update(recruitment_numbers: recruitment_numbers - 1, participant_count: participant_count + 1)
    when "down"
      update(recruitment_numbers: recruitment_numbers + 1, participant_count: participant_count - 1)
    end
    if participant_count == 0
      update(result: 1)
    end
  end
end
