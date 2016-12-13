require 'rails_helper'

RSpec.describe CustomField, type: :model do
  it 'should validate presence of title' do
    expect { CustomField.create!(title: nil, field_type: :text, user: create(:user)) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should validate presence of field_type' do
    expect { CustomField.create!(title: 'title 01', field_type: nil, user: create(:user)) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should validate presence of user' do
    expect { CustomField.create!(title: 'title 01', field_type: :textarea, user: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should create when every required field are set' do
    expect do
      CustomField.create!(title: 'title 01', field_type: :textarea, user: create(:user))
    end.to change(CustomField, :count).by(1)
  end

end
