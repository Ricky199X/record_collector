Fabricator(:user) do
   username { Faker::Name.name }
   email { Faker::Internet.email }
   password { Faker::Games::Pokemon.name }
end 