require "test_helper"

describe CriteriaDefinitionsController do
    describe "GET criteria_definitions#index" do
    describe "success" do
      test "should get the criteria definitions list page" do
        get criteria_definitions_path
        assert_select "h1", "Criteria definitions list"
      end

      test "should get all the criteria definitions" do
        get criteria_definitions_path
        assert_select "table tbody tr", CriteriaDefinition.count
      end
    end
  end

  describe "GET criteria_definitions#new" do
    describe "success" do
      before do 
        get new_criteria_definition_path
      end

      test "should get the new criteria definition page" do
        assert_select "h1", "New criteria definition"
      end

      test "should render the form" do
        ["[references][]", "[categories][]", "[max_price]", "[destination]"].each do |attribute|
          assert_select "form input[name='criteria_definition#{attribute}']"
        end
      end
    end
  end

  describe "GET criteria_definitions#edit" do
    describe "success" do
      before do 
        get edit_criteria_definition_path(CriteriaDefinition.last)
      end

      test "should get the edit criteria definition page" do
        assert_select "h1", /Edit criteria definition/
      end

      test "should render the form" do
        ["[references][]", "[categories][]", "[max_price]", "[destination]"].each do |attribute|
          assert_select "form input[name='criteria_definition#{attribute}']"
        end
      end
    end
  end

  describe "GET criteria_definitions#show" do
    describe "success" do
      before do
        get criteria_definition_path(CriteriaDefinition.last)
      end

      test "should get the show criteria definition page" do
        assert_select "h1", "Criteria definition #{CriteriaDefinition.last.id}"
      end
    end
  end

  describe "POST criteria_definitions#create" do
    describe "success" do
      test "should create a new criteria definition if that's valid" do
        assert_difference "CriteriaDefinition.count", 1 do
          post criteria_definitions_path, params: {
            criteria_definition: {
              references: ["Reference test"],
              categories: ["Category test"],
              max_price: 20,
              destination: "New destination"
            }
          }
        end
        assert_redirected_to criteria_definition_path(CriteriaDefinition.last)
      end
    end

    describe "failure" do
      test "shouldn't create a new criteria definition if that's invalid" do
        assert_difference "CriteriaDefinition.count", 0 do
          post criteria_definitions_path, params: {
            criteria_definition: {
              reference: "NEW",
              name: "Test name",
              category: "Test category",
              price: "Not a number"
            }
          }
        end
        assert_select "div.alert-danger", /Criteria definition not valid/
      end
    end
  end

  describe "PATCH criteria_definitions#update" do
    describe "success" do
      test "should update a criteria definition if that's valid" do
        criteria_definition = CriteriaDefinition.last
        patch criteria_definition_path(criteria_definition), params: {
          criteria_definition: {
            references: ["Reference test"],
            categories: ["Category test"],
            max_price: 20,
            destination: "New destination"
          }
        }
        assert criteria_definition.destination, "New destination"
        assert_redirected_to criteria_definition_path(criteria_definition)
      end
    end

    describe "failure" do
      test "shouldn't update a criteria definition if that's invalid" do
        criteria_definition = CriteriaDefinition.last
        patch criteria_definition_path(criteria_definition), params: {
          criteria_definition: {
            references: ["Reference test"],
            categories: ["Category test"],
            max_price: 20,
            destination: nil
          }
        }
        assert_select "div.alert-danger", /Criteria definition not valid/
      end
    end
  end

  describe "DELETE criteria_definitions#destroy" do
    describe "success" do
      test "should delete a criteria definition" do
        criteria_definition = CriteriaDefinition.last
        assert_difference "CriteriaDefinition.count", -1 do
          delete criteria_definition_path(criteria_definition)
        end
        assert_redirected_to criteria_definitions_path
        follow_redirect!
        assert_select "div.alert-success", /Criteria definition #{criteria_definition.id} deleted/
      end
    end
  end
end
