CarrierWave.configure do |config|
config.fog_credentials = {
    :provider                           => 'Google',
    :google_storage_access_key_id       => 'GOOGFOWATO54AMBE7K2H',
    :google_storage_secret_access_key   => '4ILJtq6qRLd8GLI0aihqCahqLub0/Ze+xx85Uruk'

}
config.fog_directory = 'juice_project_bitmaker'
end
