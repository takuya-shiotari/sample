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

  def foo
    'foo'
  end

  def fuga
    'fuga'
  end

  def hoge
    'bar'
  end

  def bar
    'bar'
  end

  def baz
    'baz'
  end

  def baz2
    'baz2'
  end

  def baz3
    'baz3'
  end

  def baz4
    'baz4'
  end

  def baz5
    'baz5'
  end
end
