class CustomField < ApplicationRecord
  belongs_to :user

  enum field_type: [:text, :textarea, :combobox]

  validates :title, presence: true
  validates :field_type, presence: true
  validates :user, presence: true
end
