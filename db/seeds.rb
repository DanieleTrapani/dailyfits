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
    :password => 'password',
    :password_confirmation => 'password',
    location: 'Amsterdam'
})
puts "Admin created."

puts "Creating new 5 outfits, outfit2 has multiple photos"

puts "Creating new outfit1"
file1 = URI.open('https://images.unsplash.com/photo-1521045452978-3753d26aaee4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80')
outfit1 = Outfit.new(description: "test", user: user)
outfit1.photos.attach(filename: 'cold.png', io: file1, content_type: 'image/*')
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

puts "Creating new outfit2"
file2a = URI.open('https://images.unsplash.com/photo-1600074338311-246e63381568?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80')
file2b = URI.open('https://images.unsplash.com/photo-1600074342811-7764248a2b1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80')
file2c = URI.open('https://images.unsplash.com/photo-1600075110136-e29c6d9e91ed?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80')
outfit2 = Outfit.new(description: "test", user: user)
outfit2.photos.attach(filename: 'cold.png', io: file2a, content_type: 'image/*')
outfit2.photos.attach(filename: 'cold.png', io: file2b, content_type: 'image/*')
outfit2.photos.attach(filename: 'cold.png', io: file2c, content_type: 'image/*')
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

puts "Creating new outfit4"
file4 = URI.open('https://images.unsplash.com/photo-1621335829175-95f437384d7c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80')
outfit4 = Outfit.new(description: "test", user: user)
outfit4.photos.attach(filename: 'cold.png', io: file4, content_type: 'image/*')
today = WeatherApi.get_day(0, user.location)
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit4
outfit4.save!

puts "Creating new outfit5"
file5 = URI.open('https://images.unsplash.com/photo-1607688387752-473f3eec9489?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3087&q=80')
outfit5 = Outfit.new(description: "test", user: user)
outfit5.photos.attach(filename: 'cold.png', io: file5, content_type: 'image/*')
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
file6 = URI.open('https://images.unsplash.com/photo-1576185055363-6d7c88000919?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80')
outfit6 = Outfit.new(description: "test", user: user)
outfit6.photos.attach(filename: 'cold.png', io: file6, content_type: 'image/*')
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
