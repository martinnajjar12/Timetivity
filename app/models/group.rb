class Group < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_one_attached :icon
end
