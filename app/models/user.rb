class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  before_validation :downcase_attributes

  validates :name, presence: true, length: { maximum: 40 }

  validates :username,
            presence: true ,
            uniqueness: true,
            format: { with: /\A[a-z\d]([a-z\d_]*[a-z\d])?\z/ },
            length: { maximum: 40 }

  def to_param
    username
  end

  private

  def downcase_attributes
    username&.downcase!
    email&.downcase!
  end


end
