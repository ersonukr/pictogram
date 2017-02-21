class Article < ApplicationRecord

  #==== Image Uploader ==================================================
  has_attached_file :image, styles: {:medium => "520x"}

  #==== Associations ====================================================


  #==== Validations ====================================================
  validates :image, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
