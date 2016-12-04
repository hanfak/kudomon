require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'
require './lib/geospace.rb'
require './lib/multiplayer_capture_controller.rb'


space = Geospace.new
trainer_1 = Trainer.new("han", space)
trainer_2 = Trainer.new("arya", space)
trainer_3 = Trainer.new("ting", space)
kudomon_1 = Kudomon.new( "Sourbulb" , "grass", space )
kudomon_2 = Kudomon.new( "pikabu" , "grass", space )
kudomons = Kudomons.new
kudomons.add_kudomon kudomon_1
kudomons.add_kudomon kudomon_2
ctrl = MultiplayerCaptureController.new(kudomons, trainer_1, trainer_2)
p trainer_1
# p trainer_2.closest_kudomon
puts
p ctrl.spot_kudomon(trainer_1)
# p ctrl.spot_kudomon(trainer_3)
p ctrl.initiate_capture(trainer_1)
puts
puts
p kudomons.available_kudomons[0]
puts
p kudomons.available_kudomons[1]
