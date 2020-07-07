Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8080', '127.0.0.1:8080'
    resource(
      '/api/*',
      headers: :any,
      credentials: true,
      methods: [:get, :post, :patch, :put, :options]
    )
  end
end