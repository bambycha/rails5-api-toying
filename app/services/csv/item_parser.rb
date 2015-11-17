class Csv::ItemParser
  def initialize(file)
    @file = file
    @columns = %w(sku_id supplier_external_id price_cents created_at updated_at)
  end

  attr_reader :file, :columns

  def perform
    Item.copy_from file, header: false, columns: columns do |row|
      row[1] = row[1][1..10].to_i
      row[2] = [row.last.to_f, 100].reduce(:*).to_i
      row[3] = Time.zone.now
      row[4] = Time.zone.now
      row.slice! columns.count..-1
    end
  end
end
