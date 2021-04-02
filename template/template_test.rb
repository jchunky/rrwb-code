require "test/unit"
require_relative "template"

class TemplateTest < Test::Unit::TestCase
  include Template

  def test_missing_interval
    expected = "Code is 5678901234; alt code is 56789-012"

    actual = template("Code is %CODE%; alt code is %ALTCODE%", "5678901234")

    assert_equal expected, actual
  end
end
