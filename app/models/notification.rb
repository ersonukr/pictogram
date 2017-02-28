class Notification < ApplicationRecord

  #==== Associations ====================================================
  belongs_to :user, inverse_of: :notifications
  belongs_to :notified_by, class_name: 'User'
  belongs_to :article, inverse_of: :notifications

  #==== Validations =====================================================
  validates :user_id, :notified_by_id, :article_id, :identifier, :notice_type, presence: true

end
