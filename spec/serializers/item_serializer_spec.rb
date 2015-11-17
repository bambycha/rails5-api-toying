describe ItemSerializer do
  subject { described_class.new(item) }
  let(:item) { build :item, sku_id: 42, price: 32.5 }

  describe 'Fields' do
    it 'has keys' do
      is_expected.to have_attributes(id: item.id, sku_id: 42, price: 32.5)
    end
  end
end
