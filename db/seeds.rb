3.times do
  User.create!(
  email: Faker::Internet.email,
  password: "111111"
  )
end

users = User.all

10.times do
  RegisteredApplication.create!(
    user:   users.sample,
    name: Faker::StarWars.character,
    url: Faker::Internet.url
  )
end

apps = RegisteredApplication.all

40.times do
  Event.create!(
    registered_application:   apps.sample,
    name: Faker::Cat.name
  )
end

events = Event.all

sample = User.create!(
  email:    'member@example.com',
  password: '111111'
)

10.times do
  RegisteredApplication.create!(
    user:   users.find_by(email: 'member@example.com'),
    name: Faker::StarWars.character,
    url: Faker::Internet.url
  )
end

40.times do
  Event.create!(
    registered_application:   User.find_by(email: 'member@example.com').registered_applications.sample,
    name: Faker::Cat.name,
    created_at: Faker::Time.backward(14, :evening)
  )
end

puts "Seed finished"
puts "#{User.count} Users created"
puts "#{RegisteredApplication.count} Apps created"
