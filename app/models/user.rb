class User < ApplicationRecord
  after_create :create_external_group

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :avatar, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :activities, dependent: :destroy

  def current_user
    @current_user ||= super.tap do |user|
      ::ActiveRecord::Associations::Preloader.new.preload(user, :groups)
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
    end
  end

  # rubocop:disable Lint/AssignmentInCondition
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
  # rubocop:enable Lint/AssignmentInCondition

  private

  def create_external_group
    group = groups.build(name: 'External Activities')
    group.save
  end
end
