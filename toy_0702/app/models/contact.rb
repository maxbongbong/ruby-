class Contact < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin_user, optional: true
  has_many :comments, dependent: :nullify
end
