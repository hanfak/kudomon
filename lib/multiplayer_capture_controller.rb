class MultiplayerCaptureController
  attr_reader :get_kudomons, :get_trainers

  def initialize(kudomons, *trainer)
    @get_kudomons = kudomons
    @get_trainers = trainer
  end

  def spot_kudomon(a_trainer)
    check_trainer_part_of_game(a_trainer)
    a_trainer.find_closest_kudomon(get_kudomons)
  end

  def initiate_capture(a_trainer, guess)
    check_kudomon_spotted(a_trainer)
    check_kudomon_has_no_hunter(a_trainer)
    attempt_capture_of_kudomon(a_trainer, guess)
  end

  def capture(a_trainer)
    check_kudomon_has_hunter(a_trainer)
    if is_hunter_same_as_capturer?(a_trainer)
      implement_capturing_kudomon(a_trainer)
    else
      raise 'you are not the hunter of this kudomon'
    end
  end

  private
    def check_trainer_part_of_game(a_trainer)
      raise 'Trainer not part of game, add trainer to game' unless get_trainers.include? a_trainer
    end

    def check_kudomon_spotted(a_trainer)
      raise 'No closest kudomon, find closest kudomon first' if a_trainer.closest_kudomon == nil
    end

    def check_kudomon_has_no_hunter(a_trainer)
      raise 'Cannot initiate capture, it already has a hunter' unless a_trainer.closest_kudomon.hunter == nil
    end

    def attempt_capture_of_kudomon(a_trainer, guess)
      if guess == Kernel.rand(1..5)
        a_trainer.closest_kudomon.stores_hunter(a_trainer)
      end
    end

    def check_kudomon_has_hunter(a_trainer)
      raise 'You have not initiated capture' if a_trainer.closest_kudomon.hunter == nil
    end

    def is_hunter_same_as_capturer?(a_trainer)
      a_trainer.closest_kudomon.hunter == a_trainer.name
    end

    def implement_capturing_kudomon(a_trainer)
      a_trainer.capture_kudomon
      get_kudomons.remove(a_trainer.closest_kudomon)
      a_trainer.remove
    end
end
