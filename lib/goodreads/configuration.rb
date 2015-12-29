module Goodreads
  # Defines the global configuration
  #
  # options[:api_key]    - Account API key
  # options[:api_secret] - Account API secret
  #
  def self.configure(options = nil)
    self.configuration = Goodreads::Configuration.new(options)
  end

  # Resets the global configuration
  #
  def self.reset_configuration
    configuration.reset if configuration
  end

  class Configuration
    attr_accessor :api_key
    attr_accessor :api_secret

    def initialize(options)
      raise ArgumentError, 'Options hash required.' unless options.is_a?(Hash)
      self.api_key    = options[:api_key]
      self.api_secret = options[:api_secret]
    end

    def empty?
      api_key.nil?
    end

    def to_hash
      hash = {}
      hash[:api_key]    = api_key    if api_key.present?
      hash[:api_secret] = api_secret if api_secret.present?
      hash
    end

    def reset
      self.api_key    = nil
      self.api_secret = nil
      to_hash
    end
  end
end
