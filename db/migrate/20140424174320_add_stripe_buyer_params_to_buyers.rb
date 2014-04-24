class AddStripeBuyerParamsToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :address_line_1, :string
    add_column :buyers, :address_zip, :string
    add_column :buyers, :address_city, :string
    add_column :buyers, :address_state, :string
    add_column :buyers, :address_country, :string
    add_column :buyers, :address_country_code, :string
    add_column :buyers, :shipping_name, :string
    add_column :buyers, :shipping_address_line1, :string
    add_column :buyers, :shipping_address_zip, :string
    add_column :buyers, :shipping_address_city, :string
    add_column :buyers, :shipping_address_state, :string
    add_column :buyers, :shipping_address_country, :string
    add_column :buyers, :shipping_address_country_code, :string
  end
end
