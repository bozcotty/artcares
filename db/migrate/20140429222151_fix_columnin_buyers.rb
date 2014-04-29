class FixColumninBuyers < ActiveRecord::Migration
  def up
    rename_column :buyers, :shipping_address_line1, :shipping_address_line_1
  end

  def down
  end
end
