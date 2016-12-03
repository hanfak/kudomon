class Kudomon
  attr_reader :species, :type

  def initialize( species, type, geospace)
    @species        = species
    @type           = type
    @geospace       = geospace
  end

  def position
    @geospace.random_position
  end
end
