puts "Event delete"
Event.delete_all
puts "Event create"
(1..100).each do |n|
  event = Event.new(
    title: Faker::Lorem.sentence,
    image: "http://www.w3schools.com/css/trolltunga.jpg",
    url: "http://qiita.com/azusanakano/items/1fda2c17e6f51779fe10",
    description: Faker::Lorem.paragraph,
    schedule: Faker::Date.between(20.days.ago, Date.today),
    recruitment_numbers: rand(20),
    participants: rand(10),
  )
  event.save
  puts "#{event.title}"
end
