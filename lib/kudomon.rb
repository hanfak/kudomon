class Kudomon
  attr_reader :species, :type, :position, :hunter, :health_points, :combat_points

  STRENGTH_WEAKNESS = {water: [:fire, :psychic],
                      fire: [:grass, :psychic],
                      grass: [:rock, :psychic],
                      rock: [:electric, :psychic],
                      electric: [:water, :psychic]}
  BONUS_HIT = 2
  NORMAL_HIT = 1

  def initialize(species, type, geospace, health_points, combat_points)
    @species        = species
    @type           = type
    @position       = geospace.random_position
    @health_points  = health_points
    @combat_points  = combat_points
  end

  def stores_hunter(a_trainer)
    @hunter = a_trainer.name
  end

  def attack(kudomon)
    power_up = STRENGTH_WEAKNESS[type].include?(kudomon.type) ? BONUS_HIT : NORMAL_HIT
    kudomon.reduce_health(power_up)
  end

  def reduce_health(power_up)
    @health_points -= @combat_points * power_up
  end
end
