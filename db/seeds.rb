puts "Event delete"
Event.delete_all
puts "User delete"
User.delete_all
puts "Genre delete"
Genre.delete_all
puts "Genre create"
["音楽","演劇・ダンス","プロダクト","テクノロジー","ゲーム","コミュニティ","フード","写真","ファッション","映像・映画","パフォーマンス","スポーツ","ビジネス","ソーシャルグッド"].each do |name|
  genre = Genre.new(
    name: name
  )
  genre.save(validate: false)
end
puts "User create"
(1..20).each do |n|
  user = User.new(
    name: "太郎#{n}号",
    password: "password",
    email: Faker::Internet.email,
    icon: Faker::Avatar.image,
    current_sign_in_at: Faker::Time.between(2.days.ago, Date.today, :all),
    last_sign_in_at: Faker::Time.between(2.days.ago, Date.today, :all)
    )
  user.save(validate: false)
  puts "#{user.name}"
end
puts "Event create"
(1..100).each do |n|
  event = Event.new(
    title: Faker::Lorem.sentence,
    image: "http://www.w3schools.com/css/trolltunga.jpg",
    url: "http://qiita.com/azusanakano/items/1fda2c17e6f51779fe10",
    description: Faker::Lorem.paragraph,
    schedule: Faker::Date.between(20.days.ago, Date.today),
    recruitment_numbers: rand(20),
    participant_count: rand(10),
    genre_id: rand(Genre.first.id..Genre.last.id)
  )
  event.save(validate: false)
  User.find(rand(User.first.id..User.last.id)).holding_events << event
  puts "#{event.title}"
end
