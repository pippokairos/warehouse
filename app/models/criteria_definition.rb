class CriteriaDefinition < ApplicationRecord

  validates :destination, presence: true
  validates :max_price, numericality: true, format: { with: /\A\d{1,6}(\.\d{1,2})?\z/ }, allow_nil: true

  before_save :strip_and_sort_array_fields

  private

  def strip_and_sort_array_fields
    [:references, :categories].each do |attribute|
      if self[attribute].present?
        value = self[attribute].map(&:strip).reject!(&:blank?)&.sort
        self[attribute] = value.blank? ? nil : value
      end
    end
  end

end
