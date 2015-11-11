# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |i|
  Price.create(item_id: 1, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 2, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 3, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 4, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 5, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 6, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 7, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 8, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 9, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 10, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
50.times do |i|
  Price.create(item_id: 11, price: 100 + rand(100), item_sold_at: 5.days.ago - i.days)
end
