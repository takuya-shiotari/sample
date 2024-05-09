class Address
  def initialize(name)
    @name = name
  end

  def name
    @name.presence
  end

  def to_s
    @name
  end
end
