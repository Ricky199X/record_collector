# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'ricky@ricky.com', password: 'password', username: 'username')

artist = Artist.create(name: 'OutKast', genre: 'Rap', photo_url: 'https://en.wikipedia.org/wiki/Outkast#/media/File:OutKast_2001.jpg')

album = Album.create(name: 'Aquemini', release_date: '1998-09-29', label: 'LaFace Records', cover_url: 'https://en.wikipedia.org/wiki/Aquemini#/media/File:AqueminiOutKast.jpg', popularity: 90, artist_id: 1)

song = Song.create(name: 'Aquemini', duration_ms: 100000, preview_url: 'www.preview.com', album_id: 1, artist_id: 1)

user_album = UserAlbum.create(user_id: 1, artist_id: 1)
