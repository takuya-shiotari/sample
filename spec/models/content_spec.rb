RSpec.describe Content do
  describe '#body' do
    it 'returns body value' do
      content = Content.new(title: 'title', body: 'body')
      expect(content.body).to eq 'body'
    end
  end
end
