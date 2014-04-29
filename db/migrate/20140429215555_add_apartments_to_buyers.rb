class AddApartmentsToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :address_apartment, :string
    add_column :buyers, :shipping_address_apartment, :string
  end
end
