require "twitter_ruby/version"
require "twitter"

module TwitterRuby
  class Error < StandardError; end
  class << self
  attr_accessor :configuration
  end
  class TwitterClient

    def initialize
      @tw = Twitter::REST::Client.new do |config|
        config.consumer_key        = TwitterRuby.configure.consumer_key
        config.consumer_secret     = TwitterRuby.configure.consumer_secret
        config.access_token        = TwitterRuby.configure.access_token
        config.access_token_secret = TwitterRuby.configure.access_token_secret
      end
    end

    def update tweet: "Test Tweet from `twitter_ruby` gem!"
      { status: true, response: "Posted : #{tweet}" } if @tw.update tweet
    rescue StandardError => error
      { status: false, response: "Error : #{error}" }
    end
  end
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

    def initialize
      @consumer_key = nil
      @consumer_secret = nil
      @access_token = nil
      @access_token_secret = nil
    end
  end
end