describe 'Supplier API' do
  describe '[GET] /suppliers' do
    let!(:supplier_1) { create :supplier }
    let!(:supplier_2) { create :supplier }
    let!(:supplier_3) { create :supplier, items: [build(:item)] }

    it 'renders index action' do
      get_resource '/v1/suppliers'

      expect(json.to_json).to be_json_eql(
        [{ 'id' => 1, 'name' => 'Name 1', 'external_id' => 1, 'items' => [] },
         { 'id' => 2, 'name' => 'Name 2', 'external_id' => 2, 'items' => [] },
         { 'id' => 3, 'name' => 'Name 3', 'external_id' => 3, 'items' => [
           { 'id' => 1, 'sku_id' => 1, 'price' => nil }
         ] }].to_json)
      expect(response.status).to eq 200
    end
  end
end
