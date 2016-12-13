class Contact < ApplicationRecord
  belongs_to :user

  validates :email, presence: true
  validates :user, presence: true
end
