require 'acceptance/acceptance_helper'

feature "Articles", %q{
  In order to sign in
  As a person
  I want to be able to sign in
  } do

    background do
      @person = Person.make!
    end

    scenario "Sign in failure", :js => true do
      visit new_person_session_path
      fill_in("Email", :with => "#{@person.email}")
      fill_in("Password", :with => "sercet")
      click_button("Sign in")
      page.should have_content("Invalid email or password.")
      sleep(2)
    end

    scenario "Sign in success", :js => true do
      visit new_person_session_path
      fill_in("Email", :with => "#{@person.email}")
      fill_in("Password", :with => "#{@person.password}")
      click_button("Sign in")
      sleep(2)
      page.should have_content("Welcome #{@person.name}")
      sleep(2)
    end

  end