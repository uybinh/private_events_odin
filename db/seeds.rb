binh = User.create!(name: "Uy Binh",
  email: "binh@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")


xuan = User.create!(name: "Minh Xuan",
  email: "xuan@gmail.com",
  password: "foobar",
  password_confirmation: "foobar")

xuan.created_events.create!(date: Time.zone.tomorrow, location: "Xuan's house")
binh.created_events.create!(date: Time.zone.tomorrow, location: "Binh's house")
