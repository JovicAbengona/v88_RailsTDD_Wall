require 'rails_helper'

feature "Post Message" do
    before(:each) do 
        visit "/login"
    end

    scenario "successfully posts a message" do
        fill_in "user[username]", with: "iamJohnDoe"
        click_button "Login"
        fill_in "message", with: "This is a message from Capybara!"
        click_button "Post Message"
        expect(page).to have_content "This is a message from Capybara!"
        expect(page).to have_current_path(messages_path)
    end

    scenario "unsuccessfully posts a messaget" do
        fill_in "user[username]", with: "iamJohnDoe"
        click_button "Login"
        fill_in "message", with: "Qwe"
        click_button "Post Message"
        expect(page).to have_content "Message is too short (minimum is 10 characters)"
        expect(page).to have_current_path(messages_path)
    end
end