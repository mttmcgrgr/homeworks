# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
matthew = User.create!(email: 'mattmcgregor@gmail.com')
aron = User.create!(email: 'aron@gmail.com')
gage = User.create!(email: 'gageta@gmail.com')

google = ShortenedUrl.create_for_user_and_long_url!(matthew, "www.google.com",)

facebook = ShortenedUrl.create_for_user_and_long_url!(aron, "www.facebook.com")
