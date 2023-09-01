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
    :password_confirmation => 'password'
})
puts "Admin created."

puts "Creating new outfits"

file1 = URI.open('https://images.unsplash.com/photo-1576185055363-6d7c88000919?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80')
outfit1 = Outfit.new(description: "test", user: user)
outfit1.photos.attach(filename: 'cold.png', io: file1, content_type: 'image/*')
today = WeatherApi.get_day(0, 'Amsterdam')
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit1
outfit1.save!

file2 = URI.open('https://images.unsplash.com/photo-1521045452978-3753d26aaee4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80')
outfit2 = Outfit.new(description: "test", user: user)
outfit2.photos.attach(filename: 'cold.png', io: file2, content_type: 'image/*')
today = WeatherApi.get_day(0, 'Amsterdam')
tag_params = WeatherApi.create_tag(today)
tag = Tag.new(tag_params)
if tag.valid?
  tag.save
else
  tag = Tag.where(tag_params).first
end
tag.outfits << outfit2
outfit2.save!

puts "Done!"

# file1 = URI.open("https://cdn2.civitatis.com/paises-bajos/amsterdam/guia/vondelpark.jpg")
# file2 = URI.open("https://www.tasteofhome.com/wp-content/uploads/2019/03/shutterstock_1169910928-cheers-horizontal.jpg")
# file3 = URI.open("https://static.dw.com/image/16095847_605.jpg")
# activity = Activity.create!(
#   name: "Drink a Beer at 't Blauw Theehuis in Vondelpark",
#   user: User.all.sample,
#   category: hidden_gems,
#   location: 'Vondelpark 5, 1071 AA Amsterdam',
#   description: 'Taproom 't Blauwe Theehuis is located in the middle of the Vondelpark. Enjoy the Amsterdam vibe on our sun-drenched terrace.',
#   date: rand(DateTime.now..(DateTime.now + 1.months)),
#   time: Time.now + (3600 * rand(6..12)),
#   price: rand(5..30)
# )
# activity.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
# activity.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
# activity.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
# activity.save!
