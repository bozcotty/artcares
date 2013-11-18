class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_num
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip_code
      #how do i relate these to the user id already assigned in devise:users? what is the uid in attr_accessible in user.rb?
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :art_website
      t.string :type_of_artist
      t.text :artist_statement
    end
      
  end

  
end
