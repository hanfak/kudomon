class Geospace
  attr_reader :taken_positions
  DEFAULT_POSITION_RANGE = [10, 10]

  def initialize( max_size = DEFAULT_POSITION_RANGE)
    @max_size  = max_size
    @taken_positions = []
  end

  def random_position
    store(create_random_coordinates)
  end

  def find_distance(object_1, object_2)
    (object_1.position[0] - object_2.position[0]).abs ** 2 +
    (object_1.position[1] - object_2.position[1]).abs ** 2
  end

  private
    def create_random_coordinates
      [Kernel.rand(1..@max_size[0]),
       Kernel.rand(1..@max_size[1])]
    end

    def store(position)
      if @taken_positions.include?(position)
        new_position = create_random_coordinates
        @taken_positions << new_position
        new_position
      else
        @taken_positions << position
        position
      end
    end
end
