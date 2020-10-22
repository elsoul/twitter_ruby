require "twitter_ruby/version"

module TwitterRuby
  class Error < StandardError; end
  class << self
    attr_accessor :configuration
  end
  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :access_token, :access_token_secret

    def initialize
      @access_token = nil
      @access_token_secret = nil
    end
  end
end