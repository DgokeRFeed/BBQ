class User < ApplicationRecord
  has_many :events

  before_validation :set_name_and_username, on: :create
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

  def set_name_and_username
    self.name = "Челбасик#{rand(1337)}" if self.name.blank?
    self.username = "shish#{Time.now.to_i}" if self.username.blank?
  end

  def downcase_attributes
    username&.downcase!
    email&.downcase!
  end


end
