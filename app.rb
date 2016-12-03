require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'

trainer = Trainer.new("han")
kudomon_1 = Kudomon.new( "Sourbulb" , "grass" )
kudomon_2 = Kudomon.new( "pikabu" , "grass" )
kudomons = Kudomons.new
kudomons.add_kudomon kudomon_1
kudomons.add_kudomon kudomon_2
empty_kudomons = Kudomons.new
p trainer
p kudomons
trainer.find_closest_kudomon(kudomons)
p trainer.closest_kudomon
trainer.capture_kudomon
p trainer.captured_kudomons

 trainer.find_closest_kudomon(empty_kudomons)
