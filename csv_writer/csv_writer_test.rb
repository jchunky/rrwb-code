require_relative "csv_writer"
require "test/unit"

class CsvWriterTest < Test::Unit::TestCase
  def test_writer
    writer = CsvWriter.new
    lines = []
    lines << []
    lines << ["only one field"]
    lines << %w[two fields]
    lines << ["", "contents", "several words included"]
    lines << [",", "embedded , commas, included", "trailing,"]
    lines << ['"', 'embedded " quotes', 'multiple """ quotes""']
    lines << ['mixed commas, and "quotes"', "simple field"]

    actual = writer.render_lines(lines)

    assert_equal <<~EXPECTED.rstrip, actual

      only one field
      two,fields
      ,contents,several words included
      ",","embedded , commas, included","trailing,"
      """","embedded "" quotes","multiple """""" quotes"""""
      "mixed commas, and ""quotes""",simple field
    EXPECTED
  end
end
