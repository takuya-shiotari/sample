RSpec.describe Post do
  describe '#valid?' do
    it 'validates models' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.valid?).to be true
    end
  end

  describe '#title_length' do
    it 'returns the length of the title' do
      post = Post.new(title: 'title', body: 'body')
      expect(post.title_length).to be 5
    end
  end
end
