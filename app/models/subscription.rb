class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  before_validation :downcase_user_email

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email,
            presence: true,
            format: { with: /\A[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+\z/ }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }

  validate :user_not_registered, on: :create

    def user_name
      user.present? ? user.name : super
    end

    def user_email
      user.present? ? user.email : super
    end

  private

    def user_not_registered
      if User.find_by(email: user_email)
        errors.add(:user_email, I18n.t("controllers.subscription.unavailable_email"))
      end
    end

  def downcase_user_email
    user_email&.downcase!
  end
end
