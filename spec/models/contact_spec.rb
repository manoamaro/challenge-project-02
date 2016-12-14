require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'should validate presence of email' do
    expect { Contact.create!(first_name: 'name', last_name: 'name') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should validate if custom field values belongs to signed user' do
    signed_user = create(:user)
    other_user = create(:user)
    custom_field_01 = create(:custom_field, user: signed_user)
    custom_field_02 = create(:custom_field, user: other_user)

    contact = Contact.create!(first_name: 'name', last_name: 'name',
                              email: 'email@email.com', user: signed_user)

    contact.custom_field_values.create(custom_field: custom_field_02, value: '123456')

    expect do
      contact.save!
    end.to raise_error(ActiveRecord::RecordInvalid,
                       'Validation failed: Custom field values should belongs to you')
  end

  it 'should validate if custom field values belongs to signed user' do
    signed_user = create(:user)
    other_user = create(:user)
    custom_field_01 = create(:custom_field, user: signed_user)
    custom_field_02 = create(:custom_field, user: other_user)

    contact = Contact.new(first_name: 'name', last_name: 'name',
                          email: 'email@email.com', user: signed_user)

    contact.custom_field_values.build(custom_field: custom_field_02, value: '123456')

    expect do
      contact.save!
    end.to raise_error(ActiveRecord::RecordInvalid,
                       'Validation failed: Custom field values should belongs to you')
  end

  it 'should validate if custom field values belongs to signed user' do
    signed_user = create(:user)
    other_user = create(:user)
    custom_field_01 = create(:custom_field, user: signed_user)
    custom_field_02 = create(:custom_field, user: other_user)

    custom_field_values = [CustomFieldValue.new(custom_field: custom_field_02, value: '123456')]

    expect do
      Contact.create!(first_name: 'name', last_name: 'name',
                      email: 'email@email.com', user: signed_user,
                      custom_field_values: custom_field_values)
    end.to raise_error(ActiveRecord::RecordInvalid,
                       'Validation failed: Custom field values should belongs to you')
  end

end
