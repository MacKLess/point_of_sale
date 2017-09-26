class CreateProductsAndPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table(:products) do |t|
      t.column(:description, :string)
      t.column(:price, :float)
      t.column(:purchase_id, :integer)
      
      t.timestamps
    end

    create_table(:purchases) do |t|
      t.column(:customer, :string)
      t.column(:date, :date)

      t.timestamps
    end
  end
end
