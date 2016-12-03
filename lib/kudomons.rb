class Kudomons
  attr_reader :available_kudomons

  def initialize
    @available_kudomons = []
  end

  def add_kudomon(a_kudomon)
    @available_kudomons << a_kudomon
  end

  def remove(a_kudomon)
    @available_kudomons.delete a_kudomon
  end
end
