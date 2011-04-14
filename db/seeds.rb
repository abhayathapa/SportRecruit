# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'ffaker'


# person =  Person.find_or_create_by_email(:name =>"Lebron James", :sport =>"Basktetball", :person_type =>"Athlete",:email =>"a@a.com", :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )

person =  Person.find_or_create_by_email(:name =>"Avaya", :sport =>"Football", :person_type =>"Athlete", :email =>"a@a.com", :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )
person.athlete.update_attributes(:dob => "1990-1-11",:gender =>"Male",:height =>168,:weight =>50)
person.athlete.stat.update_attributes(:matches => 30, :wins =>23, :losses =>5, :goals =>22, :assists =>12, :cleansheets =>0, :position =>"Mid-Field")

(1..2).each do |x|
  person =  Person.find_or_create_by_email(:name =>Faker::Name.name, :sport =>"Football", :person_type =>"Athlete", :email =>Faker::Internet.email, :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )
  person.athlete.update_attributes(:dob => "1989-11-11",:gender =>"Male",:height =>190,:weight =>80)
  person.athlete.stat.update_attributes(:matches => 56, :wins =>23, :losses =>12, :goals =>44, :assists =>2, :cleansheets =>0, :position =>"Striker")
end

(1..2).each do |x|
person =  Person.find_or_create_by_email(:name =>Faker::Name.name, :sport =>"American Football", :person_type =>"Athlete", :email =>Faker::Internet.email, :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )
      person.athlete.update_attributes(:dob => "1989-11-11",:gender =>"Male",:height =>170,:weight =>70)
      person.athlete.stat.update_attributes(:matches => 56, :wins =>23, :losses =>12, :goals =>44, :assists =>2, :cleansheets =>0, :position =>"Punter")
end

person =  Person.find_or_create_by_email(:name =>"Ivan Gazidis", :sport =>"Football", :person_type =>"Recruiter", :email =>"a@arsenal.com", :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )
      person.recruiter.update_attributes(:coach => "Arsene Wenger", :nickname => "Gunners", :establishment => "1889-10-11", :country => "England" )

person =  Person.find_or_create_by_email(:name =>Faker::Name.name, :sport =>"American Football", :person_type =>"Recruiter", :email =>Faker::Internet.email, :password =>"aaaaaa", :password_confirmation =>"aaaaaa" )
      person.recruiter.update_attributes(:coach => "Johnny Rocah", :nickname => "Fatalun", :establishment => "1989-10-11", :country => "US" )
