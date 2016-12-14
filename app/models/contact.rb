class Contact < ApplicationRecord
  belongs_to :user

  has_many :custom_field_values, dependent: :destroy

  validates :email, presence: true
  validates :user, presence: true
  validate :custom_field_value_has_right_custom_field

  accepts_nested_attributes_for :custom_field_values

  def custom_field_value_has_right_custom_field
    custom_field_values&.each do |cfv|
      errors.add(:custom_field_values, 'should belongs to you') && break \
        if cfv.custom_field&.user != user
    end
  end
end
