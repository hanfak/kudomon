class Trainer
  attr_reader :name, :position

  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize(name, max_range = DEFAULT_POSITION_RANGE)
    @name   = name
    @position  = random_position(max_range)
  end

  private
    def random_position(max_range)
      [Kernel.rand(1..max_range[0]),
       Kernel.rand(1..max_range[1])]
    end
end
