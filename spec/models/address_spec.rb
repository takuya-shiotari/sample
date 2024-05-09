RSpec.describe Address do
  describe '#pref' do
    it 'returns pref' do
      address = Address.new(pref: 'tokyo', city: 'setagaya')
      expect(address.pref).to eq 'tokyo'
    end
  end

  describe '#city' do
    it 'returns city' do
      address = Address.new(pref: 'tokyo', city: 'setagaya')
      expect(address.city).to eq 'setagaya'
    end
  end

  describe '#to_s' do
    it 'returns name value' do
      address = Address.new(pref: 'tokyo', city: 'setagaya')
      expect(address.to_s).to eq 'tokyosetagaya'
    end
  end
end
