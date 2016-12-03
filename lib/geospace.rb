class Geospace
  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize( max_range = DEFAULT_POSITION_RANGE)
    @max_range  = max_range
  end

  def random_position
    [Kernel.rand(1..@max_range[0]),
     Kernel.rand(1..@max_range[1])]
  end

end
