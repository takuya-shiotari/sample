class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def title_length
    title&.length
  end

  def body_length
    body&.length
  end

  def title_short
    title&.truncate(10)
  end

  def title_with_default
    title.presence || 'No title'
  end
end
