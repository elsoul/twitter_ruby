require "twitter_ruby/version"
require "twitter"

module TwitterRuby
  class Error < StandardError; end
  class << self
    attr_accessor :configuration

    def update tweet: "Test Tweet from `twitter_ruby` gem!"
      tw(access_token: "", access_token_secret: "").update tweet ? "Posted : #{tweet}" : "Something Wrong..."
    rescue StandardError => error
      error
    end

    def tw access_token: "token", access_token_secret: "secret"
      Twitter::REST::Client.new do |config|
        config.consumer_key        = TwitterRuby.configuration.consumer_key
        config.consumer_secret     = TwitterRuby.configuration.consumer_secret
        config.access_token        = access_token
        config.access_token_secret = access_token_secret
      end
    rescue StandardError => error
      error
    end

    def self.configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :consumer_key, :consumer_secret

    def initialize
      @consumer_key = nil
      @consumer_secret = nil
    end
  end
end
