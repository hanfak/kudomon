class Trainer
  attr_reader :name, :closest_kudomon, :captured_kudomons, :position

  def initialize(name, geospace)
    @name   = name
    @geospace = geospace
    @captured_kudomons = []
    @position = geospace.random_position
  end

  def find_closest_kudomon(kudomons)
    check_availabe_kudomons(kudomons)
    @closest_kudomon = select_kudomon(kudomons)
  end

  def capture_kudomon(kudomons)
    @captured_kudomons << closest_kudomon
    kudomons.remove(closest_kudomon)
  end

  private
    def select_kudomon(kudomons)
      kudomons.available_kudomons.min_by do
        |kudomon|
        @geospace.find_distance(self, kudomon)
      end
    end

    def check_availabe_kudomons(kudomons)
        raise 'No more kudomons available here' if kudomons.available_kudomons.empty?
    end
end
