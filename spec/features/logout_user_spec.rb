require 'rails_helper'

feature "Log out User" do
    before(:each) do 
        visit "/login"
    end

    scenario "Log out button should exist" do
        fill_in "user[username]", with: "iamJohnDoe"
        click_button "Login"
        expect(page).to have_link "Log Out"
    end

    scenario "User redirected to log in page" do
        fill_in "user[username]", with: "iamJohnDoe"
        click_button "Login"
        click_on "Log Out"
        expect(page).to have_current_path("/login")
    end
end