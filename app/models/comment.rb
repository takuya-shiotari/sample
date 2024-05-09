class Comment
  def initialize(body)
    @body = body
  end

  attr_reader :body

  def ==(other)
    other.body == body
  end

  def to_s
    @body
  end
end
