class Geospace
  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize( max_size = DEFAULT_POSITION_RANGE)
    @max_size  = max_size
  end

  def random_position
    [Kernel.rand(1..@max_size[0]),
     Kernel.rand(1..@max_size[1])]
  end

  def find_distance(object_1, object_2)
    (object_1.position[0] - object_2.position[0]).abs ** 2 +
    (object_1.position[1] - object_2.position[1]).abs ** 2
  end
end
