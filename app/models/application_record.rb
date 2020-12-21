class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :of, ->(this_user) { where('user_id= ?', this_user.id) }
  scope :ordered_by_most_recent, -> { order('created_at DESC') }
end
