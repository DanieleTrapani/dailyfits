# Clean database (should also destroy pictures in cloudinary)
puts("Clearing DB...")
User.destroy_all
puts("DB clear.")
# Create a new user

puts("Creating Admin User..")
user = User.create(
  {
    :first_name => "Daniele",
    :last_name => "Trapani",
    :email => "daniele@email.com",
    :password => "dailyfits1314",
    :password_confirmation => "dailyfits1314",
    :location => "Amsterdam"
  }
)
puts("Admin created.")

puts("Creating 5 outfits")
today = WeatherApi.get_day(0, user.location)

puts("Creating outfit1")
file1 = URI.open("https://media-photos.depop.com/b0/19736062/1117052713_d3cc51dde13a4ad3864ebac4f511941c/P8.jpg")
outfit1 = Outfit.new(description: "green vibes", user: user)
outfit1.photos.attach(filename: "outfit1.png", io: file1, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit1
outfit1.save!

puts("Creating outfit2")
file2a = URI.open(
  "https://static.theright.fit/profile/images/52e5b65c-3363-4655-8768-6385c098738a/fnWkDmUUX9fugpmsTuBetnkbTcB0UUDYKk9nFNzp.jpeg"
)
file2b = URI.open("https://pbs.twimg.com/media/FxfJYetWwAEwk-N.jpg:large")
outfit2 = Outfit.new(description: "black outfit variations", user: user)
outfit2.photos.attach(filename: "outfit2a.png", io: file2a, content_type: "image/*")
outfit2.photos.attach(filename: "outfit2b.png", io: file2b, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit2
outfit2.save!

puts("Creating outfit3")
file3 = URI.open("https://i.pinimg.com/736x/c2/54/41/c254412d82dc1ed05a9942b69d9d967e.jpg")
outfit3 = Outfit.new(description: "test", user: user)
outfit3.photos.attach(filename: "outfit3.png", io: file3, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit3
outfit3.save!

puts("Creating outfit5")
file5 = URI.open("https://i.pinimg.com/1200x/82/c6/ae/82c6ae274717524864969496873f24be.jpg")
outfit5 = Outfit.new(description: "evening weat", user: user)
outfit5.photos.attach(filename: "outfit5.png", io: file5, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit5
outfit5.save!

puts("Creating outfit6")
file6 = URI.open(
  "https://static.theright.fit/profile/images/52e5b65c-3363-4655-8768-6385c098738a/n2KeByqaasnuJJLE0dQ9LZvAHvKFaruUL8YBEEQS.jpeg"
)
outfit6 = Outfit.new(description: "smart casual", user: user)
outfit6.photos.attach(filename: "outfit6.png", io: file6, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit6
outfit6.save!

puts("Creating winter outfits...")
today = WeatherApi.get_day(0, "Anchorage")

puts("Creating outfit7")
file7 = URI.open("https://i.pinimg.com/736x/d2/9e/4b/d29e4b07c69b86e51403d53768c035b6.jpg")
outfit7 = Outfit.new(description: "cold", user: user)
outfit7.photos.attach(filename: "outfit7.png", io: file7, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit7
outfit7.save!

puts("Creating outfit8")
file8 = URI.open("https://miro.medium.com/v2/resize:fit:5458/1*1kvD2hwI_0X48cf_tS9KsA.jpeg")
outfit8 = Outfit.new(description: "cold", user: user)
outfit8.photos.attach(filename: "outfit8.png", io: file8, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit8
outfit8.save!

puts("Creating outfit9")
file9 = URI.open("https://i.ytimg.com/vi/mQFpUTi_Owo/maxresdefault.jpg")
outfit9 = Outfit.new(description: "cold", user: user)
outfit9.photos.attach(filename: "outfit9.png", io: file9, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit9
outfit9.save!

puts("Creating outfit10")
file10 = URI.open("https://i.pinimg.com/474x/70/10/c1/7010c15db6781da7a11099c8c3a33266.jpg")
outfit10 = Outfit.new(description: "cold", user: user)
outfit10.photos.attach(filename: "outfit10.png", io: file10, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit10
outfit10.save!

puts("Creating outfit11")
file11 = URI.open(
  "https://reliked.com/cdn/shop/collections/251432522_4508524899235407_4189611921762263702_n_500x@2x.jpg?v=1647856270"
)
outfit11 = Outfit.new(description: "cold", user: user)
outfit11.photos.attach(filename: "outfit11.png", io: file11, content_type: "image/*")
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end

tag.outfits << outfit11
outfit11.save!

puts("Done!")
