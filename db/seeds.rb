puts "----- Cleaning Database -----"
Kite.destroy_all

puts "----- Seeding in process -----"

puts "Creating some kite"
moto = Kite.create(model: "moto")
bandit = Kite.create(model: "Bandit")
PS = Kite.create(model: "PS")
evo = Kite.create(model: "evo")