# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Cities
City.create(name: "Paris", zip_code:"75000")
City.create(name: "Lille", zip_code:"59000")
City.create(name: "Lyon", zip_code:"69000")
City.create(name: "Marseille", zip_code:"13000")
City.create(name: "Rennes", zip_code:"35000")
City.create(name: "Strasbourg", zip_code:"67000")
City.create(name: "Bordeaux", zip_code:"33000")
City.create(name:"Autre", zip_code: "12345")
