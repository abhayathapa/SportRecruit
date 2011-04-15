require 'acceptance/acceptance_helper'

feature "Articles", %q{
  In order to accept or reject offers
  As an Athlete
  I want to be able to view offers
  } do

    background do
      @ath = Person.make!(:person_type => "Athlete")
      @xyz = Person.make!(:person_type => "Recruiter")
      Offer.deal(@ath.athlete,@xyz.recruiter)
      visit new_person_session_path
      fill_in("Email", :with => "#{@ath.email}")
      fill_in("Password", :with => "#{@ath.password}")
      click_button("Sign in")
    end

    scenario "accept offer", :js => true do
      visit athletes_path
      page.should have_content("Welcome #{@ath.name}")

      select("Male", :from => "Gender")
      click_button("Update Athlete")
      click_link("My Offers")
      visit my_offers_athletes_path

      page.should have_content("My Offers :")
      click_link("Accept")
      page.should have_content("Offer Accepted!")
    end

    scenario "reject offer", :js => true do
      visit athletes_path
      page.should have_content("Welcome #{@ath.name}")

      select("Male", :from => "Gender")
      click_button("Update Athlete")
      click_link("My Offers")
      visit my_offers_athletes_path

      page.should have_content("My Offers :")
      click_link("Reject")
      page.should have_content("Offer Rejected!")
    end

  end