class RemoveSampleArtworksFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :sample_work_1
    remove_column :users, :sample_work_2
    remove_column :users, :sample_work_3
  end
end
