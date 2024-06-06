require "faker"


Booking.destroy_all
Animal.destroy_all
User.destroy_all

user1 = User.create!(email: "test@test.com", password: "azerty", first_name: "Victor", last_name: "Dupont", address: "16 villa gaudelet", phone_number: "0628073198")
pro1 = User.create!(
  email: "pro@pro.com",
  password: "azerty",
  first_name: "Prunelle",
  last_name: "Leclerc",
  address: "16 villa Gaudelet, 75011 Paris, France",
  phone_number: "0675654776",
  profession: "veterinarian",
  company_name: "Cabinet Vétérinaire de Paris",
  description: "Le docteur Doolittle, vétérinaire vous reçoit au sein de son cabinet situé à Paris."
)


pro2 = User.create!(
  password: "azerty",
  first_name: "Dylan",
  last_name: "Moutachi",
  email: "pro2@pro.com",
  address: "21 rue Gardenat Lapostol, 92150 Suresnes, France",
  phone_number: "0675654776",
  profession: "pet-sitter",
  company_name: "My amazing Pet-Sitter",
  description: "Je promène vos chiens et chats !"
)


animal1 = Animal.create!(name: "Happy", birthdate: "2024-03-01", specie: "Dog", breed: "golden", user: user1)
animal2 = Animal.create!(name: "Kurama", birthdate: "2024-03-01", specie: "Cat", breed: "bengal", user: pro2)

Booking.create!(date: Time.parse("#{Date.tomorrow.to_s} 16:00"), user: pro1, animal: animal1, reason: "Castration des coucouilles")
Booking.create!(date: Time.parse("#{Date.tomorrow.to_s} 18:00"), user: pro2, animal: animal1, reason: "Problème gastrique")

professional_data_vet = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Paris').call
professional_data_vet.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'veterinarian'
  user.save!
  puts "User veterinarian n°#{index} created!!"
end


professional_data_groomer = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Paris').call
professional_data_groomer.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'groomer'
  user.save!
  puts "User groomer n°#{index} created!!"
end

professional_data_sitter = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Paris').call
professional_data_sitter.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'pet-sitter'
  user.save!
  puts "User pet-sitter n°#{index} created!!"
end

professional_data_vet_brdx = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'bordeaux').call
professional_data_vet_brdx.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'veterinarian'
  user.save!
  puts "User pet-sitter n°#{index} created!!"
end

professional_data_groomer_brdx = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'bordeaux').call
professional_data_groomer_brdx.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'groomer'
  user.save!
  puts "User groomer n°#{index} created!!"
end

professional_data_sitter_brdx = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'bordeaux').call
professional_data_sitter_brdx.each_with_index do |pro_datum, index|
  first_name = Faker::Name.first_name

  user = User.new(pro_datum)
  user.email = Faker::Internet.email(name: "#{first_name}#{index}", domain: 'gmail.com')
  user.first_name = first_name
  user.last_name = Faker::Name.last_name
  user.password = '123456'
  user.profession = 'pet-sitter'
  user.save!
  puts "User pet-sitter n°#{index} created!!"
end

# professional_data = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Paris').call
# professional_data.each_with_index do |pro_datum, index|
#   user = User.new(pro_datum)
#   user.email = "#{SecureRandom.hex}@mail.com"
#   user.first_name = Faker::Name.first_name
#   user.last_name = "Bobby"
#   user.password = '123456'
#   user.profession = 'veterinarian'
#   user.save!
#   puts "User veterinarian n°#{index} created!!"
# end

