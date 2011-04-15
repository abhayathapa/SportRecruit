require 'acceptance/acceptance_helper'

feature "Articles", %q{
  In order to search Athletes
  As a Recruiter
  I want to be able to use Advanced search
  } do

    background do
      @person = Person.make!(:person_type => "Recruiter")
      visit new_person_session_path
      fill_in("Email", :with => "#{@person.email}")
      fill_in("Password", :with => "#{@person.password}")
      click_button("Sign in")
    end

    scenario "search by athlete's name", :js => true do
      visit recruiters_path
      page.should have_content("Welcome #{@person.name}")

      fill_in("Coach", :with => "Van Gaal")
      click_button("Update Recruiter")
      click_link("Advanced Search")
      click_button("Begin Search")

      page.should have_content("Search Results :")
    end

  end