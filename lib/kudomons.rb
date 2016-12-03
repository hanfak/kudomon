class Kudomons
  attr_reader :avialable_kudomons

  def initialize
    @avialable_kudomons = []
  end

  def add_kudomon(a_kudomon)
    @avialable_kudomons << a_kudomon
  end
end
