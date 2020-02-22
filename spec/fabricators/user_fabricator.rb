Fabricator(:user) do
   username { Faker::User.name }
   email { Faker::Internet.email }
   password { Faker::Games::Sports.name }

end 