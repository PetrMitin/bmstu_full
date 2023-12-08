require "test_helper"
require_relative '../../app/controllers/calc_controller'

class ResultTest < ActiveSupport::TestCase
  test "unable to add same result to db twice" do
    result = Result.new(n: 1, m: 2, nod: 1, nok: 2)
    assert result.save

    duplicate_result = Result.new(n: 1, m: 2, nod: 3, nok: 4)
    assert_not duplicate_result.save
  end

  test "nok and nod are different for different n and m" do
    result1 = Result.new(n: 1, m: 2, nod: 1, nok: 2)
    result2 = Result.new(n: 2, m: 3, nod: 1, nok: 2)
    assert result1.save
    assert result2.save
  end

  test "create and search for result in db" do
    result = Result.new(n: 1, m: 2, nod: 1, nok: 2)
    assert result.save
    assert_equal result, Result.find_by(n: 1, m: 2)
  end

  test "delete db content" do
    Result.delete_all
    assert_equal 0, Result.count
  end
end
