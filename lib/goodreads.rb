require 'goodreads/version'
require 'goodreads/errors'
require 'goodreads/configuration'
require 'goodreads/request'
require 'goodreads/client'

module Goodreads
  class << self
    attr_accessor :configuration
  end

  # Create a new Goodreads::Client instance
  #
  def self.new(options = nil)
    self.configuration = Goodreads::Configuration.new(options)
    Goodreads::Client.new
  end
end
