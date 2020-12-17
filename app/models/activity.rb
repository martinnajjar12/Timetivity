class Activity < ApplicationRecord
  validates_presence_of :name, :group_id, :time

  belongs_to :user
  belongs_to :group
end
