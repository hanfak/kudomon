require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'
require './lib/geospace.rb'


space = Geospace.new
trainer_1 = Trainer.new("han", space)
trainer_2 = Trainer.new("arya", space)
kudomon_1 = Kudomon.new( "Sourbulb" , "grass", space )
kudomon_2 = Kudomon.new( "pikabu" , "grass", space )
kudomons = Kudomons.new
kudomons.add_kudomon kudomon_1
kudomons.add_kudomon kudomon_2
# empty_kudomons = Kudomons.new
p trainer_1
p trainer_2
puts
p kudomons
trainer_1.find_closest_kudomon(kudomons)
puts
p trainer_1.closest_kudomon
puts
trainer_1.capture_kudomon(kudomons)
p trainer_1.captured_kudomons
puts
p trainer_1
p trainer_2
puts
p kudomons
puts
trainer_2.find_closest_kudomon(kudomons)
puts
p trainer_2.closest_kudomon
puts
trainer_2.capture_kudomon(kudomons)
p trainer_2.captured_kudomons
puts
p trainer_1
p trainer_2
puts
p kudomons
trainer_1.find_closest_kudomon(kudomons)
puts
p trainer_1.closest_kudomon
puts
trainer_1.capture_kudomon(kudomons)
p trainer_1.captured_kudomons
puts
p trainer_1
p trainer_2
puts
p kudomons
trainer_1.find_closest_kudomon(kudomons)
 # trainer_1.find_closest_kudomon(empty_kudomons)
