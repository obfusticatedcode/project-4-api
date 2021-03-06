# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ['http://localhost:7000', 'https://intense-oasis-59348.herokuapp.com', 'https://boiling-reaches-88375.herokuapp.com', 'https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19']

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
