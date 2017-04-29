# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
EventAttending.destroy_all

User.create([
  { name: 'Leo' },
  { name: 'Michiko' },
  { name: 'Doggy' }
])

Event.create([
  { name: 'Concert', date: Date.today, creator_id: 1 },
  { name: 'Movie night', date: Date.today + 2.days, creator_id: 1 },
  { name: 'Talent show', date: Date.today + 3.days, creator_id: 3 }
])

