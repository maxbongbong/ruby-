class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :orders, dependent: :nullify
  has_many :wish_lists, dependent: :destroy
end
