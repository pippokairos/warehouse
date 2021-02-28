require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product shoud be valid if price is 19.99" do
    product = Product.new(reference: "A001", name: "A001", category: "Electronics", price: 19.99)
    assert product.valid?
  end

  test "product shoud not be valid if price is not numeric" do
    product = Product.new(reference: "A001", name: "A001", category: "Electronics", price: "Not a number")
    assert_not product.valid?
  end
end
