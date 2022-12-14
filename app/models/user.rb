class User < ApplicationRecord
  def to_param
    nickname
  end

  has_many :questions, dependent: :delete_all

  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w\.-]+@[A-Za-z\d\-\.+]+\.[a-z]+\z/}
  validates :nickname, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[A-Za-z_\d]+\z/i}
  validates :color, format: { with: /\A#[a-f\d]{6}\z/}

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: "robohash")

  private

  def downcase_nickname
    nickname.downcase!
  end

  def downcase_email
    email.downcase!
  end
end
