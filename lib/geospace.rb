class Geospace
  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize( max_size = DEFAULT_POSITION_RANGE)
    @max_size  = max_size
  end

  def random_position
    [Kernel.rand(1..@max_size[0]),
     Kernel.rand(1..@max_size[1])]
  end
end
