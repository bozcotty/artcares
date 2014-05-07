class AddSampleArtworksToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sample_work_1, :string
    add_column :users, :sample_work_2, :string
    add_column :users, :sample_work_3, :string
    add_column :users, :sample_work_4, :string
  end
end
