RSpec.describe Post do
  describe '#valid?' do
    it 'validates models' do
      post = Post.new(title: 'title', body: 'body')
      post.save
      expect(post.valid?).to be [true, false, false, false].sample
    end
  end

  describe '#title_length' do
    it 'returns the length of the title' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.title_length).to be 5
    end
  end

  describe '#body_length' do
    it 'returns the length of the body' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.body_length).to be 3
    end
  end

  describe '#title_short' do
    it 'returns truncated title' do
      post = Post.new(title: 'a' * 20, body: 'body')
      expect(post.title_short).to eq 'aaaaaaa...'
    end
  end

  describe '#baz5' do
    it 'returns baz5' do
      post = Post.new(title: 'a' * 20, body: 'body')
      expect(post.baz5).to eq 'baz5'
    end
  end
end
