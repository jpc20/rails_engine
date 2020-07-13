class ChangeQuantityToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :invoice_items, :quantity, 'integer USING CAST(quantity AS integer)'
  end
end
