class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #==== Associations ====================================================
  has_many :articles, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy

  #==== Validations =====================================================
  validates :first_name, presence: true, length: { minimum: 2, maximum: 10 }
end
