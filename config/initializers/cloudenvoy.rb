Cloudenvoy.configure do |config|
  #
  # GCP Configuration.
  # These values do not matter much in development when using the gcloud pub/sub emulator.
  #
  config.gcp_project_id = 'some-project'
  config.gcp_sub_prefix = 'my-app'
  # config.gcp_project_id = 'boreal-physics-375714'
  # config.gcp_sub_prefix = 'my-app'

  #
  # Adapt the server port to be the one used by your Rails web process
  #
  config.processor_host = 'http://localhost:3001'
  # config.processor_host = 'https://d38c-2c0f-fe38-2323-3f30-a8c2-ee5d-c653-9f71.eu.ngrok.io'
  # config.mode = :production
end
