require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'should validate presence of email' do
    expect { Contact.create!(first_name: 'name', last_name: 'name') }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
