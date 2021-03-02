class Product < ApplicationRecord
  self.primary_key = :reference

  validates :reference, :name, :category, :price, presence: true
  validates :price, numericality: true, format: { with: /\A\d{1,6}(\.\d{1,2})?\z/ }
end
