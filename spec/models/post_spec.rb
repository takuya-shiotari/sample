RSpec.describe Post do
  describe '#valid?' do
    it 'validates models' do
      post = Post.new(title: 'title', body: 'body')
      post.save
      expect(post.valid?).to be true
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
      expect(post.body_length).to be 4
    end
  end

  describe '#title_short' do
    it 'returns truncated title' do
      post = Post.new(title: 'a' * 20, body: 'body')
      expect(post.title_short).to eq 'aaaaaaa...'
    end
  end
end
