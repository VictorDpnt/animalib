
Booking.destroy_all
Animal.destroy_all
User.destroy_all

user1 = User.create!(email: "test@test.com", password: "azerty", first_name: "Victor", last_name: "Dupont", address: "16 villa gaudelet", phone_number: "0628073198")
user2 = User.create!(
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

animal1 = Animal.create!(name: "Happy", birthdate: "2024-03-01", specie: "dog", breed: "golden", user: user1)

Booking.create!(date: "2024-07-01", user: user2, animal: animal1, reason: "Castration des coucouilles")
Booking.create!(date: "2024-07-01", user: user2, animal: animal1, reason: "Problème gastrique")
