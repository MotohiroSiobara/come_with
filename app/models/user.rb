class User < ApplicationRecord
  has_many :events, through: :events_users_relationships
  has_many :events_users_relationships
  mount_uploader :icon, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
