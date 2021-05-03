require "stringio"
require "test/unit"

require_relative "person"

class PersonClient < Test::Unit::TestCase
  def client1(out, person)
    out.write(person.full_name)
  end

  def client2(person)
    person.citation_name
  end

  def client3(out, person)
    out.write(person.citation_name)
  end

  def client4(person)
    person.citation_name
  end

  def test_clients
    bobSmith = Person.new("Smith", "Bob", nil)
    jennyJJones = Person.new("Jones", "Jenny", "J")

    out = StringIO.new
    client1(out, bobSmith)
    assert_equal("Bob Smith", out.string)

    out = StringIO.new
    client1(out, jennyJJones)
    assert_equal("Jenny J Jones", out.string)

    assert_equal("Smith, Bob", client2(bobSmith))
    assert_equal("Jones, Jenny J", client2(jennyJJones))

    out = StringIO.new
    client3(out, bobSmith)
    assert_equal("Smith, Bob", out.string)

    out = StringIO.new
    client3(out, jennyJJones)
    assert_equal("Jones, Jenny J", out.string)

    assert_equal("Smith, Bob", client4(bobSmith))
    assert_equal("Jones, Jenny J", client4(jennyJJones))
  end
end
