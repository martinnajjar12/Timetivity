class Group < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name, case_sensitive: false, scope: :user

  belongs_to :user
  has_many :activities, dependent: :destroy
  has_one_attached :icon, dependent: :destroy

  private
  def sign_up?
    self.user.time_ago_in_words(created_at) == 'less than a minute'
  end
end
