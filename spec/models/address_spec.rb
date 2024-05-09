RSpec.describe Address do
  describe '#name' do
    it 'returns name' do
      address = Address.new('tokyo')
      expect(address.name).to eq 'tokyo'
    end
  end

  describe '#to_s' do
    it 'returns name value' do
      address = Address.new('tokyo')
      expect(address.to_s).to eq 'tokyo'
    end
  end
end
