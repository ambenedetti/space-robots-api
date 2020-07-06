require 'faker'

puts "creating robots..."

10.times do
  Robot.create({
    robot_type: ["hackerobot", "protectobot", "tacticrobot", "securobot", "attackrobot", "cleanerbot"].sample,
    name: Faker::Name.first_name,
    serial_number: "R" + rand(6 ** 6).to_s
  })
end

puts "creating weapons..."

20.times do
  Weapon.create({
    weapon_type: ["laser", "code", "acid", "map", "grenade", "ray"].sample,
    robot_id: rand(1..10),
    serial_number: "W" + rand(6 ** 6).to_s
  })
end

puts "creating armors..."
20.times do
  Armor.create({
    armor_type: ["shield", "magentic field", "water shield", "invisible field", "smoke bomb"].sample,
    robot_id: rand(1..10),
    serial_number: "A" + rand(6 ** 6).to_s
  })
end
