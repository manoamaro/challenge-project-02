require 'rails_helper'

RSpec.describe "Contacts", type: :request do

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /contacts" do
    it "works! (now write some real specs)" do
      get contacts_path
      expect(response).to have_http_status(200)
    end
  end
end
