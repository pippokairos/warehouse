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

  test "degree of specificity should return 1 if only one field is present" do
    assert 1, criteria_definitions("London").degree_of_specificity
    assert 1, criteria_definitions("Berlin").degree_of_specificity
    assert 1, criteria_definitions("Paris").degree_of_specificity
    assert 1, criteria_definitions("Moscow").degree_of_specificity
  end

  test "degree of specificity should return 2 if two fields are present" do
    assert 2, criteria_definitions("Madrid").degree_of_specificity
  end

  test "degree of specificity should return 3 if all the fields are present" do
    assert 3, criteria_definitions("Amsterdam").degree_of_specificity
    assert 3, criteria_definitions("Rome").degree_of_specificity
  end
end
