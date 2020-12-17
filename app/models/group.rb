class Group < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false, scope: :user

  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :icon, dependent: :destroy
end
