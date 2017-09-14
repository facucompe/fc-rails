class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Hooks
  before_validation :generate_verification_code, on: :create

  validates :first_name, :last_name, :email, presence: true

  has_many :rents
  has_many :book_suggestions

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end
end
