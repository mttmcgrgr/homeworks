# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kitty = Cat.create!(birth_date: "1999/10/19", color: "black", name: "kitty cat", sex: "M", description: "very nice kitty cat")
kitty2 = Cat.create!(birth_date: "2000/2/23", color: "orange", name: "jones", sex: "F", description: "poor cat")
