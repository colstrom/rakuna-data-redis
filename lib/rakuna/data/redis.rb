require 'contracts'
require 'redis'

module Rakuna
  module Data
    # Mixin to expose Redis to resources
    module Redis
      include Contracts

      Contract None => String
      def redis_url
        @redis_url ||= ENV['REDIS_URL'] || ENV.fetch('REDIS_PORT', 'tcp://127.0.0.1:6379').sub('tcp://', 'redis://')
      end

      Contract None => ::Redis
      def redis
        @redis ||= ::Redis.new(url: redis_url)
      end
    end
  end
end
