class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def title_length
    title&.length
  end

  def body_length
    body&.length
  end
end
