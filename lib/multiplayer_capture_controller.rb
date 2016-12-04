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

  def initiate_capture(a_trainer)
    raise 'No closest kudomon, find closest kudomon first' if a_trainer.closest_kudomon == nil
    # if closest_kudomon has hunter raise err
    a_trainer.closest_kudomon.stores_hunter(a_trainer)
  end
end
