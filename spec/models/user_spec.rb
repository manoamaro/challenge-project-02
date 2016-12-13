require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should create a user when email, first name, last name and password is given' do
    expect do
      User.create!(first_name: 'Some name', last_name: 'Last name', email: 'email@example.com', password: '123456')
    end.to change(User, :count).by(1)
  end

  it 'should not create a User with password less than 6 characters' do
    expect do
      User.create!(first_name: 'Some name', last_name: 'Last name', email: 'email@example.com', password: '12345')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not create a User without email' do
    expect do
      User.create!(first_name: 'Some name', last_name: 'Last name', password: '123456')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not create a User without first or last name' do
    expect do
      User.create!(email: 'email@example.com', password: '123456')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not create a User with a already taken email' do
    User.create!(first_name: 'Some name', last_name: 'Last name', email: 'email@example.com', password: '123456')
    expect do
      User.create!(first_name: 'Other user', last_name: 'Last other name', email: 'email@example.com', password: '123456')
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

end
