class CreateCriteriaDefinitions < ActiveRecord::Migration[6.0]
  def change
    create_table :criteria_definitions do |t|
      t.string :references, array: true
      t.string :categories, array: true
      t.decimal :max_price, precision: 8, scale: 2 # Up to 1M, increase precision if needed
      t.string :destination, null: false

      t.timestamps
    end

    add_index :criteria_definitions, [:references, :categories, :max_price],
      unique: true, name: "index_cd_on_references_and_categories_and_max_price"
  end
end
