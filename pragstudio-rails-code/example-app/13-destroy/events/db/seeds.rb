# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create!([
  {
    name: 'BugSmash',
    location: 'Denver',
    price: 0.00,
    description: 'A fun evening of bug smashing!',
    starts_at: 10.days.from_now
  },
  {
    name: 'Hackathon',
    location: 'Austin',
    price: 15.00,
    description: 'Hunker down at the Hackathon!',
    starts_at: 15.days.from_now
  },
  {
    name: 'Kata Camp',
    location: 'Dallas',
    price: 75.00,
    description: 'Practice your craft kata style!',
    starts_at: 30.days.from_now
  }
])
