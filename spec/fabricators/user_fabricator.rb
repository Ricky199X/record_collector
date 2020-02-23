Fabricator(:user) do
   username { Faker::Name.name }
   email { Faker::Internet.email }
   password { Faker::Games::Pokemon.name }
   # user_albums(count: 1)
end 