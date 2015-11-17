describe CsvFileImport do
  context 'when type of file is csv' do
    context 'with Suppliers entities' do
      let(:file) { 'spec/fixtures/suppliers.csv' }
      let(:parser) { Csv::SupplierParser }
      let(:supplier) { Supplier.forty_two }

      it 'stores Suppliers into DB' do
        described_class.new(file).perform do |f|
          parser.new(f).perform
        end

        expect(Supplier.count).to eq 1000

        expect(supplier.name).to eq 'Supplier 42'
        expect(supplier.external_id).to eq 42
      end
    end

    context 'with Item entities' do
      let(:file) { 'spec/fixtures/items.csv' }
      let(:parser) { Csv::ItemParser }
      let(:item) { Item.forty_two }

      before(:all) do
        # TODO: Use a fixture instead
        described_class.new('spec/fixtures/suppliers.csv').perform do |f|
          Csv::SupplierParser.new(f).perform
        end
      end

      it 'stores Items into DB' do
        described_class.new(file).perform do |f|
          parser.new(f).perform
        end

        expect(Item.count).to eq 100_000

        expect(item.sku_id).to eq 42
        expect(item.price).to eq 10.25
        expect(item.supplier_external_id).to eq 175
      end
    end
  end
end
