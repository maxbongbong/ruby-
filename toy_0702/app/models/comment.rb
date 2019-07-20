class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin_user, optional: true
  belongs_to :contact, optional: true
end
