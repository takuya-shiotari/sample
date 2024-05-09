class Comment
  def initialize(body)
    @body = body
  end

  attr_reader :body

  def to_s
    @body
  end
end
