class Trainer
  attr_reader :name, :closest_kudomon, :captured_kudomons

  def initialize(name, geospace)
    @name   = name
    @geospace = geospace
    @captured_kudomons = []
  end

  def position
    @geospace.random_position
  end

  def find_distance(kudomon)
    (position[0] - kudomon.position[0]).abs ** 2 +
    (position[1] - kudomon.position[1]).abs ** 2
  end

  def find_closest_kudomon(kudomons)
    raise 'No more kudomons available here' if kudomons.available_kudomons.empty?
    @closest_kudomon = kudomons.available_kudomons.inject do |closests, kudomon|
      find_distance(kudomon) < find_distance(closests) ? kudomon : closests
    end
  end

  def capture_kudomon
    @captured_kudomons << closest_kudomon
  end
end
