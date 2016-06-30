# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(email: 'joy', password: 'joy', session_token: 'sdfsf903423r')

Band.create!(name: "Danny Lipsitz & The Brass Tacks")
Band.create!(name: "Danny Lipsitz's Late-Night Snack")
Band.create!(name: "Gordan Webster & Friends")
Band.create!(name: "Tin Pan")
Band.create!(name: "Jonathan Stout's Orchestra")

Album.create!(name: "Big Brown House", band_id: 1, record_type: :studio)
Album.create!(name: "My Piano", band_id: 1, record_type: "live")

Track.create!(name: "Big Brown Eyes", lyrics: "La de da de daaa", song_type: "regular")
Track.create!(name: "Skyfall", lyrics: "Fa la la la laaaa", song_type: "regular")
