# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.delete_all
#
# User.create(email: "miriam@codaisseurbnb.com", password: "secret")
# User.create(email: "ben@codaisseurbnb.com", password: "secret")

Photo.delete_all
Theme.delete_all
Room.delete_all
User.delete_all

modern_and_minimal = Theme.create(name: "Modern and Minimal")
sleek_and_sophisticated = Theme.create(name: "Sleek and Sophisticated")
warm_and_cozy = Theme.create(name: "Warm and Cozy")
room_with_a_view = Theme.create(name: "Room with a View")
elegant_and_ornate = Theme.create(name: "Elegant and Ornate")
a_mans_touch = Theme.create(name: "A Man's Touch")
white_washed = Theme.create(name: "White Washed")
tempting_terrace = Theme.create(name: "Tempting Terrace")

miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")
matt = User.create(email: "matt@codaisseurbnb.com", password: "abcd1234")

# Photos
photo1 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359497/gevel_hondop.jpg")
photo2 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359496/een_a7v6yf.jpg")
photo3 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359498/woonkamer_mlylmt.jpg")

photo4 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359498/woon-en-eetkamer_aw16ii.jpg")
photo5 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359497/keuken_n38thf.jpg")
photo6 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359497/terras_vrgviu.jpg")

photo7 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359497/eetplaats_wo4wam.jpg")
photo8 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476359966/slaapkamer-1_jhvitg.jpg")
photo9 = Photo.create(remote_image_url: "http://res.cloudinary.com/ddpouudhk/image/upload/v1476360023/badkamer_vxadky.jpg")



Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "You will never forget your stay!", description: "Normcore meh put a bird on it man braid mumblecore, locavore synth swag kogi helvetica ugh health goth twee raw denim readymade.", address: "Colon 58, 1B, 11100 Cadiz (Spain)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: miriam, themes: [modern_and_minimal, sleek_and_sophisticated], photos: [photo1, photo2, photo3])

Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "A place in the middle of Holland", description: "Freegan yuccie everyday carry tote bag you probably haven't heard of them godard.", address: "Daguerrestraat 23, 1054TG Utrecht (Netherlands)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: wouter, themes: [warm_and_cozy, a_mans_touch], photos: [photo4, photo5, photo6])

Room.create(home_type: "House", room_type: "Shared", accommodate: 2, bedroom_count: 2, bathroom_count: 3, listing_name: "Great for a Weekend", description: "Meditation tattooed lumbersexual street art truffaut pour-over, kale chips pitchfork. Readymade snackwave man bun, photo booth tilde wolf occupy fashion axe VHS authentic PBR&B typewriter. Vape everyday carry meditation try-hard hammock unicorn.", address: "Tottenham Court Road 14, W1T 1JY London (UK)", has_tv: false, has_kitchen: true, has_airco: false, has_heating: false, has_internet: true, price: 100, active: true, user: matt, themes: [elegant_and_ornate, white_washed], photos: [photo7, photo8, photo9])
