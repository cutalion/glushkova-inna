namespace :photo_uploader do
  desc "Recreates versions fo existent images"
  task recreate_versions: :environment do
    Photo.all.each do |photo|
      photo.image.cache_stored_file!
      photo.image.retrieve_from_cache! photo.image.cache_name
      photo.image.recreate_versions!
    end
  end
end
