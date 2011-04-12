require 'machinist/active_record'

Person.blueprint do
  name { Faker::Name.name }
  sport  { "Football" }
  person_type {"Athlete" }
  email { Faker::Internet.email}
  password { "secret"}
end
