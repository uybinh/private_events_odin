class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX =/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\Z/i
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX }
                    
  has_secure_password

  has_many :created_events, foreign_key: "creator_id", class_name: "Event"

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
