class AddParamsToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :dataName, :string
    add_column :buyers, :dataImage, :string
    add_column :buyers, :dataLabel, :string
  end
end
