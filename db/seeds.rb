# Clean database (should also destroy pictures in cloudinary)
IMG =[
  "https://images.unsplash.com/photo-1521045452978-3753d26aaee4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80",
  "https://images.unsplash.com/photo-1576185055363-6d7c88000919?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80",
  "https://images.unsplash.com/photo-1675873725360-b15df4950952?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzR8fG91dGZpdHMlMjB3b21hbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=1600&q=60”,
  "https://plus.unsplash.com/premium_photo-1690366914306-d5f673a5dc4f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
  "https://images.unsplash.com/photo-1628375385883-6e086364f66d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=930&q=80",
  "https://images.unsplash.com/photo-1571587289339-cb7da03fb5a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1450&q=80",
  "https://images.unsplash.com/photo-1607688387752-473f3eec9489?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80",
  "https://images.unsplash.com/photo-1600074342811-7764248a2b1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=774&q=80”
  ]

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

IMG.each_with_index do |img,i|
  file = URI.open(img)
  outfit = Outfit.new(description: "test", user: user)
  outfit.photos.attach(filename: 'cold.png', io: file, content_type: 'image/*')
  today = WeatherApi.get_day(0, 'Amsterdam')
  tag_params = WeatherApi.create_tag(today)
  tag = Tag.new(tag_params)
  if tag.valid?
    tag.save
  else
    tag = Tag.where(tag_params).first
  end
  tag.outfits << outfit
  outfit.save!
end

puts "Done!"

# file1 = URI.open('')
# outfit1 = Outfit.new(description: "test", user: user)
# outfit1.photos.attach(filename: 'cold.png', io: file1, content_type: 'image/*')
# today = WeatherApi.get_day(0, 'Amsterdam')
# tag_params = WeatherApi.create_tag(today)
# tag = Tag.new(tag_params)
# if tag.valid?
#   tag.save
# else
#   tag = Tag.where(tag_params).first
# end
# tag.outfits << outfit1
# outfit1.save!

# file2 = URI.open('')
# outfit2 = Outfit.new(description: "test", user: user)
# outfit2.photos.attach(filename: 'cold.png', io: file2, content_type: 'image/*')
# today = WeatherApi.get_day(0, 'Amsterdam')
# tag_params = WeatherApi.create_tag(today)
# tag = Tag.new(tag_params)
# if tag.valid?
#   tag.save
# else
#   tag = Tag.where(tag_params).first
# end
# tag.outfits << outfit2
# outfit2.save!


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
