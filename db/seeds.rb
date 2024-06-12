require "faker"

puts "Cleaning database..."

Favorite.destroy_all

Review.destroy_all
Booking.destroy_all
Animal.destroy_all
User.destroy_all


puts "Creating tests..."
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

vet_descriptions = [
  "Specialist in small animal care with over 10 years of experience.",
  "Equine veterinarian passionate about providing preventive and emergency care.",
  "Practicing in rural areas, focusing mainly on farm animals.",
  "Expert in veterinary dermatology helping animals with skin issues.",
  "Behaviorist working with dogs and cats to solve behavioral problems.",
  "Veterinarian with a focus on emergency medicine for critical situations.",
  "Specialist in animal nutrition, helping owners create balanced diets.",
  "Renowned veterinary surgeon performing complex operations.",
  "Avian veterinarian dedicated to the care of birds, including parrots and raptors.",
  "Veterinary dentist specializing in the oral health of pets.",
  "Exotic animal veterinarian treating reptiles, amphibians, and small mammals.",
  "Veterinary ophthalmologist addressing eye problems in pets.",
  "Oncologist treating animals with cancer, specializing in radiation therapy.",
  "Cardiology specialist managing heart conditions in dogs and cats.",
  "Marine animal veterinarian working with dolphins, seals, and other aquatic creatures.",
  "Veterinary anesthetist ensuring safe and painless surgical procedures.",
  "Internal medicine specialist diagnosing and treating complex diseases.",
  "Zoo veterinarian caring for animals in zoological parks.",
  "Exotic pet specialist treating animals like ferrets, guinea pigs, and hedgehogs.",
  "Reproductive specialist managing breeding programs for pets and farm animals.",
  "Wildlife veterinarian focusing on the health of wild animal populations.",
  "Veterinarian with a specialty in orthopedic surgery for pets.",
  "Veterinary radiologist using imaging techniques for diagnosis.",
  "Veterinary pathologist studying diseases in animals through lab tests.",
  "Veterinarian with a focus on geriatric animal care.",
  "Veterinary toxicologist specializing in animal poisoning cases.",
  "Veterinarian with expertise in animal behavior modification.",
  "Veterinary epidemiologist studying disease patterns in animal populations.",
  "Veterinary pharmacologist focusing on medications for animals.",
  "Specialist in feline medicine, dedicated to the care of cats.",
  "Veterinary acupuncturist providing alternative pain relief methods.",
  "Veterinary chiropractor helping animals with musculoskeletal issues.",
  "Specialist in avian and exotic animal surgery.",
  "Veterinary neurologist treating nervous system disorders in pets.",
  "Veterinary geneticist working on hereditary disease prevention.",
  "Veterinarian with a focus on pet rehabilitation and physical therapy.",
  "Veterinary nutritionist developing special diets for pets with health issues.",
  "Veterinary surgeon specializing in minimally invasive procedures.",
  "Veterinarian dedicated to shelter medicine and the care of homeless animals.",
  "Specialist in animal hospice and palliative care.",
  "Veterinarian with a focus on holistic and integrative medicine.",
  "Veterinary dental surgeon performing advanced oral surgeries.",
  "Veterinary oncologist researching new cancer treatments.",
  "Veterinarian with expertise in avian medicine and surgery.",
  "Specialist in exotic animal medicine, treating pets like reptiles and birds.",
  "Veterinarian focusing on preventive care and wellness programs.",
  "Veterinary behaviorist providing training and behavior modification.",
  "Veterinary cardiologist performing heart surgeries and treatments.",
  "Veterinarian with a specialty in small mammal care.",
  "Veterinary orthopedic surgeon treating bone and joint issues."
]

pet_sitter_descriptions = [
  "Experienced pet-sitter specializing in dog walking and in-home care.",
  "Reliable pet-sitter offering daily visits and overnight stays.",
  "Pet-sitter with a focus on caring for elderly pets with special needs.",
  "Enthusiastic pet-sitter providing playtime and exercise for active pets.",
  "Pet-sitter skilled in administering medications and special diets.",
  "Professional pet-sitter offering customized care plans for all types of pets.",
  "Pet-sitter with experience in caring for exotic animals like reptiles and birds.",
  "Caring pet-sitter providing comfort and companionship while you're away.",
  "Pet-sitter offering services for multi-pet households, including dogs, cats, and small animals.",
  "Reliable pet-sitter with a flexible schedule to accommodate your needs.",
  "Pet-sitter with a background in animal behavior and training.",
  "Experienced pet-sitter specializing in puppy care and training reinforcement.",
  "Pet-sitter offering house-sitting services to maintain home security.",
  "Loving pet-sitter providing stress-free care in the pet's own home.",
  "Pet-sitter with a focus on providing mental stimulation and enrichment activities.",
  "Trusted pet-sitter available for last-minute bookings and emergency care.",
  "Pet-sitter with extensive experience in caring for pets with anxiety or special needs.",
  "Friendly pet-sitter offering daily walks, feeding, and companionship.",
  "Pet-sitter with a passion for caring for rescue animals and those with behavioral issues.",
  "Dedicated pet-sitter providing updates and photos during each visit.",
  "Pet-sitter offering additional services such as mail collection and plant watering.",
  "Reliable pet-sitter with excellent references from satisfied clients.",
  "Pet-sitter specializing in caring for small pets like rabbits, guinea pigs, and hamsters.",
  "Experienced pet-sitter comfortable with administering injections and other medical treatments.",
  "Pet-sitter offering personalized care tailored to each pet's unique needs.",
  "Caring pet-sitter providing home boarding services for dogs and cats.",
  "Pet-sitter with a focus on maintaining pets' regular routines and schedules.",
  "Professional pet-sitter experienced in caring for high-energy breeds.",
  "Pet-sitter with a calm demeanor, ideal for pets with nervous or anxious dispositions.",
  "Reliable pet-sitter available for weekend and holiday care.",
  "Experienced pet-sitter providing grooming services in addition to regular care.",
  "Pet-sitter with a background in veterinary assistance and first aid training.",
  "Loving pet-sitter specializing in care for kittens and puppies.",
  "Pet-sitter offering transportation services for vet visits and grooming appointments.",
  "Pet-sitter with experience in caring for farm animals and livestock.",
  "Reliable pet-sitter providing long-term care for extended trips.",
  "Pet-sitter focused on providing a safe and nurturing environment for all pets.",
  "Experienced pet-sitter with a passion for animal welfare and rescue work.",
  "Professional pet-sitter offering playdates and socialization opportunities.",
  "Caring pet-sitter with experience in handling pets with dietary restrictions.",
  "Pet-sitter with a flexible approach to meet the unique needs of each pet.",
  "Trusted pet-sitter offering daily text and photo updates to pet owners.",
  "Pet-sitter with a knack for making shy and timid pets feel comfortable.",
  "Reliable pet-sitter experienced in caring for pets with mobility issues.",
  "Experienced pet-sitter providing overnight stays to ensure pets feel secure.",
  "Loving pet-sitter with a focus on providing lots of attention and affection.",
  "Pet-sitter offering additional services such as light housekeeping.",
  "Pet-sitter with excellent reviews and repeat clients.",
  "Friendly pet-sitter specializing in high-need and high-maintenance pets.",
  "Dedicated pet-sitter providing a fun and engaging experience for all pets."
]

groomer_descriptions = [
  "Experienced groomer specializing in breed-specific cuts and styles.",
  "Professional pet groomer offering a full range of grooming services.",
  "Groomer with a gentle touch, perfect for nervous or anxious pets.",
  "Pet groomer skilled in handling senior pets and those with special needs.",
  "Groomer providing mobile services for convenient in-home grooming.",
  "Certified groomer with expertise in handling double-coated breeds.",
  "Groomer offering spa treatments, including baths, brushing, and nail trimming.",
  "Experienced groomer specializing in hand stripping and scissoring techniques.",
  "Groomer with a focus on hypoallergenic grooming products and techniques.",
  "Pet groomer offering de-shedding treatments and coat conditioning.",
  "Professional groomer with a background in veterinary assistance.",
  "Groomer specializing in creative grooming and pet styling.",
  "Groomer with experience in handling cats and small animals.",
  "Groomer offering express services for quick and efficient grooming.",
  "Pet groomer skilled in handling large and giant breeds.",
  "Groomer with a calm and patient approach for first-time grooming clients.",
  "Certified groomer providing safe and stress-free grooming experiences.",
  "Groomer with expertise in flea and tick treatments and prevention.",
  "Professional groomer offering teeth cleaning and ear cleaning services.",
  "Experienced groomer with a passion for animal welfare and care.",
  "Groomer specializing in puppy grooming and introduction to grooming services.",
  "Pet groomer offering specialty services like nail painting and fur dyeing.",
  "Groomer with a focus on maintaining healthy skin and coat conditions.",
  "Groomer providing individualized attention and personalized grooming plans.",
  "Groomer experienced in handling pets with behavioral issues during grooming.",
  "Groomer offering additional services like paw pad treatments and cologne.",
  "Professional groomer with excellent client reviews and testimonials.",
  "Groomer specializing in seasonal grooming to manage shedding and coat changes.",
  "Groomer with a gentle approach for handling rescued and adopted pets.",
  "Certified groomer using eco-friendly and natural grooming products.",
  "Experienced groomer providing thorough de-matting and tangle removal services.",
  "Groomer with a focus on holistic grooming practices and pet wellness.",
  "Groomer offering convenient appointment scheduling and flexible hours.",
  "Pet groomer skilled in handling pets with allergies and sensitive skin.",
  "Groomer providing a clean and sanitized grooming environment.",
  "Groomer experienced in handling exotic pets and unusual breeds.",
  "Groomer specializing in show grooming and preparation for competitions.",
  "Professional groomer offering hydrotherapy baths and therapeutic massages.",
  "Groomer with a focus on creating a positive and enjoyable grooming experience.",
  "Groomer offering pickup and drop-off services for busy pet owners.",
  "Experienced groomer skilled in handling multiple pets in one session.",
  "Groomer with a passion for making pets look and feel their best.",
  "Certified groomer providing expert advice on pet coat care and maintenance.",
  "Groomer offering customized grooming packages to meet individual pet needs.",
  "Professional groomer with a track record of satisfied and repeat clients.",
  "Groomer specializing in grooming pets with special medical conditions.",
  "Groomer with a focus on maintaining a stress-free grooming environment.",
  "Experienced groomer skilled in handling difficult and aggressive pets.",
  "Groomer providing luxury grooming services, including facials and pawdicures.",
  "Groomer offering workshops and training for pet owners on home grooming."
]

#--> Creating professionals from Paris

professional_data_vet = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Paris').call

puts "Creating vets from Paris..."
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

puts "Creating groomers from Paris..."
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

puts "Creating pet-sitters from Paris..."
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

#--> Creating professionals from Lyon

puts "Creating vets from Lyon..."
professional_data_vet_lyon = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Lyon').call
professional_data_vet_lyon.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Lyon..."
professional_data_groomer_lyon = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Lyon').call
professional_data_groomer_lyon.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Lyon..."
professional_data_sitter_lyon = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Lyon').call
professional_data_sitter_lyon.each_with_index do |pro_datum, index|
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

#--> Creating professionals from Rennes

puts "Creating vets from Rennes..."
professional_data_vet_rennes = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Rennes').call
professional_data_vet_rennes.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Rennes..."
professional_data_groomer_rennes = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Rennes').call
professional_data_groomer_rennes.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Rennes..."
professional_data_sitter_rennes = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Rennes').call
professional_data_sitter_rennes.each_with_index do |pro_datum, index|
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

#--> Creating professionals from Bordeaux

puts "Creating vets from Bordeaux..."
professional_data_vet_bordeaux = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Bordeaux').call
professional_data_vet_bordeaux.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Bordeaux..."
professional_data_groomer_bordeaux = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Bordeaux').call
professional_data_groomer_bordeaux.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Bordeaux..."
professional_data_sitter_bordeaux = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Bordeaux').call
professional_data_sitter_bordeaux.each_with_index do |pro_datum, index|
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

#--> Creating professionals from Marseille

puts "Creating vets from Marseille..."
professional_data_vet_marseille = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Marseille').call
professional_data_vet_marseille.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Marseille..."
professional_data_groomer_marseille = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Marseille').call
professional_data_groomer_marseille.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Marseille..."
professional_data_sitter_marseille = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Marseille').call
professional_data_sitter_marseille.each_with_index do |pro_datum, index|
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

#--> Creating professionals from Lille

puts "Creating vets from Lille..."
professional_data_vet_lille = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Lille').call
professional_data_vet_lille.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Lille..."
professional_data_groomer_lille = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Lille').call
professional_data_groomer_lille.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Lille..."
professional_data_sitter_lille = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Lille').call
professional_data_sitter_lille.each_with_index do |pro_datum, index|
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

#--> Creating professionals from Strasbourg

puts "Creating vets from Strasbourg..."
professional_data_vet_strasbourg = GetProfessionalFromYelp.new(profession_name: 'veterinarian', location: 'Strasbourg').call
professional_data_vet_strasbourg.each_with_index do |pro_datum, index|
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

puts "Creating groomers from Strasbourg..."
professional_data_groomer_strasbourg = GetProfessionalFromYelp.new(profession_name: 'groomer', location: 'Strasbourg').call
professional_data_groomer_strasbourg.each_with_index do |pro_datum, index|
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

puts "Creating pet-sitters from Strasbourg..."
professional_data_sitter_strasbourg = GetProfessionalFromYelp.new(profession_name: 'pet sitting', location: 'Strasbourg').call
professional_data_sitter_strasbourg.each_with_index do |pro_datum, index|
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

#--> Descriptions

puts "Add description to each vet..."
vet_users = User.where(profession: "veterinarian")

vet_users.each_with_index do |user, index|
  user[:description] = vet_descriptions[index]
  user.save!
end

puts "Add description to each groomer..."
groomer_users = User.where(profession: "groomer")

groomer_users.each_with_index do |user, index|
  user[:description] = groomer_descriptions[index]
  user.save!
end

puts "Add description to each pet-sitter..."
pet_sitter_users = User.where(profession: "pet-sitter")

pet_sitter_users.each_with_index do |user, index|
  user[:description] = pet_sitter_descriptions[index]
  user.save!
end

#-------------------------------------------------------------------------------

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
