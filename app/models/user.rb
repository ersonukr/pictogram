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
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  #==== Validations =====================================================
  validates :first_name, presence: true, length: {minimum: 2, maximum: 10}

  #==== Paperclip =======================================================
  has_attached_file :avatar, styles: {medium: '152x152#'}
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/


  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

end
