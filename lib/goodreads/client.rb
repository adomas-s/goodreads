require 'pry'
require 'goodreads/client'
require 'goodreads/client/books'
require 'goodreads/client/reviews'
require 'goodreads/client/authors'
require 'goodreads/client/users'
require 'goodreads/client/shelves'
require 'goodreads/client/authorized'
require 'goodreads/client/groups'
require 'goodreads/client/friends'

module Goodreads
  class Client
    include Goodreads::Request
    include Goodreads::Books
    include Goodreads::Reviews
    include Goodreads::Authors
    include Goodreads::Users
    include Goodreads::Shelves
    include Goodreads::Authorized
    include Goodreads::Groups
    include Goodreads::Friends

    # attr_reader :api_key, :api_secret, :oauth_token

    # Initialize a Goodreads::Client instance
    #
    # options[:oauth_token] - OAuth access token (optional, required for some calls)
    #
    def initialize(options = nil)
      if options
        Goodreads.new(options)
      else
        validate_configuration
        # @oauth_token = options[:oauth_token]
      end
    end

    private

    def validate_configuration
      raise Goodreads::ConfigurationError, 'Options hash required.' if configuration_empty?
    end

    def configuration_empty?
      Goodreads.configuration.nil? || Goodreads.configuration.empty?
    end
  end
end
