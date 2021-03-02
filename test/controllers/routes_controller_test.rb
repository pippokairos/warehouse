require "test_helper"

class RoutesControllerTest < ActionDispatch::IntegrationTest
  describe "GET routes#index" do
    describe "success" do
      test "should get the routes page" do
        get routes_path
        assert_select "h1", "Routes"
      end
    end
  end

  describe "POST routes#search" do
    describe "success" do
      test "should show the destination for an existing product" do
        post search_routes_path, params: {
          reference: "001"
        }
        assert_select "h5", /Destination/
      end

      test "should show an alert if product not found" do
        post search_routes_path, params: {
          reference: "Non existing"
        }
        assert_select ".alert-danger", /Product "Non existing" not found/
      end
    end
  end
end
