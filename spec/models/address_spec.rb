RSpec.describe Address do
  describe '#to_s' do
    it 'returns name value' do
      address = Address.new('tokyo')
      expect(address.to_s).to eq 'tokyo'
    end
  end
end
