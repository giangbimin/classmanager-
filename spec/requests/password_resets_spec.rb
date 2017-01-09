require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  describe "PasswordResets" do
    it "emails user when requesting password reset" do
	    user = FactoryGirl.create(:user)
	    visit login_path
	    click_link("password")
	    fill_in "Email", :with => user.email
	    click_button "Reset Password"
	    current_path.should eq(root_path)
	    page.should have_content("Email sent")
	#   ActionMailer::Base.deliveries.last
	    last_email.to.should include(user.email)
  	end
  end
end

