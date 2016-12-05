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

  def initiate_capture(a_trainer, guess)
    raise 'No closest kudomon, find closest kudomon first' if a_trainer.closest_kudomon == nil
    raise 'Cannot initiate capture, it already has a hunter' unless a_trainer.closest_kudomon.hunter == nil
    if guess == Kernel.rand(1..5)
      a_trainer.closest_kudomon.stores_hunter(a_trainer)
    end
  end

  def capture(a_trainer)
    raise 'You have not initiated capture' if a_trainer.closest_kudomon.hunter == nil
    if a_trainer.closest_kudomon.hunter == a_trainer.name
      a_trainer.capture_kudomon
      get_kudomons.remove(a_trainer.closest_kudomon)
      a_trainer.remove
    else
      raise 'you are not the hunter of this kudomon'
    end
  end
end
