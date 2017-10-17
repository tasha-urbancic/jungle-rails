class User < ActiveRecord::Base

  before_validation :downcase_email

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 8 }

  validates :email, uniqueness: {case_sensitive: false}

  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  has_secure_password

  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
  
  def downcase_email
    self.email = email.downcase if email.present?
  end
  
end
