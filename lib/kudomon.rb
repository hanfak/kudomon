class Kudomon
  attr_reader :species, :type, :position

  def initialize(species, type)
    @species  = species
    @type     = type
    @position = random_position
  end

  private
    def random_position
      [ Kernel.rand(1..10),  Kernel.rand(1..10)]
    end

end
