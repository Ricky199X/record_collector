Fabricator(:user) do
   username { Faker::Name.name }
   email { Faker::Email.email }
   # password { Faker::Password.password }

end 