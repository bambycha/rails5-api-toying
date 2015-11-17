class CsvFileImport
  def initialize(file)
    @file = file
    @output_filename = "tmp/parse_#{Time.now.to_i}.csv"
  end

  attr_reader :file, :output_filename

  def perform(&parser)
    fix_csv_file_layout

    parser.call(output_filename)
  end

  private

  def fix_csv_file_layout
    Sed::Runner.new(file, output: output_filename) do |s|
      s.replace('¦', ',')
    end
  end
end
