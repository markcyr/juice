CarrierWave.configure do |config|
config.fog_credentials = {
    :provider                           => 'Google',
<<<<<<< HEAD

    :google_storage_access_key_id       => 'GOOGLE_STORAGE_KEY',
    :google_storage_secret_access_key   => 'GOOGLE_STORAGE_SECRET'

}
config.fog_directory = 'bucketjuice'

end
