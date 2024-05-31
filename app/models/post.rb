class Post < ApplicationRecord
  include Elasticsearch::Model

  index_name "posts_#{Rails.env}#{ENV.fetch('TEST_ENV_NUMBER', nil)}"

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

  def title_with_body
    "#{title} - #{body}"
  end

  def title_with_default
    title.presence || 'No title'
  end

  def sub_title
  'sub_title'
  end

  def foo
    'foo'
  end

  def fuga
    'fuga'
  end
end
