describe SupplierSerializer do
  subject { described_class.new(supplier) }
  let(:supplier) { build :supplier, name: :foo, external_id: 42 }

  describe 'Fields' do
    it 'has keys' do
      is_expected.to have_attributes(id: supplier.id, name: 'foo', external_id: 42)
    end
  end
end
