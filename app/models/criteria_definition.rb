class CriteriaDefinition < ApplicationRecord

  validates :destination, presence: true
  validates :max_price, numericality: true, format: { with: /\A\d{1,6}(\.\d{1,2})?\z/ }, allow_nil: true
  validates_uniqueness_of :references, scope: [:categories, :max_price],
    message: "not unique in the scope of Categories and Max price"

  before_validation :strip_and_sort_array_fields

  # Used to determine the best fitting criteria_definition for a product
  def degree_of_specificity
    [references, categories, max_price].map do |attribute|
      attribute.blank? ? 0 : 1
    end.sum
  end

  private

  def strip_and_sort_array_fields
    [:references, :categories].each do |attribute|
      if self[attribute].present?
        value = self[attribute].map(&:strip).reject(&:blank?)&.sort
        self[attribute] = value.blank? ? nil : value
      end
    end
  end

end
