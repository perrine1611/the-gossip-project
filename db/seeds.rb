# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Gossip.destroy_all

gossip_ary = Array.new
tag_ary = Array.new

#Cities
10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Number.leading_zero_number(digits: 5))
end

#Users
20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: Faker::Number.between(from: 1, to: 10), email: Faker::Internet.email, age: Faker::Number.between(from: 13, to: 70), description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true))
end

#Gossips
10.times do
  gossip_ary << Gossip.new(content: Faker::Lorem.paragraph(sentence_count: 5, supplemental: true), title: Faker::TvShows::BreakingBad.episode, user_id: Faker::Number.between(from: 1, to: 10))
end

#Tags
10.times do
  t = Tag.create(title: Faker::Lorem.word)
  tag_ary << t
  t.save
end

gossip_ary.each do |gossip|
  n = Faker::Number.between(from: 1, to: 5)
  n.times do
     gossip.tags << tag_ary.sample 
  end
  gossip.save
end

