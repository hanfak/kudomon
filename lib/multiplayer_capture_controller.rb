class MultiplayerCaptureController
  attr_reader :get_kudomons, :get_trainers

  def initialize(kudomons, *trainer)
    @get_kudomons = kudomons
    @get_trainers = trainer
  end

  def spot_kudomon(a_trainer)
    raise 'Trainer not part of game, add trainer to game' unless get_trainers.include? a_trainer 
    a_trainer.find_closest_kudomon(get_kudomons)
  end
end
