# config/initializers/geocoder.rb
Geocoder.configure do |config|

  # geocoding service (see below for supported options):
  #config.lookup = :google #:yahoo

  # to use an API key:
  #config.api_key = "..."

  # geocoding service request timeout, in seconds (default 3):
  config.timeout = 30

  # set default units to kilometers:
  #config.units = :km


  # use HTTPS for geocoding service connections:
  #Geocoder::Configuration.use_https = true

  # language to use (for search queries and reverse geocoding):
  #Geocoder::Configuration.language = :de

  # use a proxy to access the service:
  #Geocoder::Configuration.http_proxy  = "127.4.4.1"
  #Geocoder::Configuration.https_proxy = "127.4.4.2" # only if HTTPS is needed

  # caching (see below for details):
  #config.cache = Redis.new
  #config.cache_prefix = "..."

end