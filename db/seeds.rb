specialities = [
  "Family Medicine",
  "Sports Medicine",
  "Plastic Surgery",
  "Emergency Medicine",
  "Dermatology"
]

weekdays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
]

10.times do
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: specialities.sample
  )
end
  
5.times do 
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password: "password"
  )

  Appointment.create(
    weekday: weekdays.sample,
    doctor_id: rand(10) + 1,
    user_id: user.id
  )
end

puts "Data Seeded."