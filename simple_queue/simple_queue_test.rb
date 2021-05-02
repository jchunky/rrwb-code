require "test/unit"
require "active_support/all"
require_relative "simple_queue"

class SimpleQueueTest < Test::Unit::TestCase
  def test_q
    q = []
    q.push("E1")
    q.push("E2")
    assert_equal "E1", q.shift
    assert_equal "E2", q.shift
    assert_equal 0, q.length

    q = SimpleQueue.new
    q.add_rear("E1")
    q.add_rear("E2")
    assert_equal "E1", q.remove_front
    assert_equal "E2", q.remove_front
    assert_equal 0, q.length
  end
end
