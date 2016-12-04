class Kudomon
  attr_reader :species, :type, :position,:hunter

  def initialize(species, type, geospace)
    @species        = species
    @type           = type
    @position       = geospace.random_position
  end

  def stores_hunter(a_trainer)
    @hunter = a_trainer.name
  end
end
