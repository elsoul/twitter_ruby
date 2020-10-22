RSpec.describe TwitterRuby do
  it "has a version number" do
    expect(TwitterRuby::VERSION).not_to be nil
  end

  describe "Configuration" do
    it "Should be able to set configuration" do
      TwitterRuby.configure do |config|
        config.consumer_key = "abc123"
        config.consumer_secret = "abc123"
        config.access_token = "abc123"
        config.access_token_secret = "abc123"
      end

      expect(TwitterRuby.configuration.access_token).to eq "abc123"
    end
  end
end
