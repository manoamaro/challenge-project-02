FactoryGirl.define do
  factory :custom_field do
    title "MyString"
    field_type :text
    default_value "MyString"
    user
  end
end
