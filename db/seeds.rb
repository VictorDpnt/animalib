
User.destroy_all
Animal.destroy_all

User.create!(email: "test@test.com", first_name: "victor", last_name: "dupont", address: "16 villa gaudelet", phone_number: "0628073198")
