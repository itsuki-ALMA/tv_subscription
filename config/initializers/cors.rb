# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:3000' # Você pode especificar um domínio aqui, por exemplo: 'http://localhost:3000'
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head], # Permite GET, POST e OPTIONS
        credentials: true
    end
  end
  