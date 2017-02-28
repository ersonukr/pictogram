class Article < ApplicationRecord

  #==== Image Uploader ==================================================
  has_attached_file :image, styles: {:medium => "520x"}

  #==== Associations ====================================================
  belongs_to :user, inverse_of: :articles
  has_many :comments, inverse_of: :article, dependent: :destroy
  has_many :notifications, inverse_of: :article, dependent: :destroy

  #==== Validations ====================================================
  validates :user_id, presence: true
  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  acts_as_votable

end
