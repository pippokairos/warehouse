require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  describe "GET products#index" do
    describe "success" do
      test "should get the products list page" do
        get products_path
        assert_select "h1", "Products list"
      end

      test "should get all the products" do
        get products_path
        assert_select "table tbody tr", Product.count
      end
    end
  end

  describe "GET products#new" do
    describe "success" do
      before do 
        get new_product_path
      end

      test "should get the new product page" do
        assert_select "h1", "New product"
      end

      test "should render the form" do
        [:reference, :name, :category, :price].each do |attribute|
          assert_select "form input[name='product[#{attribute}]']"
        end
      end
    end
  end

  describe "GET products#edit" do
    describe "success" do
      before do 
        get edit_product_path(Product.last)
      end

      test "should get the edit product page" do
        assert_select "h1", /Edit product/
      end

      test "should render the form" do
        [:reference, :name, :category, :price].each do |attribute|
          assert_select "form input[name='product[#{attribute}]']"
        end
      end
    end
  end

  describe "GET products#show" do
    describe "success" do
      before do
        get product_path(Product.last)
      end

      test "should get the show product page" do
        assert_select "h1", "Product #{Product.last.reference}"
      end
    end
  end

  describe "POST products#create" do
    describe "success" do
      test "should create a new product if that's valid" do
        assert_difference "Product.count", 1 do
          post products_path, params: {
            product: {
              reference: "NEW",
              name: "Test name",
              category: "Test category",
              price: 10
            }
          }
        end
        assert_redirected_to product_path(Product.find_by_reference("NEW"))
      end
    end

    describe "failure" do
      test "shouldn't create a new product if that's invalid" do
        assert_difference "Product.count", 0 do
          post products_path, params: {
            product: {
              reference: "NEW",
              name: "Test name",
              category: "Test category",
              price: "Not a number"
            }
          }
        end
        assert_select "div.alert-danger", /Product not valid/
      end
    end
  end

  describe "PATCH products#update" do
    describe "success" do
      test "should update a product if that's valid" do
        product = Product.last
        patch product_path(product), params: {
          product: {
            reference: "NEW",
            name: "Test name",
            category: "Test category",
            price: 10
          }
        }
        assert product.reference, "NEW"
        assert_redirected_to product_path("NEW")
      end
    end

    describe "failure" do
      test "shouldn't update a product if that's invalid" do
        product = Product.last
        patch product_path(product), params: {
          product: {
            reference: "NEW",
            name: "Test name",
            category: "Test category",
            price: "Not a number"
          }
        }
        assert_select "div.alert-danger", /Product not valid/
      end
    end
  end

  describe "DELETE products#destroy" do
    describe "success" do
      test "should delete a product" do
        product = Product.last
        assert_difference "Product.count", -1 do
          delete product_path(product)
        end
        assert_redirected_to products_path
        follow_redirect!
        assert_select "div.alert-success", /Product #{product.reference} deleted/
      end
    end
  end
end
