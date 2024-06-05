
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
  email: "pro2@pro.com",
  password: "azerty",
  first_name: "Dylan",
  last_name: "Moutachi",
  address: "21 rue Gardenat Lapostol, 92150 Suresnes, France",
  phone_number: "0675654776",
  profession: "pet-sitter",
  company_name: "My amazing Pet-Sitter",
  description: "Je promène vos chiens et chats !"
)

animal1 = Animal.create!(name: "Happy", birthdate: "2024-03-01", specie: "Dog", breed: "golden", user: user1)

Booking.create!(date: "2024-07-01", user: pro1, animal: animal1, reason: "Castration des coucouilles")
Booking.create!(date: "2024-07-01", user: pro2, animal: animal1, reason: "Problème gastrique")
