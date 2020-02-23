
Fabricator(:album) do
   name { Faker::Name.name }
   release_date { Faker::Date.in_date_period }
   label { "Whatever Records" }
   cover_url { "www.pic.com" }
   popularity { ( 0..100 ) }
   artist_id { ( 1 ) }
end 