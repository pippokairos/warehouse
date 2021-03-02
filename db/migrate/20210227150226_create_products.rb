class CreateProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :products, id: false, primary_key: :reference do |t|
      t.string :reference, null: false
      t.string :name, null: false
      t.string :category, null: false
      t.decimal :price, precision: 8, scale: 2, null: false # Up to 1M, increase precision if needed

      t.timestamps
    end
    execute 'ALTER table products ADD PRIMARY KEY (reference)'
  end

  def down
    drop_table :products
  end
end
