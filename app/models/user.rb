class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  # Hooks
  before_validation :generate_verification_code, on: :create

  validates :first_name, :last_name, :email, presence: true

  has_many :rents
  has_many :book_suggestions

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
