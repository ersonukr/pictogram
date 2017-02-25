class Comment < ApplicationRecord

  #==== Associations ===================================================
  belongs_to :user, inverse_of: :comments
  belongs_to :article, inverse_of: :comments
end
