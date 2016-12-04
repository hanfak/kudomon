class BattleController
  attr_reader :trainers, :trainer_1_kudomon, :trainer_2_kudomon 
  def initialize(trainer_1, trainer_2)
    @trainers = [trainer_1, trainer_2]
  end

  def pick_kudomons
    @trainer_1_kudomon = pick_kudomon(trainers[0])
    @trainer_2_kudomon = pick_kudomon(trainers[1])
  end

  private
    def pick_kudomon(trainer)
      trainer.captured_kudomons[Kernel.rand(trainer.captured_kudomons.size - 1)]
    end
end
