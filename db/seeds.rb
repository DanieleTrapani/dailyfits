# Clean database (should also destroy pictures in cloudinary)
puts "Clearing DB..."
User.destroy_all
puts "DB clear."
# Create a new user

puts "Creating Admin User.."
user = User.create({
    first_name: "Admin",
    last_name: "Adminson",
    email: 'admin@admin.com',
    :password => 'dailyfits1314',
    :password_confirmation => 'dailyfits1314',
    location: 'Amsterdam'
})
puts "Admin created."

puts "Creating 5 outfits"

puts "Creating outfit1"
file1 = URI.open('https://media-photos.depop.com/b0/19736062/1117052713_d3cc51dde13a4ad3864ebac4f511941c/P8.jpg')
outfit1 = Outfit.new(description: "green vibes", user: user)
outfit1.photos.attach(filename: 'outfit1.png', io: file1, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit1
outfit1.save!

puts "Creating outfit2"
file2a = URI.open('https://static.theright.fit/profile/images/52e5b65c-3363-4655-8768-6385c098738a/fnWkDmUUX9fugpmsTuBetnkbTcB0UUDYKk9nFNzp.jpeg')
file2b = URI.open('https://pbs.twimg.com/media/FxfJYetWwAEwk-N.jpg:large')
outfit2 = Outfit.new(description: "black outfit variations", user: user)
outfit2.photos.attach(filename: 'outfit2a.png', io: file2a, content_type: 'image/*')
outfit2.photos.attach(filename: 'outfit2b.png', io: file2b, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit2
outfit2.save!

puts "Creating outfit3"
file3 = URI.open('https://i.pinimg.com/736x/c2/54/41/c254412d82dc1ed05a9942b69d9d967e.jpg')
outfit3 = Outfit.new(description: "test", user: user)
outfit3.photos.attach(filename: 'outfit3.png', io: file3, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit3
outfit3.save!

puts "Creating new outfit5"
file5 = URI.open('https://i.pinimg.com/1200x/82/c6/ae/82c6ae274717524864969496873f24be.jpg')
outfit5 = Outfit.new(description: "evening weat", user: user)
outfit5.photos.attach(filename: 'outfit5.png', io: file5, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit5
outfit5.save!

puts "Creating new outfit6"
file6 = URI.open('https://static.theright.fit/profile/images/52e5b65c-3363-4655-8768-6385c098738a/n2KeByqaasnuJJLE0dQ9LZvAHvKFaruUL8YBEEQS.jpeg')
outfit6 = Outfit.new(description: "smart casual", user: user)
outfit6.photos.attach(filename: 'outfit6.png', io: file6, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit6
outfit6.save!

puts "Done!"
