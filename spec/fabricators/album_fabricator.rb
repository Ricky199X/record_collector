
Fabricator(:album) do
   name { Faker::Name.name }
   release_date { Faker::Date.date }
   label { Faker::Music::RecordLabel.name }
   cover_url { Faker::Picture::picture.url }
   popularity { ( 0..100 ) }
   artist_id { Faker::Artist.id }
end 