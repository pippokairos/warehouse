require "test_helper"

class RouterTest < ActiveSupport::TestCase
  test "product matching reference, category and price should get the only destination possible" do
    assert "Amsterdam", get_destination(products("A1"))
  end

  test "product matching reference only should get the only destination possible" do
    assert "Berlin", get_destination(products("C1"))
  end

  test "product matching category only should get the only destination possible" do
    assert "Moscow", get_destination(products("D1"))
  end

  test "product matching max price only should get the only destination possible" do
    assert "Paris", get_destination(products("C1"))
  end

  test "product matching more than a criteria definition should be assigned to the most specific one" do
    assert "Madrid", get_destination(products("B1"))
  end

  test "product matching no criteria definition, should not get a destination" do
    assert_nil get_destination(products("E1"))
  end

  private

  def get_destination(product)
    Router.new(product)&.criteria_definition&.destination
  end
end
