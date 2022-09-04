class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email,
            presence: true,
            format: { with: /\A[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+\z/ }
  validates :user_email, uniqueness: { scope: :event_id }, unless: -> { user.present? }
  validates :user, uniqueness: { scope: :event_id }, if: -> { user.present? }


  def user_name
    user.present? ? user.name : super
  end

  def user_email
    user.present? ? user.email : super
  end
end
