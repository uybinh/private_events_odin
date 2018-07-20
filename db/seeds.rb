binh = User.create!(name: "Uy Binh",
  email: "binh@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")


xuan = User.create!(name: "Minh Xuan",
  email: "xuan@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")


event_1 = xuan.created_events.create!(date: Time.zone.tomorrow, location: "Xuan's house")
event_2 = xuan.created_events.create!(date: Time.zone.yesterday, location: "Xuan's house")
event_3 = xuan.created_events.create!(date: Time.zone.today, location: "Xuan's house")
event_4 = binh.created_events.create!(date: Time.zone.tomorrow, location: "Binh's house")

binh.attended_events << [event_1, event_2]
xuan.attended_events << [event_1, event_4]

10.times do |n|
  date = Faker::Time.forward(23, :morning)
  location = Faker::Address.full_address
  xuan.created_events.create!(date: date, location: location)
end


20.times do |n|
  name = Faker::Name.name
  user = User.create!(name: name,
    email: Faker::Internet.email,
    password: "foobar",
    password_confirmation: "foobar")
  user.attended_events << event_1  
end

25.times do |n|
  name = Faker::Name.name
  user = User.create!(name: name,
    email: Faker::Internet.email,
    password: "foobar",
    password_confirmation: "foobar")
  user.attended_events << event_2 
end