require 'spec_helper'

describe 'Goodreads' do
  describe '.new' do
    it 'returns a new client instance' do
      expect(Goodreads.new(api_key: 'FOO', api_secret: 'BAR')).to be_a(Goodreads::Client)
    end
    it 'raises ConfigurationError without parameters' do
      expect { Goodreads.new }.to raise_error(ArgumentError, 'Options hash required.')
    end
  end

  describe '.configure' do
    let(:configure) { Goodreads.configure(api_key: 'FOO', api_secret: 'BAR') }

    it 'generally works' do
      expect { configure }.to_not raise_error
    end
    it 'sets the api_key' do
      configure
      expect(Goodreads.configuration.api_key).to eql('FOO')
    end
    it 'sets the api_secret' do
      configure
      expect(Goodreads.configuration.api_secret).to eql('BAR')
    end

    it 'raises ConfigurationError without parameters' do
      expect { Goodreads.configure }.to raise_error(ArgumentError, 'Options hash required.')
    end
    it 'raises ConfigurationError with nil config parameter' do
      expect { Goodreads.configure(nil) }.to raise_error(ArgumentError, 'Options hash required.')
    end
    it 'raises ConfigurationError with non-hash config parameter' do
      expect { Goodreads.configure('foo') }.to raise_error(ArgumentError, 'Options hash required.')
    end
  end

  describe '.configuration' do
    before do
      Goodreads.configure(api_key: 'FOO', api_secret: 'BAR')
    end

    let(:config) { Goodreads.configuration }

    it 'generally works' do
      expect { config }.to_not raise_error
    end
    it 'returns api_key' do
      expect(config.api_key).to eql('FOO')
    end
    it 'returns api_secret' do
      expect(config.api_secret).to eql('BAR')
    end
  end

  describe '.reset_configuration' do
    before do
      Goodreads.configure(api_key: 'FOO', api_secret: 'BAR')
    end

    it 'generally works' do
      expect { Goodreads.reset_configuration }.to_not raise_error
    end
    it 'resets api_key' do
      Goodreads.reset_configuration
      expect(Goodreads.configuration.api_key).to eql(nil)
    end
    it 'resets api_secret' do
      Goodreads.reset_configuration
      expect(Goodreads.configuration.api_secret).to eql(nil)
    end
  end
end
