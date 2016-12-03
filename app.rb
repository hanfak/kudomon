require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'
require './lib/geospace.rb'


space = Geospace.new
trainer = Trainer.new("han", space)
kudomon_1 = Kudomon.new( "Sourbulb" , "grass", space )
kudomon_2 = Kudomon.new( "pikabu" , "grass", space )
kudomons = Kudomons.new
kudomons.add_kudomon kudomon_1
kudomons.add_kudomon kudomon_2
empty_kudomons = Kudomons.new
p trainer
p kudomons
trainer.find_closest_kudomon(kudomons)
puts
p trainer.closest_kudomon
puts
trainer.capture_kudomon
p trainer.captured_kudomons
puts
p space.positions_occupied

 trainer.find_closest_kudomon(empty_kudomons)
