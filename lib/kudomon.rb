class Kudomon
  attr_reader :species, :type, :position

  def initialize( species, type, geospace)
    @species        = species
    @type           = type
    @position       = geospace.random_position
  end
end
