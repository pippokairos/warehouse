require "test_helper"

class RouterTest < ActiveSupport::TestCase
  test "product with reference only should not match any criteria definition" do
    product = Product.new(reference: "A1")
    assert_nil Router.new(product).criteria_definition
  end

  test "product with specified reference and category should match the only possible criteria definition" do
    product = Product.new(reference: "A1", category: "Category A1")
    assert "London", get_destination(product)
  end

  test "product with reference, category and price should match the only possible criteria definition" do
    product = Product.new(reference: "B1", category: "Category B1", price: 10)
    assert "Rome", get_destination(product)
  end

  test "product matching more than a criteria definition should be assigned to the most specific one" do
    product = Product.new(reference: "B1", price: 5)
    assert "Madrid", get_destination(product)
  end

  private

  def get_destination(product)
    Router.new(product)&.criteria_definition&.destination
  end
end
