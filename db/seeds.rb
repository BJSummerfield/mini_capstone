# Product.create!([
#   {name: "Alienware Gaming PC", price: "9999.0", image_url: "https://img.scoop.it/CFj1vfXhPNfFR5rcuMCPFDl72eJkfbmt4t8yenImKBVvK0kTmF0xjctABnaLJIm9", description: "Cutting edge gaming PC", instock: true},
#   {name: "Future Computer", price: "300.0", image_url: "https://i.pinimg.com/236x/29/40/82/2940824dd4708b9dd2124c7ae9d76e26--gaming-computer-computer-case.jpg", description: "Great computer for your little brother", instock: true},
#   {name: "Glowing boxes", price: "75.0", image_url: "https://casabona.org/images/Screenshot_16-e1526650632430-1024x554.png", description: "Non-cubic glowing boxes", instock: true},
#   {name: "Air Compressor", price: "36.0", image_url: "https://images.lowes.com/product/converted/885911/885911559065lg.jpg", description: "Really good at blowing", instock: true},
#   {name: "Digital Tuner", price: "83.0", image_url: "https://cdn.shopify.com/s/files/1/1241/2144/products/METRONOME-TUNER-BK-1_2048x.jpg?v=1505864106", description: "For perfect pitch", instock: true},
#   {name: "Chrono-regulating desk unit", price: "63.0", image_url: "https://www.amara.com/static/uploads/images-2/products/x/huge/499693/charlie-bell-alarm-clock-radial-copper-109301.jpg", description: "Tells the time if you can read it", instock: true},
#   {name: "HD Case", price: "19.0", image_url: "https://images-na.ssl-images-amazon.com/images/I/71OasQsMIcL._SY355_.jpg", description: "Pouph Direct Case", instock: true},
#   {name: "Fish in a Can", price: "17.0", image_url: "www.fixme.jpeg", description: "Good for you and stray cats", instock: true},
#   {name: "Television", price: "50.0", image_url: "https://media.4rgos.it/i/Argos/6865603_R_Z001A?$Web$&$DefaultPDP570$", description: "It shows you the world", instock: true},
#   {name: "Mouse Trap", price: "5.0", image_url: "https://images-na.ssl-images-amazon.com/images/I/41N2S8b5ETL._SX425_.jpg", description: "Katches Mize", instock: true}
# ])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 5.times do 
#  supplier = Supplier.new(
#   name: FFaker::Company.name,
#   email: FFaker::Internet.email,
#   phone_number: FFaker::PhoneNumber.short_phone_number)
#   supplier.save
# end


# items = Product.all
# items.each do |item|
#   id = Supplier.all.sample.id
#   item.supplier_id = id
#   item.save
# end

# image1 = ImageUrl.new(url: "https://www.amara.com/static/uploads/images-2/products/x/huge/499693/charlie-bell-alarm-clock-radial-copper-109301.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://www.petflow.com/images/default/products/maximal/32298-9.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://media.4rgos.it/i/Argos/6865603_R_Z001A?$Web$&$DefaultPDP570$")
# image1.save
# image1 = ImageUrl.new(url:"http://www.thinkgeek.com/images/products/zoom/kspp_st_phaser.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://images-na.ssl-images-amazon.com/images/I/71OasQsMIcL._SY355_.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://images-na.ssl-images-amazon.com/images/I/41N2S8b5ETL._SX425_.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://img.scoop.it/CFj1vfXhPNfFR5rcuMCPFDl72eJkfbmt4t8yenImKBVvK0kTmF0xjctABnaLJIm9")
# image1.save

# image1 = ImageUrl.new(url: "https://i.pinimg.com/236x/29/40/82/2940824dd4708b9dd2124c7ae9d76e26--gaming-computer-computer-case.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://casabona.org/images/Screenshot_16-e1526650632430-1024x554.png")
# image1.save
# image1 = ImageUrl.new(url: "https://images.lowes.com/product/converted/885911/885911559065lg.jpg")
# image1.save
# image1 = ImageUrl.new(url: "https://cdn.shopify.com/s/files/1/1241/2144/products/METRONOME-TUNER-BK-1_2048x.jpg?v=1505864106")
# image1.save

images = ImageUrl.all
array =[]
products = Product.all
  products.each do |product|
    array << product.id
  end
  p array
i = 0
images.each do |image|
  image.product_id = array[i]
  i+=1
  image.save
end