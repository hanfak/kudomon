class BattleController
  attr_reader :trainers, :trainer_1_kudomon, :trainer_2_kudomon
  def initialize(trainer_1, trainer_2)
    @trainers = [trainer_1, trainer_2]
  end

  def pick_kudomons
    @trainer_1_kudomon = pick_kudomon(trainers[0])
    @trainer_2_kudomon = pick_kudomon(trainers[1])
  end

  def choose_order
    pick_first_attacker == 0 ? [trainer_1_kudomon , trainer_2_kudomon] : [trainer_2_kudomon , trainer_1_kudomon]
  end

  def fight
    kudomon_to_fight = choose_order
    kudomon_to_fight[0].attack(kudomon_to_fight[1])
    return winner_message(1, kudomon_to_fight) if kudomon_to_fight[1].health_points <= 0
    kudomon_to_fight[1].attack(kudomon_to_fight[0])
    return winner_message(0, kudomon_to_fight) if kudomon_to_fight[0].health_points <= 0
  end

  private
    def pick_kudomon(trainer)
      trainer.captured_kudomons[Kernel.rand(trainer.captured_kudomons.size - 1)]
    end

    def pick_first_attacker
      Kernel.rand(0..1)
    end

    def winner_message(winner, kudomon_to_fight)
      loser = {1 => 0, 0 => 1}
      "#{kudomon_to_fight[loser[winner]].hunter} won with #{kudomon_to_fight[loser[winner]].species}"
    end
end
