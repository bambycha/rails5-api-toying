describe Item do
  describe 'Database' do
    it { is_expected.to have_db_column(:sku_id).of_type(:integer) }
    it { is_expected.to have_db_column(:supplier_external_id).of_type(:integer) }
    it { is_expected.to have_db_column(:price_cents).of_type(:integer) }
    it { is_expected.to have_db_column(:price_currency).of_type(:string).with_options(null: false, default: 'USD') }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

    it { is_expected.to have_db_index(:supplier_external_id) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :supplier }
  end

  describe 'Validations' do
    it { is_expected.to monetize(:price).allow_nil }
  end
end
