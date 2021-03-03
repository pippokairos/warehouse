class Router

  attr_accessor :product, :criteria_definition

  def initialize(product)
    @product = product
    calculate!
  end

  def calculate!
    matching_criteria_definitions = CriteriaDefinition
      .where(in_array_condition(product.reference, "references"))
      .where(in_array_condition(product.category, "categories"))
      .where("max_price IS NULL OR max_price >= #{product.price}")
    @criteria_definition = matching_criteria_definitions.max_by(&:degree_of_specificity)
  end

  private

  def in_array_condition(value, field)
    "criteria_definitions.#{field} IS NULL OR '#{value}' = ANY(criteria_definitions.#{field})"
  end
end
