class User < ApplicationRecord

  acts_as_voter


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #==== Associations ====================================================
  has_many :articles, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
  has_many :notifications, inverse_of: :user, dependent: :destroy

  #==== Validations =====================================================
  validates :first_name, presence: true, length: {minimum: 2, maximum: 10}

  #==== Paperclip =====================================================
  has_attached_file :avatar, styles: {medium: '152x152#'}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

end
