class Kudomon
  attr_reader :species, :type, :position
  
  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize( species,
                  type,
                  max_range = DEFAULT_POSITION_RANGE)
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
