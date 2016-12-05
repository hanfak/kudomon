class Kudomon
  attr_reader :species, :type, :position, :hunter, :health_points, :combat_points

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
    kudomon.reduce_health
  end

  def reduce_health
    @health_points -= @combat_points
  end
end
