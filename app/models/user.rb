class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

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

  private

  def downcase_attributes
    username&.downcase!
    email&.downcase!
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email).update_all(user_id: self.id)
  end
end
