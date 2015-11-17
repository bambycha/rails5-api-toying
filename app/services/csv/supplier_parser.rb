class Csv::SupplierParser
  def initialize(file)
    @file = file
    @columns = %w(external_id name created_at updated_at)
  end

  attr_reader :file, :columns

  def perform
    Supplier.copy_from file, header: false, columns: columns do |row|
      row[0] = row.first[1..10].to_i
      2.times { row << Time.zone.now }
    end
  end
end
