class Address
  def initialize(pref:, city: nil)
    @pref = pref
    @city = city
  end

  def pref
    @pref.presence
  end

  def city
    @city.presence
  end

  def to_s
    "#{@pref}#{@city}"
  end
end
