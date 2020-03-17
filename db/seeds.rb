# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'username', email: 'ricky@ricky.com', password: 'password')
user = User.create(username: 'user2', email: 'user2', password: 'user2')

artist = Artist.create(name: 'OutKast', genre: 'Rap', photo_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/OutKast_2001.jpg/800px-OutKast_2001.jpg')
artist = Artist.create(name: 'Kendrick Lamar', genre: 'Rap', photo_url: 'https://media.gq.com/photos/5e6151090f0a6a0008f45908/master/w_3000,h_1873,c_limit/GQ_KendrickLamar_030520.jpg')

album = Album.create(name: 'Aquemini', release_date: '1998-09-29', label: 'LaFace Records', cover_url: 'https://upload.wikimedia.org/wikipedia/en/2/2c/AqueminiOutKast.jpg', popularity: 90, artist_id: 1)
album = Album.create(name: 'To Pimp a Butterfly', release_date: '2015-03-15', label: 'Interscope Records', cover_url: 'https://upload.wikimedia.org/wikipedia/en/f/f6/Kendrick_Lamar_-_To_Pimp_a_Butterfly.png', popularity: 100, artist_id: 2)

song = Song.create(name: 'Aquemini', duration_ms: 100000, preview_url: 'www.preview.com', album_id: 1, artist_id: 1)
song = Song.create(name: 'Alright', duration_ms: 100000, preview_url: 'www.preview.com', album_id: 2, artist_id: 2)

user_album = UserAlbum.create(user_id: 1, album_id: 1, artist_id: 1)
