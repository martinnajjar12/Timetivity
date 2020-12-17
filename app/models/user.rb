class User < ApplicationRecord
  after_create :create_external_group
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :activities, dependent: :destroy

  private

  def create_external_group
    group = groups.build(name: 'External Activities')
    group.save
  end
end
