require "test_helper"

class CriteriaDefinitionTest < ActiveSupport::TestCase
  test "criteria definition shoud be valid if destination is present" do
    criteria_definition = CriteriaDefinition.new(destination: "Destination Test")
    assert criteria_definition.valid?
  end

  test "criteria definition shoud not be valid if destination is missing" do
    criteria_definition = CriteriaDefinition.new(
      references: ["Reference test"],
      categories: ["Category test"],
      max_price: 20,
      destination: nil
    )
    assert_not criteria_definition.valid?
  end
end
