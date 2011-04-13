require 'acceptance/acceptance_helper'

feature "Articles", %q{
  In order to sign in
  As a person
  I want to be able to sign in
  } do

    background do
      @person = Person.make!
    end

    scenario "User index", :js => true do
      visit new_person_session_path
      fill_in("Email", :with => "#{@person.email}")
      fill_in("Password", :with => "#{@person.password}")
      click_button("Sign in")
      visit persons_path
      page.should have_content("Welcome #{@person.email}")

      visit new_person_presentation_topic_path(@person)
      fill_in("Title", :with => "New Mac")
      fill_in("Description", :with => "Its on the rise")
      fill_in("Presentation Duration (in minutes)", :with => 33)
      click_button("Create Presentation topic")
      page.should have_content("You have posted a Presentation Topic successfully ! ")

      visit presentation_topics_path
      click_link("New Mac")
      click_link("vote_button")
      page.should have_content(" You CANNOT VOTE for your own Topic !! ")
      User.last.votes_remaining.should == 5
      PresentationTopic.last.votes.should == 0
    end

  end