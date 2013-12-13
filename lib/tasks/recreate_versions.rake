task recreate_versions!: :environment do 
  Artwork.all.each do |artwork|
    puts "starting #{artwork.title}"
    artwork.art_image_1.recreate_versions!
    puts "finished #{artwork.title}"
  end
end
