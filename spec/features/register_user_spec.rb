require 'rails_helper'

# Test is built around the login controller because registraion happens when user enters a unique username
feature "User Registraion" do
    before(:each) do 
        visit "/login"
    end

    scenario "successfully creates a new user account" do
        fill_in "user[username]", with: "iamLoki"
        click_button "Login"
        expect(page).to have_content "Welcome, iamLoki"
        expect(page).to have_current_path("/messages")
    end

    scenario "unsuccessfully creates a new user account" do
        fill_in "user[username]", with: "Qwe"
        click_button "Login"
        expect(page).to have_content "Username is too short (minimum is 6 characters)"
        expect(page).to have_current_path("/login")
    end
end