class CustomFieldValue < ApplicationRecord
  belongs_to :contact, optional: true
  belongs_to :custom_field
end
