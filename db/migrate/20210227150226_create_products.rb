class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, id: false, primary_key: :reference do |t|
      t.string :reference, null: false
      t.string :name
      t.string :category
      t.decimal :price, precision: 8, scale: 2 # Up to 1M, increase precision if needed

      t.timestamps
    end
    execute 'ALTER table products ADD PRIMARY KEY (reference)'
  end
end
