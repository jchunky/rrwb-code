require "stringio"
require "test/unit"
require_relative "csv_writer"

class CsvWriterTest < Test::Unit::TestCase
  def test_writer
    out = StringIO.new
    writer = CsvWriter.new(out)
    lines = []
    lines << []
    lines << ["only one field"]
    lines << %w[two fields]
    lines << ["", "contents", "several words included"]
    lines << [",", "embedded , commas, included", "trailing,"]
    lines << ['"', 'embedded " quotes', 'multiple """ quotes""']
    lines << ['mixed commas, and "quotes"', "simple field"]

    writer.write(lines)

    assert_equal <<~EXPECTED, out.string

      only one field
      two,fields
      ,contents,several words included
      ",","embedded , commas, included","trailing,"
      """","embedded "" quotes","multiple """""" quotes"""""
      "mixed commas, and ""quotes""",simple field
    EXPECTED
  end
end
