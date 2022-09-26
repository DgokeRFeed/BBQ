class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[github]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_fill: [100, 100]
    attachable.variant :normal, resize_to_fill: [400, 400]
  end

  before_validation :downcase_attributes

  validates :name, presence: true, length: { maximum: 40 }

  validates :username,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-z\d]([a-z\d_]*[a-z\d])?\z/ },
            length: { maximum: 40 }

  after_commit :link_subscriptions, on: :create

  def to_param
    username
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first
    return user if user.present?

    where(uid: auth.uid, provider: auth.provider).first_or_create! do |user|
      # Если создаём новую запись, прописываем email и пароль
      user.name = auth.info.nickname
      user.username = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token.first(16)
      user.skip_confirmation!
    end
  end

  private

  def downcase_attributes
    username&.downcase!
    email&.downcase!
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
