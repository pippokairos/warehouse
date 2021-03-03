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
    criteria_definition = CriteriaDefinition.new(references: ["Test"], destination: "Destination Test")
    assert 1, criteria_definition.degree_of_specificity

    criteria_definition = CriteriaDefinition.new(categories: ["Test"], destination: "Destination Test")
    assert 1, criteria_definition.degree_of_specificity

    criteria_definition = CriteriaDefinition.new(max_price: 20, destination: "Destination Test")
    assert 1, criteria_definition.degree_of_specificity
  end

  test "degree of specificity should return 2 if two fields are present" do
    criteria_definition = CriteriaDefinition.new(references: ["Test"], categories: ["Test"], destination: "Destination Test")
    assert 2, criteria_definition.degree_of_specificity

    criteria_definition = CriteriaDefinition.new(categories: ["Test"], max_price: 20, destination: "Destination Test")
    assert 2, criteria_definition.degree_of_specificity

    criteria_definition = CriteriaDefinition.new(references: ["Test"], max_price: 20, destination: "Destination Test")
    assert 2, criteria_definition.degree_of_specificity
  end

  test "degree of specificity should return 3 if all the fields are present" do
    criteria_definition = CriteriaDefinition.new(
      references: ["Test"], categories: ["Test"], max_price: 20, destination: "Destination Test"
    )
    assert 3, criteria_definition.degree_of_specificity
  end
end
