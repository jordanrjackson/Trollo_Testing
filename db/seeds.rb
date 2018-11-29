User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "First_Name", last_name: "Last_Name")

priority = [1, 2, 3, 4, 5]

10.times do
  Board.create(
    name: Faker::Appliance.equipment,
    description: Faker::MichaelScott.quote,
    user_id: 1
  )
  10.times do 
    list = List.create(
      name: Faker::Movies::StarWars.call_sign,
      description: Faker::Movies::StarWars.quote,
      board_id: board.id
    )
    10.times do
      Task.create(
        name: Faker::TwinPeaks.location,
        description: Faker::TwinPeaks.quote,
        priority: priority.sample,
        list_id: list.id,
      )
    end
  end
end

puts "Data Seeded!"