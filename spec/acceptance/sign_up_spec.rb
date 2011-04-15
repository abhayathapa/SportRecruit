require 'acceptance/acceptance_helper'

feature "Articles", %q{
In order to sign up
As a person
I want to be able to sign up
} do

  scenario "Sign up failure", :js => true do
    visit new_person_registration_path
    fill_in("Email", :with => "abhaya@gmail.com")
    fill_in("Password", :with => "secret")
    fill_in("Password confirm", :with => "secret")
    click_button("Sign up")
    page.should have_content("Name can't be blank")
  end

  scenario "Sign up success", :js => true do
    visit new_person_registration_path
    fill_in("Name", :with => "Abhaya")
    fill_in("Email", :with => "abhaya@gmail.com")
    fill_in("Password", :with => "secret")
    fill_in("Password confirm", :with => "secret")
    click_button("Sign up")
    page.should have_content("Welcome Abhaya")
  end

end