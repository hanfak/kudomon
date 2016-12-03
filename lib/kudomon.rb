class Kudomon
  attr_reader :species, :type, :position

  def initialize(species, type, max_range)
    @species        = species
    @type           = type
    @position       = random_position(max_range)
  end

  private
    def random_position(max_range)
      [Kernel.rand(1..max_range[0]),
       Kernel.rand(1..max_range[1])]
    end
end
